from analise.sistema import SistemaAnaliseEngajamento

def main():
    sistema = SistemaAnaliseEngajamento()
    sistema.processar_interacoes_do_csv('interacoes_globo.csv')
    sistema.gerar_relatorio_engajamento_conteudos(top_n=5)
    sistema.gerar_relatorio_atividade_usuarios(top_n=5)
    sistema.gerar_relatorio_top_conteudos_consumidos(5)
    sistema.gerar_relatorio_plataformas_engajamento()
    sistema.gerar_relatorio_conteudos_comentados(top_n=5)
    sistema.gerar_relatorio_total_interacoes_por_tipo()
    sistema.gerar_relatorio_tempo_medio_plataforma()
    sistema.gerar_relatorio_qtd_comentarios_por_conteudo()

if __name__ == "__main__":
    main()
