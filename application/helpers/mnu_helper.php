<?php
/**
 
 */

function mnu($user){
    $url = base_url();
    return "
                    <!-- partial:partials/_sidebar.html -->
            <nav class=\"sidebar sidebar-offcanvas\" id=\"sidebar\">
                <ul class=\"nav\">
                    <li class=\"nav-item nav-profile\">
                        <a href=\"{$url}\" class=\"nav-link\">
                            <div class=\"profile-image\">
                                <img class=\"img-xs rounded-circle\" src=\"{$url}public/assets/images/faces/face8.jpg\" alt=\"profile image\">
                                <div class=\"dot-indicator bg-success\"></div>
                            </div>
                            <div class=\"text-wrapper\">
                                <p class=\"profile-name\">{$user}</p>
                            </div>
                        </a>
                    </li>
                    <li class=\"nav-item nav-category\">Main Menu</li>
                    <li class=\"nav-item\">
                        <a class=\"nav-link\" href=\"{$url}Main\">
                            <i class=\"menu-icon typcn typcn-document-text\"></i>
                            <span class=\"menu-title\">DASHIBODI</span>
                        </a>
                    </li>
                    <li class=\"nav-item\">
                        <a class=\"nav-link\" href=\"{$url}Wakazi\">
                            <i class=\"menu-icon typcn typcn-document-text\"></i>
                            <span class=\"menu-title\">WAKAZI</span>
                        </a>
                    </li>
                    <li class=\"nav-item\">
                        <a class=\"nav-link\" href=\"{$url}Marafiki\">
                            <i class=\"menu-icon typcn typcn-document-text\"></i>
                            <span class=\"menu-title\">MARAFIKI</span>
                        </a>
                    </li>
                      <li class=\"nav-item\">
                        <a class=\"nav-link\" href=\"{$url}Mikutano\">
                            <i class=\"menu-icon typcn typcn-document-text\"></i>
                            <span class=\"menu-title\">MIKUTANO</span>
                        </a>
                    </li>
                    <li class=\"nav-item\">
                        <a class=\"nav-link\" href=\"{$url}Dini\">
                            <i class=\"menu-icon typcn typcn-document-text\"></i>
                            <span class=\"menu-title\">NYUMBA ZA DINI</span>
                        </a>
                    </li>
                    <li class=\"nav-item\">
                        <a class=\"nav-link\" href=\"{$url}Institutions\">
                            <i class=\"menu-icon typcn typcn-document-text\"></i>
                            <span class=\"menu-title\">TAASISI</span>
                        </a>
                    </li>
                    <li class=\"nav-item\">
                        <a class=\"nav-link\" href=\"{$url}Users\">
                            <i class=\"menu-icon typcn typcn-document-text\"></i>
                            <span class=\"menu-title\">WATUMIAJI</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- partial -->
    ";
}
