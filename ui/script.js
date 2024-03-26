window.addEventListener('message', function(event) {
    if (event.data.type === 'open') {
        console.log('apertura')
        console.log('Nome Player', event.data.name)
        $('#container_pause_menu').show();
        $("#bank").html('<i class="fas fa-credit-card"></i>' + event.data.bank);
        $("#cash").html('<i class="fa-solid fa-wallet"></i>' + event.data.cash);
        $("#job").html('<i class="fas fa-briefcase"></i>' + event.data.job);
        $('#name').html('<i class="fa-solid fa-user"></i>' + ' ' + event.data.name)

    }
});


document.onkeydown = function (event) {
    event = event || window.event;
    if (event.keyCode === 27) {
        $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        console.log('Hai chiuso il Menu');
        $('#container_pause_menu').hide();
    }
};

function map() {
    $.post(`https://${GetParentResourceName()}/map`, JSON.stringify({}));
    $('#container_pause_menu').hide();
}

function settings() {
    $.post(`https://${GetParentResourceName()}/opzioni`, JSON.stringify({}));
    $('#container_pause_menu').hide();
}


function discord() {
    console.log('Discord');
    window.invokeNative('openUrl', 'https://discord.gg/SYfbM5C5KN')
    $.post(`https://${GetParentResourceName()}/discord`, JSON.stringify({}));
    $('#container_pause_menu').hide();
}

function social() {
    console.log('Youtube opening');
    window.invokeNative('openUrl', 'https://www.youtube.com/channel/UCTeMMvVXXVGHJjLRWXTMmDQ')
    $.post(`https://${GetParentResourceName()}/social`, JSON.stringify({}));
    $('#container_pause_menu').hide();
}

function exit() {
    $.post(`https://${GetParentResourceName()}/quit`, JSON.stringify({}));
    $('#container_pause_menu').hide();
}

function resume() {
    $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
    $('#container_pause_menu').hide();
}
