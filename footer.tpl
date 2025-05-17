                </div><!-- end content --> {if !$inShoppingCart && 
                $secondarySidebar->hasChildren()} <div class="col-md-3 
                pull-md-left sidebar sidebar-secondary">
                    {include file="$template/includes/sidebar.tpl" 
                    sidebar=$secondarySidebar}
                </div> {/if} <div class="clearfix"></div> </div> </div> 
</section> <!-- Top Footer --> <div class="top-footer">
    <div class="container"> {if $loggedin} <p>Confira todos nossos 
        serviços em <a href="/cart.php" class="btn btn-warning 
        btn-sm">Planos</a></p> {else} <p>Começe agora, jogue quando e 
        onde quiser! <a href="/register.php" class="btn btn-warning 
        btn-sm">Registrar-se</a></p> {/if}
    </div> </div> <!-- Bottom Footer --> <div class="bottom-footer"> 
    <div class="container">
        <div class="row"> <div class="col-md-3"> <div class="contact"> 
                    <h3>Contate-nos</h3> <p>Suporte: 8:00AM - 
                    23:00PM</p> <p>Telefone: 41988509753</p>
                   
                </div> <div class="social"> <a 
                    href="https://www.instagram.com/gamesky_latam/"><i 
                    class="fab fa-instagram"></i></a> <a 
                    href="https://discord.gg/Fg98yfemj9"><i class="fab 
                    fa-discord"></i></a>
                </div> </div> <div class="col-md-2"> <h3>Site</h3> <ul> 
                    <li><a href="">Início</a></li> <li><a 
                    href="">Planos</a></li>
                </ul> </div> <div class="col-md-3"> <h3>Termos de 
                Uso</h3> <ul>
                    <li><a href="termosdeuso.php">Termos</a></li> </ul> 
            </div> <div class="col-md-4">
                <h3>Sobre nós</h3> <p class="text">Na GameSky, 
                construímos nosso negócio com a missão de oferecer 
                acesso a máquinas virtuais para jogos de forma 
                acessível, potente e transparente. Somos gamers de 
                verdade, jogamos nos mesmos sistemas que oferecemos e 
                entendemos na prática o que é necessário para uma 
                experiência de alto desempenho.</p> <img class="logo" 
                width="120" src="{$assetLogoPath}">
            </div> </div> </div> </div> <section id="footer"> <div 
    class="container">
        <p class="pull-left">{lang key="copyrightFooterNotice" 
        year=$date_year company=$companyname}</p> <p 
        class="pull-right"><a href="termosdeuso.php">Terms of 
        Services</a></a></p>
    </div> </section> <button class="button__scroll--up"><span 
class="fas fa-chevron-up"></span></button> <div id="fullpage-overlay" 
class="hidden">
    <div class="outer-wrapper"> <div class="inner-wrapper"> <img 
            src="{$WEB_ROOT}/assets/img/overlay-spinner.svg"> <br> <span 
            class="msg"></span>
        </div> </div> </div> <div class="modal system-modal fade" 
id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog"> <div class="modal-content panel-primary"> 
            <div class="modal-header panel-heading">
                <button type="button" class="close" 
                data-dismiss="modal">
                    <span aria-hidden="true">&times;</span> <span 
                    class="sr-only">{$LANG.close}</span>
                </button> <h4 class="modal-title"></h4> </div> <div 
            class="modal-body panel-body">
                {$LANG.loading} </div> <div class="modal-footer 
            panel-footer">
                <div class="pull-left loader"> <i class="fas 
                    fa-circle-notch fa-spin"></i> {$LANG.loading}
                </div> <button type="button" class="btn btn-default" 
                data-dismiss="modal">
                    {$LANG.close} </button> <button type="button" 
                class="btn btn-primary modal-submit">
                    {$LANG.submit} </button> </div> </div> </div> </div> 
<!-- Main JS --> <script 
src="{$WEB_ROOT}/templates/{$template}/js/main.js?v={$versionHash}"></script> 
<!-- Slick --> <script 
src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js?v={$versionHash}"></script> 
<!-- jQuery --> <script type="text/javascript" 
src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js?v={$versionHash}"></script> 
<!-- OWL Slider --> <script type="text/javascript" 
src="https://cdn.jsdelivr.net/jquery.owlcarousel/1.31/owl.carousel.js?v={$versionHash}"></script> 
<!-- AOS --> <script 
src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> <script>
    AOS.init(); </script> {include 
file="$template/includes/generate-password.tpl"} {$footeroutput} </body> 
</html>
