$(function () {
    //alert('Aca estamos');
    //GuardamosLocal();
    $('#btnSubir').on("click", function () {
        var PersonaEmail = $('#Email').val();
        var PersonaPassword = $('#Password').val();
        if (PersonaEmail == "") {
            $('#lblMensaje').html('Usted debe introducir PersonaEmail');
            $("#PersonaEmail").focus();
            return false;
        }
        if (PersonaPassword == "") {
            $('#lblMensaje').html('Usted debe introducir PersonaPassword');
            $("#PersonaPassword").focus();
            return false;
        }
        var Persona = { Email: PersonaEmail, Password: PersonaPassword }

        localStorage.setItem('Login', JSON.stringify(Persona));

    });

    function EliminarLocal() {
        //localStorage.setItem('Login', JSON.stringify(Persona));
        var keyName = 'Login';
        storage.removeItem(keyName);
    }
});