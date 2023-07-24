#!/bin/bash
 E='echo -e';
 e='echo -en';
#
 i=0; CLEAR; CIVIS;NULL=/dev/null
 trap "R;exit" 2
 ESC=$( $e "\e")
 TPUT(){ $e "\e[${1};${2}H" ;}
 CLEAR(){ $e "\ec";}
 CIVIS(){ $e "\e[?25l";}
 R(){ CLEAR ;stty sane;CLEAR;};                 # в этом варианте фон прозрачный
#
 ARROW(){ IFS= read -s -n1 key 2>/dev/null >&2
           if [[ $key = $ESC ]];then
              read -s -n1 key 2>/dev/null >&2;
              if [[ $key = \[ ]]; then
                 read -s -n1 key 2>/dev/null >&2;
                 if [[ $key = A ]]; then echo up;fi
                 if [[ $key = B ]];then echo dn;fi
              fi
           fi
           if [[ "$key" == "$($e \\x0A)" ]];then echo enter;fi;}
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[30;47m";}
#
 HEAD()
{
 for (( a=2; a<=35; a++ ))
  do
   TPUT $a 1;$E "\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
  done
TPUT  1 1;$E "\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m"
TPUT  3 3;$E "\e[1;36m *** surge ***\e[0m";
TPUT  4 3;$E "\e[2m single command web publishing\e[0m";
TPUT  5 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
TPUT 10 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
TPUT 11 3;$E "\e[2m Опции:\e[0m                                                             \e[36m Options:\e[0m";
TPUT 16 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
TPUT 17 3;$E "\e[2m Дополнительные команды:\e[0m                                \e[36m Additional commands:\e[0m";
TPUT 24 3;$E "\e[2m Если вы сомневаетесь, запустите Surge из каталога вашего проекта.\e[0m";
TPUT 25 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
TPUT 26 3;$E "\e[2m Руководство\e[0m                                                         \e[36m Guides:\e[0m";
TPUT 27 3;$E "\e[2m Официальный сайт:\e[0m                                         \e[36m https://surge.sh/\e[0m";
TPUT 28 3;$E "\e[2m Начало работы\e[0m                      \e[36m surge.sh/help/getting-started-with-surge\e[0m";
TPUT 29 3;$E "\e[2m Пользовательские домены\e[0m                \e[36m surge.sh/help/adding-a-custom-domain\e[0m";
TPUT 30 3;$E "\e[2m Дополнительная помощь\e[0m                                         \e[36m surge.sh/help\e[0m";
TPUT 31 1;$E "\e[47;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
TPUT 33 1;$E "\e[47;30m├\e[0m\e[2m─ Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ─────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m"
}
 FOOT(){ MARK;TPUT 36 1;$E "\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";UNMARK;}
#
  M0(){ TPUT  6 3; $e " Установка                                                          \e[32m Install \e[0m";}
  M1(){ TPUT  7 3; $e " Применение                                                           \e[32m Usage \e[0m";}
  M2(){ TPUT  8 3; $e " Регистрация и загрузка сайта                                                ";}
  M3(){ TPUT  9 3; $e " Обновление сайта                                                            ";}
  M4(){ TPUT 12 3; $e " Добавляет пользователя в список соавторов                     \e[32m -a     --add \e[0m";}
  M5(){ TPUT 13 3; $e " Удаляет пользователя из списка соавторов                      \e[32m -r  --remove \e[0m";}
  M6(){ TPUT 14 3; $e " Show the version number                                       \e[32m -V --version \e[0m";}
  M7(){ TPUT 15 3; $e " Show this help message                                        \e[32m -h    --help \e[0m";}
  M8(){ TPUT 18 3; $e " Показать, под каким именем вы вошли в систему                 \e[32m surge whoami \e[0m";}
  M9(){ TPUT 19 3; $e " Истечение срока действия локального токена                    \e[32m surge logout \e[0m";}
 M10(){ TPUT 20 3; $e " Выполняет только шаг аутентификации                            \e[32m surge login \e[0m";}
 M11(){ TPUT 21 3; $e " Список всех доменов, к которым у вас есть доступ                \e[32m surge list \e[0m";}
 M12(){ TPUT 22 3; $e " Удалить опубликованный проект                               \e[32m surge teardown \e[0m";}
 M13(){ TPUT 23 3; $e " Установить тарифный план                                        \e[32m surge plan \e[0m";}
 M14(){ TPUT 32 3; $e " Grannik Git                                                                 ";}
 M15(){ TPUT 34 3; $e " Exit                                                                        ";}
LM=15
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m sudo npm install --global surge\e[0m
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m surge <project> <domain>\e[0m
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Порядок работы:
 1. Войти в каталог проекта сайта.
 2. Ввести команду:\e[32m sudo surge\e[0m
 3. Ввести пароль пользователя системы.
 4. Ввести почту пользователя.
 5. Ввести пароль сайта.
\e[2m
[sudo] password for user:

   Welcome to surge! (surge.sh)
   Login (or create surge account) by entering email & password.

          email: user@mail.com
       password:

   Running as user@mail.com (Student)

        project: /home/user/project_site/
         domain: rainy-wound.surge.sh
         upload: [====================] 100% eta: 0.0s (10 files, 112865 bytes)
            CDN: [====================] 100%
     encryption: *.surge.sh, surge.sh (300 days)
             IP: 012.345.678.900

   Success! - Published to rainy-wound.surge.sh
\e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Отредактировать файл:\e[32m nano index.html\e[0m
 Обновить сайт:\e[32m sudo surge ./ rainy-wound.surge.sh\e[0m
\e[2m
   Running as user@mail.com (Student)

        project: ./
         domain: rainy-wound.surge.sh
         upload: [====================] 100% eta: 0.0s (10 files, 111843 bytes)
            CDN: [====================] 100%
     encryption: *.surge.sh, surge.sh (300 days)
             IP: 001.234.567.890

   Success! - Published to rainy-wound.surge.sh
\e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Добавляет пользователя в список соавторов (адрес электронной почты):\e[32m
 surge -a
 surge --add
\e[0m";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Удаляет пользователя из списка соавторов (адрес электронной почты):\e[32m
 surge -r
 surge --remove
 \e[0m";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Show the version number\e[32m
 surge -V
 surge --version
\e[0m";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Show this help message\e[32m
 surge -h
 surge --help
\e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m surge whoami\e[0m
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m surge logout\e[0m
";ES;fi;;
 10) S=M10;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 surge login
\e[0m";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m
 surge list
\e[0m";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m
 surge teardown
\e[0m";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m
 surge plan
\e[0m";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Mo 24 Jul 2023 23:21:46 CEST
 mSurge описание загрузки сайта из терминала.
 Asciinema:  \e[36m https://asciinema.org/a/598841\e[0m
 Github:     \e[36m \e[0m
 Gitlab:     \e[36m \e[0m
 Sourceforge:\e[36m \e[0m
 Notabug:    \e[36m \e[0m
 Bitbucket:  \e[36m \e[0m
 Framagit:   \e[36m \e[0m
 GFogs:      \e[36m \e[0m
 Codeberg:   \e[36m https://codeberg.org/Grannik/mSurge\e[0m
 Gitea       \e[36m \e[0m
 Bastyon:\e[36m \e[0m
";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;clear;ls -l;exit 0;fi;;
 esac;POS;done
