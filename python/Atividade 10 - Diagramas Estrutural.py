class atividade:
    def __init__(self, nome, descricao, data_entrega, nota):
        self.nome = nome
        self.descricao = descricao
        self.data_entrega = data_entrega
        self.nota = nota

    def exibir(self):
        """Exibe os dados da atividade"""
        print(f"Nome: {self.nome}")
        print(f"Descrição: {self.descricao}")
        print(f"Data: {self.data_entrega}")
        print(f"Nota: {self.nota}")

#função pra teste se os dados estão printando (dados ficticios.)
exibir_dados = atividade("Atividade Xtranha", "Isso é trap mixtape", "33/03/2033", 777-666)

exibir_dados.exibir()
