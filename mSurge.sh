#!/bin/bash
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 15);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=15;fi
 if [[ $aa -gt 15 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=15;fi
 if [[ $j1 -gt 15 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 15 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=36; a++ ))
  do
   echo -e "\e[${a};1H\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
  done
 echo -en "\e[1;1H\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
 echo -en "\e[3;3H\e[1m *** surge ***\e[0m";
 echo -en "\e[4;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[5;3H\e[2m Single command web publishing\e[0m";
 echo -en "\e[6;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[11;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[12;3H\e[2m Опции:\e[0m                                                             \e[36m Options:\e[0m";
 echo -en "\e[17;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[18;3H\e[2m Дополнительные команды:\e[0m                                \e[36m Additional commands:\e[0m";
 echo -en "\e[25;3H\e[2m Если вы сомневаетесь, запустите Surge из каталога вашего проекта.\e[0m";
 echo -en "\e[26;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[27;3H\e[2m Руководство\e[0m                                                         \e[36m Guides:\e[0m";
 echo -en "\e[28;3H\e[2m Официальный сайт:\e[0m                                         \e[36m https://surge.sh/\e[0m";
 echo -en "\e[29;3H\e[2m Начало работы\e[0m                      \e[36m surge.sh/help/getting-started-with-surge\e[0m";
 echo -en "\e[30;3H\e[2m Пользовательские домены\e[0m                \e[36m surge.sh/help/adding-a-custom-domain\e[0m";
 echo -en "\e[31;3H\e[2m Дополнительная помощь\e[0m                                         \e[36m surge.sh/help\e[0m";
 echo -en "\e[32;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[34;1H\e[47;30m├\e[0m─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[37;1H\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";
}
  E0(){ echo -en "\e[7;3H Установка                                                          \e[32m INSTALL \e[0m";}
  E1(){ echo -en "\e[8;3H Применение                                                           \e[32m USAGE \e[0m";}
  E2(){ echo -en "\e[9;3H Регистрация и загрузка сайта                                                ";}
  E3(){ echo -en "\e[10;3H Обновление сайта                                                            ";}
  E4(){ echo -en "\e[13;3H Добавляет пользователя в список соавторов                         \e[32m -a --add \e[0m";}
  E5(){ echo -en "\e[14;3H Удаляет пользователя из списка соавторов                       \e[32m -r --remove \e[0m";}
  E6(){ echo -en "\e[15;3H Show the version number                                       \e[32m -V --version \e[0m";}
  E7(){ echo -en "\e[16;3H Show this help message                                           \e[32m -h --help \e[0m";}
  E8(){ echo -en "\e[19;3H Показать, под каким именем вы вошли в систему                 \e[32m surge whoami \e[0m";}
  E9(){ echo -en "\e[20;3H Истечение срока действия локального токена                    \e[32m surge logout \e[0m";}
 E10(){ echo -en "\e[21;3H Выполняет только шаг аутентификации                            \e[32m surge login \e[0m";}
 E11(){ echo -en "\e[22;3H Список всех доменов, к которым у вас есть доступ                \e[32m surge list \e[0m";}
 E12(){ echo -en "\e[23;3H Удалить опубликованный проект                               \e[32m surge teardown \e[0m";}
 E13(){ echo -en "\e[24;3H Установить тарифный план                                        \e[32m surge plan \e[0m";}
 E14(){ echo -en "\e[33;3H                                                                        \e[34m Git \e[0m";}
 E15(){ echo -en "\e[35;3H                                                                       \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[47;30m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m sudo apt install npm\e[0m
\e[32m sudo npm install --global surge\e[0m
 Проверить уязвимости:\e[32m sudo npm audit\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[47;30m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m surge <project> <domain>\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[47;30m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
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
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[47;30m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
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
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[47;30m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавляет пользователя в список соавторов (адрес электронной почты):\e[32m
 surge -a
 surge --add
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[47;30m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Удаляет пользователя из списка соавторов (адрес электронной почты):\e[32m
 surge -r
 surge --remove
 \e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[47;30m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Show the version number\e[32m
 surge -V
 surge --version
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[47;30m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Show this help message\e[32m
 surge -h
 surge --help
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[47;30m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m surge whoami\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[47;30m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m surge logout\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[47;30m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 surge login
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[47;30m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 surge list
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[47;30m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 surge teardown
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[47;30m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 surge plan
\e[0m";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[47;30m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 So 28 Jän 2024
 mSurge Описание загрузки сайта из терминала.
 Asciinema:  \e[36m https://asciinema.org/a/598841\e[0m
 Github:     \e[36m https://github.com/Grannik/mSurge\e[0m
 Gitlab:     \e[36m https://gitlab.com/grannik/msurge\e[0m
 Sourceforge:\e[36m https://sourceforge.net/projects/msurge/files/\e[0m
 Notabug:    \e[36m https://notabug.org/Grannikoleg/mSurge\e[0m
 Bitbucket:  \e[36m https://bitbucket.org/grannikoleg/msurge/src/main/mSurge.sh\e[0m
 Framagit:   \e[36m https://framagit.org/GrannikOleg/msurge\e[0m
 Gitea       \e[36m https://try.gitea.io/Grannik/mSurge\e[0m
 Gogs:       \e[36m https://try.gogs.io/Grannik2/mSurge\e[0m
 Codeberg:   \e[36m https://codeberg.org/Grannik/mSurge\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[47;30m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;exit 0;fi;;
esac;C;done
