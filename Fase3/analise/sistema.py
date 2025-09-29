import csv
from entidades.usuario import Usuario
from entidades.plataforma import Plataforma
from entidades.conteudo import Video, Podcast, Artigo
from entidades.interacao import Interacao

class SistemaAnaliseEngajamento:
    def __init__(self):
        self.__plataformas_registradas = {}
        self.__conteudos_registrados = {}
        self.__usuarios_registrados = {}
        self.__proximo_id_plataforma = 1

    def cadastrar_plataforma(self, nome_plataforma):
        if nome_plataforma not in self.__plataformas_registradas:
            nova = Plataforma(nome_plataforma, self.__proximo_id_plataforma)
            self.__plataformas_registradas[nome_plataforma] = nova
            self.__proximo_id_plataforma += 1
        return self.__plataformas_registradas[nome_plataforma]

    def obter_plataforma(self, nome_plataforma):
        return self.__plataformas_registradas.get(nome_plataforma, self.cadastrar_plataforma(nome_plataforma))

    def listar_plataformas(self):
        return list(self.__plataformas_registradas.values())

    def _carregar_interacoes_csv(self, caminho_arquivo):
        lista = []
        try:
            with open(caminho_arquivo, mode='r', encoding='utf-8') as csvfile:
                leitor = csv.DictReader(csvfile)
                for linha in leitor:
                    lista.append(linha)
        except FileNotFoundError:
            print(f"Erro: O arquivo '{caminho_arquivo}' não foi encontrado.")
            return []
        except Exception as e:
            print(f"Erro ao carregar CSV: {e}")
            return []
        return lista


    def processar_interacoes_do_csv(self, caminho_arquivo):
        linhas = self._carregar_interacoes_csv(caminho_arquivo)
        if not linhas:
            print("Nenhuma linha para processar ou erro ao carregar o CSV.")
            return

        for linha in linhas:
            try:
                id_usuario = int(linha['id_usuario'])
                id_conteudo = int(linha['id_conteudo'])
                nome_conteudo = linha['nome_conteudo']
                timestamp = linha['timestamp_interacao']
                tipo = linha['tipo_interacao']
                valor_duracao = linha['watch_duration_seconds']
                comentario = linha['comment_text']
                nome_plataforma = linha['plataforma']
                duracao = int(valor_duracao) if str(valor_duracao).strip().isdigit() and int(valor_duracao) > 0 else 0
                plataforma = self.obter_plataforma(nome_plataforma)
                tipo_conteudo = None  # Placeholder para o futuro

                # Instanciar sempre como Video, pois não há distinção no CSV
                if id_conteudo not in self.__conteudos_registrados:
                    conteudo = Video(id_conteudo, nome_conteudo, 0)
                    self.__conteudos_registrados[id_conteudo] = conteudo
                else:
                    conteudo = self.__conteudos_registrados[id_conteudo]

                if id_usuario not in self.__usuarios_registrados:
                    usuario = Usuario(id_usuario)
                    self.__usuarios_registrados[id_usuario] = usuario
                else:
                    usuario = self.__usuarios_registrados[id_usuario]

                interacao = Interacao(id_usuario, timestamp, tipo, duracao, comentario, conteudo, plataforma)
                conteudo.adicionar_interacao(interacao)
                usuario.registrar_interacao(interacao)
            except ValueError as ve:
                print(f"Erro de valor ao processar linha: {linha} - {ve}")
            except KeyError as ke:
                print(f"Erro: Coluna '{ke}' não encontrada no CSV na linha: {linha}")
            except Exception as e:
                print(f"Erro inesperado ao processar interação na linha {linha}: {e}")

    def gerar_relatorio_engajamento_conteudos(self, top_n=None):
        if not self.__conteudos_registrados:
            print("Nenhum conteúdo registrado para gerar relatório.")
            return
        print("\n-> -> RESULTADOS DE ENGAJAMENTO DE CONTEÚDOS <- <-\n")
        conteudos_para_relatorio = list(self.__conteudos_registrados.values())
        if top_n:
            conteudos_para_relatorio = sorted(
                conteudos_para_relatorio,
                key=lambda c: c.calcular_total_interacoes_engajamento(),
                reverse=True
            )[:top_n]
        else:
            conteudos_para_relatorio = sorted(
                conteudos_para_relatorio,
                key=lambda c: c.calcular_total_interacoes_engajamento(),
                reverse=True
            )
        for conteudo in conteudos_para_relatorio:
            print(f"ID: {conteudo.id_conteudo} - {conteudo.nome_conteudo}")
            print(f"Total de interações: {conteudo.calcular_total_interacoes_engajamento()}")
            contagem_tipos = conteudo.calcular_contagem_por_tipo_interacao()
            if contagem_tipos:
                print("Interações por tipo:")
                for tipo, qtd in contagem_tipos.items():
                    print(f"  {tipo}: {qtd}")
            tempo_total = conteudo.calcular_tempo_total_consumo()
            if tempo_total > 0:
                tempo_medio = conteudo.calcular_media_tempo_consumo()
                print(f"Tempo total assistido: {tempo_total} segundos ou {self.converter_segundos(tempo_total)}")
                print(f"Média de tempo assistido: {tempo_medio:.2f} segundos")
            comentarios = conteudo.listar_comentarios()
            if comentarios:
                print(f"Quantidade de comentários: {len(comentarios)}")
                for idx, c in enumerate(comentarios):
                    print(f"Comentário {idx+1}: {c}")
            print("\n")

    def gerar_relatorio_atividade_usuarios(self, top_n=None):
        if not self.__usuarios_registrados:
            print("Nenhum usuário registrado para gerar relatório.")
            return
        print("\n-> -> RESULTADOS DE ATIVIDADE DE USUÁRIOS <- <-\n")
        usuarios_para_relatorio = list(self.__usuarios_registrados.values())
        if top_n:
            usuarios_para_relatorio = sorted(
                usuarios_para_relatorio,
                key=lambda u: u.calcular_tempo_total_consumo(),
                reverse=True
            )[:top_n]
        else:
            usuarios_para_relatorio = sorted(
                usuarios_para_relatorio,
                key=lambda u: u.calcular_tempo_total_consumo(),
                reverse=True
            )
        for usuario in usuarios_para_relatorio:
            print(f"Usuário (ID): {usuario.id_usuario}")
            print(f"Número de Interações: {len(usuario.interacoes_realizadas)}")
            contagem = usuario.calcular_contagem_por_tipo_interacao()
            if contagem:
                print("Contagem por tipo de interação:")
                for tipo, qtd in contagem.items():
                    print(f"  {tipo}: {qtd}")
            total_consumo = usuario.calcular_tempo_total_consumo()
            if total_consumo > 0:
                media_consumo = usuario.calcular_media_tempo_consumo()
                print(f"Tempo total assistido: {total_consumo} segundos ou {self.converter_segundos(total_consumo)}")
                print(f"Média de tempo assistido: {media_consumo:.2f} segundos")
            comentarios = usuario.listar_comentarios()
            if comentarios:
                print(f"Quantidade de comentários: {len(comentarios)}")
                for idx, c in enumerate(comentarios):
                    print(f"Comentário {idx+1}: {c}")
            conteudos_unicos = usuario.obter_conteudos_unicos_consumidos()
            if conteudos_unicos:
                print(f"Conteúdos únicos consumidos: {len(conteudos_unicos)}")
            plataformas_frequentes = usuario.plataformas_mais_frequentes(top_n=3)
            if plataformas_frequentes:
                print("Top 3 Plataformas Mais Frequentes:")
                for plat, cont in plataformas_frequentes:
                    print(f"  {plat.nome_plataforma}: {cont} interação(ões)")
            print("\n")

    def gerar_relatorio_top_conteudos_consumidos(self, n=0):
        if not self.__conteudos_registrados:
            print("Nenhum conteúdo registrado.")
            return
        ordenados = sorted(self.__conteudos_registrados.values(), key=lambda c: c.calcular_tempo_total_consumo(), reverse=True)
        top = ordenados if n <= 0 else ordenados[:n]
        print("\n-> -> TOP CONTEÚDOS POR TEMPO TOTAL CONSUMIDO <- <-\n")
        for idx, c in enumerate(top):
            tempo_total = c.calcular_tempo_total_consumo()
            print(f"{idx+1}º. {c.nome_conteudo} ({self.converter_segundos(tempo_total)} consumidos)")

    def gerar_relatorio_plataformas_engajamento(self):
        print("\n-> -> PLATAFORMAS POR ENGAJAMENTO <- <-\n")
        engajamento = {nome: 0 for nome in self.__plataformas_registradas}
        for conteudo in self.__conteudos_registrados.values():
            for interacao in conteudo._interacoes:
                if interacao.tipo_interacao in {'like', 'share', 'comment', 'vote_bbb'}:
                    engajamento[interacao.plataforma_interacao.nome_plataforma] += 1
        plataformas_ordenadas = sorted(engajamento.items(), key=lambda x: x[1], reverse=True)
        for nome, total in plataformas_ordenadas:
            print(f"{nome}: {total} interações de engajamento")

    def gerar_relatorio_conteudos_comentados(self, top_n=None):
        print("\n-> -> CONTEÚDOS MAIS COMENTADOS <- <-\n")
        conteudos = list(self.__conteudos_registrados.values())
        conteudos_ordenados = sorted(conteudos, key=lambda c: len(c.listar_comentarios()), reverse=True)
        if top_n:
            conteudos_ordenados = conteudos_ordenados[:top_n]
        for conteudo in conteudos_ordenados:
            print(f"{conteudo.nome_conteudo}: {len(conteudo.listar_comentarios())} comentários")

    def gerar_relatorio_total_interacoes_por_tipo(self):
        print("\n-> -> TOTAL DE INTERAÇÕES POR TIPO DE CONTEÚDO <- <-\n")
        for conteudo in self.__conteudos_registrados.values():
            contagem = conteudo.calcular_contagem_por_tipo_interacao()
            print(f"{conteudo.nome_conteudo}: {contagem}")

    def gerar_relatorio_tempo_medio_plataforma(self):
        print("\n-> -> TEMPO MÉDIO DE CONSUMO POR PLATAFORMA <- <-\n")
        soma = {}
        contagem = {}
        for conteudo in self.__conteudos_registrados.values():
            for interacao in conteudo._interacoes:
                nome = interacao.plataforma_interacao.nome_plataforma
                soma[nome] = soma.get(nome, 0) + interacao.watch_duration_seconds
                contagem[nome] = contagem.get(nome, 0) + 1
        for nome in soma:
            media = soma[nome] / contagem[nome] if contagem[nome] else 0
            print(f"{nome}: {media:.2f} segundos (média)")

    def gerar_relatorio_qtd_comentarios_por_conteudo(self):
        print("\n-> -> QUANTIDADE DE COMENTÁRIOS POR CONTEÚDO <- <-\n")
        for conteudo in self.__conteudos_registrados.values():
            print(f"{conteudo.nome_conteudo}: {len(conteudo.listar_comentarios())} comentários")

    def converter_segundos(self, total_segundos):
        if not isinstance(total_segundos, (int, float)) or total_segundos < 0:
            return "0:00:00"
        horas = int(total_segundos // 3600)
        minutos = int((total_segundos % 3600) // 60)
        segundos = int(total_segundos % 60)
        return f"{horas}:{minutos:02}:{segundos:02}"
