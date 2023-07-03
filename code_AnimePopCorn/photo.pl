:- use_module(library(pce)).
:- pce_image_directory('./images').
:- use_module(library(pce_style_item)).
:- encoding(iso_latin_1).
:- dynamic color/2.



resource(cover, image, image('cover.jpg')).
resource(loading, image, image('loading.jpg')).
resource('silentVoice', image, image('resultas/sienlentVoice.jpg')).
resource('souvenirDeMarnie', image, image('resultas/souvenirmarnie.jpg')).
resource('voyageChihiro', image, image('resultas/chiriro.jpg')).
resource('bubble', image, image('resultas/bubble.jpg')).
resource('chateauAmbulant', image, image('resultas/chateux.jpg')).
resource('arrietty', image, image('resultas/arrietty.jpg')).
resource('rien', image, image('resultas/rien.jpg')).
resource('perfectBlue', image, image('resultas/perfectBlue.jpg')).
resource('paprika', image, image('resultas/paprika.jpg')).
resource('AttackonTitan', image, image('resultas/AttackTitan.jpg')).
resource('demonSlayer', image, image('resultas/demonSlayer.jpg')).
resource('neighborTotoro', image, image('resultas/totoro.jpg')).
resource('gintama', image, image('resultas/gintama.jpg')).

resource(photo1, image, image('besoins/fievre.jpg')).


image(Ongle, Image) :- new(Figure, figure),
                                   new(Bitmap, bitmap(resource(Image),@on)),
                                   send(Bitmap, name, 1),
                                   send(Figure, display, Bitmap),
                                   send(Figure, status, 1),
                                   send(Ongle, display,Figure,point(0,0)).
