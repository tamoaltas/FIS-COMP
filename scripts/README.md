## Cómo utilizar ssh-setup.sh (Linux)

0. Abre una terminal diferente a tu terminal principal.

1. Corre el programa

```console
bash ssh-setup.sh
```

2. Ingresa el e-mail al que pertenece la cuenta de [GitHub](https://github.com/) a la cual quieres agregar la llave de SSH. Adicionalmente, puedes agregar una contraseña a la llave si así lo deseas.

3. Copia la llave pública que aparece despúes del randomart de tu llave. El programa indica cuál es la llave.

4. Ingresa el texto que copiaste en la sección correspondiente en <strong> SSH and GPG keys </strong> de la configuración de tu perfil. Haz click [aquí](https://github.com/settings/keys) para ir directamente a la configuración.

5. Regresa a la terminal y presiona `ENTER` para continuar y para que el programa inicie un agente de gestión de llaves. Si utilizaste una contraseña al crear tu llave en el <strong>Paso 1</strong>, el agente te pedirá que la ingreses en el <strong>Paso 3</strong>.

¡Listo! Ahora puedes utilizar la funcionalidades de SSH de GitHub en tu sistema. Por ejemplo, puedes clonar un repositorio a través de SSH: 

```console
git clone git@github.com:tamoaltas/FIS-COMP.git
```

6. Presiona `ENTER` dos veces para salir del programa. Esto terminará el proceso del agente de SSH y borrará las llaves que se crearon: `~/.ssh/id_ed25519` y `~/.ssh/id_ed25519.pub`.
