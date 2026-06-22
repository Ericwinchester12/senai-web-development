class atividade:
    def __init__(self, nome, descricao, data_entrega, nota):
        self._nome = nome
        self._descricao = descricao
        self._data_entrega = data_entrega
        self.__nota = nota

    def exibir(self):
        """Exibe os dados da atividade"""
        print(f"Nome: {self._nome}")
        print(f"Descrição: {self._descricao}")
        print(f"Data: {self._data_entrega}")
        print(f"Nota: {self.__nota}")

#função pra teste se os dados estão printando (dados ficticios.)
exibir_dados = atividade("Atividade Xtranha", "Isso é trap mixtape", "33/03/2033", "777-666")

exibir_dados.exibir()
