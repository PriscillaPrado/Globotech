from analise.sistema import SistemaAnaliseEngajamento

def main():
    sistema = SistemaAnaliseEngajamento()
    sistema.processar_interacoes_do_csv('interacoes_globo.csv')
    sistema.gerar_relatorio_engajamento_conteudos()
    sistema.gerar_relatorio_atividade_usuarios()
    sistema.gerar_relatorio_top_conteudos_consumidos(5)

if __name__ == "__main__":
    main()