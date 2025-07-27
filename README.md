

# Forward Proxy Configuration

## Description

Ce projet permet de déployer un **proxy HTTP forward** avec Squid dans un conteneur Docker.
Le proxy exige une **authentification utilisateur** (login/mot de passe) et bloque l’accès aux sites listés dans une liste noire.

---

## Étapes d’utilisation
build le image de contaienr avec le Dockerfile
### 1. Lancer le conteneur Docker

```bash
docker run -d --name squid-proxy -p 3128:3128 your-squid-image
```

---

### 2. Configurer la machine cliente

* Configurez le navigateur ou la machine cliente pour utiliser le proxy à l’adresse IP du serveur Docker, sur le port **3128**.
* Exemple : `IP_du_serveur:3128`

---

### 3. Authentification

* Lors de la première connexion à un site via le proxy, vous serez invité à entrer un nom d’utilisateur et un mot de passe.
* Utilisez les identifiants suivants :

| Utilisateur  | Mot de passe |
| ------------ | ------------ |
| utilisateur2 | motdepasse2  |

---

### 4. Filtrage des sites (liste noire)

* Si vous tentez d’accéder à un site web figurant dans la liste noire, l’accès sera **bloqué** automatiquement.

---

## Exemple de cas d’usage

* Vous essayez d’accéder à **YouTube** via le proxy.
  → Vous devez vous authentifier avec l’utilisateur `utilisateur2` et mot de passe `motdepasse2`.
  → L’accès est autorisé.

* Vous essayez d’accéder à un site dans la liste noire (ex: `exampleblocked.com`).
  → L’accès est **bloqué** par le proxy.

---

## Configuration Squid importante

* Fichier de liste noire : `/etc/squid/domaine_bloque.txt`
* Fichier des utilisateurs : `/etc/squid/passwd` (géré avec `htpasswd`)
* Authentification HTTP Basic configurée.

---

## Notes

* Assurez-vous que le port 3128 est ouvert et accessible depuis vos machines clientes.
* Vous pouvez modifier les utilisateurs et mots de passe via la commande `htpasswd`.
* Pour ajouter ou modifier des sites bloqués, éditez le fichier `domaine_bloque.txt` et redémarrez le service Squid.

