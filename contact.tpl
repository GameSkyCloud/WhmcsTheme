<div class="page contact-page">
    <div class="container">
        <h1>Contact Us</h1>
        <p>Enthusiastically provide access to multidisciplinary communities and reliable quality vectors. Globally administrate robust.</p>
    </div>
</div>
<div class="container">
    <div class="row">
        <section class="larw-body">
            <div class="col-md-3 panel-contact">
                <div class="panel panel-default text-center">
                    <div class="panel-body contact-card">
                        <i class="fad fa-mobile-android-alt fa-2x"></i>
                        <h4>Call Us</h4>
                        <p>+381 62 858 1404</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 panel-contact">
                <div class="panel panel-default text-center">
                    <div class="panel-body contact-card">
                        <i class="fad fa-map-marker-smile fa-2x"></i>
                        <h4>Visit Us</h4>
                        <p>Belgrade, Knez Mihajla 130</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 panel-contact">
                <div class="panel panel-default text-center">
                    <div class="panel-body contact-card">
                        <i class="fad fa-envelope fa-2x"></i>
                        <h4>Mail Us</h4>
                        <p><a href="mailto: radisic00@gmail.com">radisic00@gmail.com</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 panel-contact">
                <div class="panel panel-default text-center">
                    <div class="panel-body contact-card">
                        <i class="fad fa-user-headset fa-2x"></i>
                        <h4>Live Chat</h4>
                        <p>Chat with Us 24/7</p>
                    </div>
                </div>
            </div>
            {if $sent}
                {include file="$template/includes/alert.tpl" type="success" msg=$LANG.contactsent textcenter=true}
            {/if}

            {if $errormessage}
                {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
            {/if}

            {if !$sent}
            <form method="post" action="contact.php" class="form-horizontal" role="form">
                <input type="hidden" name="action" value="send" />

                <div class="form-group">
                    <label for="inputName" class="col-sm-3 control-label">{$LANG.supportticketsclientname}</label>
                    <div class="col-sm-7">
                        <input type="text" name="name" value="{$name}" class="form-control" id="inputName" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-sm-3 control-label">{$LANG.supportticketsclientemail}</label>
                    <div class="col-sm-7">
                        <input type="email" name="email" value="{$email}" class="form-control" id="inputEmail" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputSubject" class="col-sm-3 control-label">{$LANG.supportticketsticketsubject}</label>
                    <div class="col-sm-7">
                        <input type="subject" name="subject" value="{$subject}" class="form-control" id="inputSubject" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputMessage" class="col-sm-3 control-label">{$LANG.contactmessage}</label>
                    <div class="col-sm-7">
                        <textarea name="message" rows="7" class="form-control" id="inputMessage">{$message}</textarea>
                    </div>
                </div>
                {if $captcha}
                    <div class="text-center margin-bottom">
                        {include file="$template/includes/captcha.tpl"}
                    </div>
                {/if}

                <div class="form-group">
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}"><i class="fal fa-paper-plane"></i> {$LANG.contactsend}</button>
                    </div>
                </div>
            </form>
            {/if}
        </section>
    </div>
</div>