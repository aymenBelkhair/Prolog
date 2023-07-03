:- include('predicat.pl').
:- include('photo.pl').
:- use_module(library(pce)).
:- pce_image_directory('./images').
:- use_module(library(pce_style_item)).
:- encoding(utf8).
:- dynamic color/2.

interface_principal :- new(@main,dialog('Systeme Expert AnimePopcorn : Choisit le film d anime qui vous convient')),
                       new(@quitter, button('QUITTER', and(message(@main,destroy), message(@main,free)))),
                       new(@debut, button('COMMENCER LE TEST', message(@prolog, boutons))),
                       image(@main, cover),
                       send(@main, append(@debut)),
                       send(@main, append(@quitter)),
                       send(@main, open).




boutons :- free(@maladie),
           free(@quitter),
           free(@conseil),
           new(@quitter,button('Quitter',and(message(@main,destroy),message(@main,free)))),
           new(@maladie, label(nombre,'',font('Monotype Corsiva','Monotype Corsiva',28))),
           effacer,
           send(@debut, free),
           hypothese(Maladie),
           image(@main, loading),
           sleep(3.5),
           image(@main, Maladie),
           new(@debut, button('Recommencer', message(@prolog, boutons))),
           send(@main, display, @debut, point(290, 620)),
           send(@main, display, @quitter, point(390, 620)),
           annuler.

demander(Besoin) :- new(Di,dialog('Questions:')),
                           new(L2, label(texto, 'Repondez aux Questions')),
                           new(La, label(prob, Besoin)),

                           new(B1,button('OUI', and(message(Di, return, oui)))),
                           new(B2,button('NON', and(message(Di, return, non)))),
                           send(Di, gap, size(50,25)),
                           send(Di, append(L2)),
                           send(Di, append(La)),
                           send(Di, append(B1)),
                           send(Di, append(B2)),
                           send(Di, default_button,'OUI'),
                           send(Di, open_centered), get(Di,confirm,Reponse),
                           ( (Reponse == oui) -> assert(yes(Besoin)) ; assert(no(Besoin)), free(Di),fail ),
                           free(Di).

resultat(Msg) :-  image(@conseil_g, Msg).

:- interface_principal.

effacer :- send(@maladie, selection('')).

verifier(Besoin) :- ( yes(Besoin) -> true ; (no(Besoin) -> fail ; demander(Besoin)) ).

:- dynamic yes/1, no/1.

annuler :- retract(yes(_)), fail.
annuler :- retract(no(_)), fail.
annuler.

