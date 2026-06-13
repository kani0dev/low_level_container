# low_level_container

Estudo sobre containers low-level usando Linux namespaces (`unshare`),
`chroot` e bind mounts — antes de chegar no Docker.

## Arquitetura

```
.
├── Makefile                       # Orquestra os scripts
├── scripts/
│   ├── alpine_install.sh          # Baixa e extrai Alpine minirootfs
│   ├── mount.sh                   # Bind mounts /dev, /proc, /sys
│   ├── create_conteainer.sh       # unshare + chroot → container isolado
│   └── umount.sh                  # Desmonta os binds
└── rootfs/                        # (gerado) Sistema de arquivos Alpine
```

### Conceitos usados

- **unshare** — cria namespaces isolados (mount, PID, UTS, IPC, net, cgroup)
- **chroot** — troca a raiz do sistema de arquivos
- **mount --bind** — expõe /dev, /proc, /sys dentro do container
- **Alpine minirootfs** — imagem mínima usada como sistema base

## Pré-requisitos

- Linux
- `sudo` (para mount/unshare/umount)
- `bash`, `wget`, `tar`

## Como rodar

| Comando         | O que faz                              |
|-----------------|----------------------------------------|
| `make`          | Instala Alpine + monta /dev, /proc, /sys |
| `make install`  | Apenas instala o Alpine                |
| `make run`      | Entra no container (unshare + chroot)  |
| `make clean`    | Desmonta tudo e apaga rootfs/          |

## Como rodar no Windows

Este projeto usa chamadas de sistema **exclusivas do Linux** (`unshare`,
`chroot`, `mount --bind`, Linux namespaces). Não é possível rodar
diretamente no Windows, mas você pode usar o **WSL2** (Windows Subsystem
for Linux).

1. Instale o WSL2 (se ainda não tiver):
   ```
   wsl --install
   ```

2. Abra o terminal WSL (Ubuntu ou outra distro).

3. Instale as dependências:
   ```bash
   sudo apt update && sudo apt install -y wget make
   ```

4. Clone o repositório e rode:
   ```bash
   git clone <url-do-repo>
   cd low_level_container
   make install
   make run
   ```
