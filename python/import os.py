import os
import shutil
from pathlib import Path

def backup_save_rdr1_real():
    # O caminho exato da sua pasta de saves
    caminho_save = Path(r"C:\Users\Pichau\AppData\Roaming\.1911\Red Dead Redemption\profile")
    
    # O destino na sua Área de Trabalho
    pasta_desktop = Path(os.path.expanduser("~")) / "Desktop"
    pasta_backup = pasta_desktop / "Backup_Saves_RDR1"
    
    if caminho_save.exists():
        # Cria a pasta na Área de Trabalho se não existir
        pasta_backup.mkdir(parents=True, exist_ok=True)
        
        # Copia tudo que está dentro de 'profile' para a pasta de backup
        shutil.copytree(caminho_save, pasta_backup / "Saves", dirs_exist_ok=True)
        print("==================================================")
        print("Sucesso! O arquivo RDR2SAVE1.SAV foi protegido.")
        print(f"Backup salvo em: {pasta_backup}")
        print("==================================================")
    else:
        print("[Erro] Não foi possível acessar a pasta. Verifique se o caminho mudou.")

if __name__ == "__main__":
    backup_save_rdr1_real()