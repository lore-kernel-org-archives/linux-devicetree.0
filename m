Return-Path: <SRS0=0mep=HE=ucw.cz=pavel@kernel.org>
Date: Sun, 15 Apr 2018 18:15:32 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Standardized LED function names [was: Re: [PATCH v3] leds: add
 LED driver for CR0014114 board]
Message-ID: <20180415161532.GD10802@amd>
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua>
 <20180318124925.i4yuxigkfu6spv26@rob-hp-laptop>
 <fbe35381-45a6-7084-c1f9-5ede1eb88bab@gmail.com>
 <CAL_JsqKdCa_FV13fEw8V-avojUCN_PB+2djsnCsGDH-5qAOEcA@mail.gmail.com>
 <f8cd9de6-839b-b874-40af-d84b9f7de296@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline
In-Reply-To: <f8cd9de6-839b-b874-40af-d84b9f7de296@gmail.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> We also had a discussion about standardized LED function names, so I
> retrieved all LED function names from dts files present in kernel,
> and after unifying some similar occurrences I got something like
> below. Perhaps it doesn't make a sense to add all of the below
> definitions to the standard header, but some of them could certainly
> find their place in e.g. include/dt-bindings/leds/led-functions.h.

Yes, we should try to make names standard.

> Then we could have LED names in the form function:color, and below
> defines could be used in dts files to avoid spawning similar LED names
> describing the same function.

> Of course in case of the names presented here with numerical suffixes
> we could skip the suffix.

So we should certainly remove some stuff for the list. For example we
do not want "d" function, and we want to choose either "bluetooth" or
"bt", but don't want to have both.

Also for example "activity" should be removed, we need to be more
specific there. I suspect "nand" means activity on the nand flash, for
example.

> #define LED_FUNCTION_ACTIVITY "activity"
> #define LED_FUNCTION_ADSL "adsl"
> #define LED_FUNCTION_ALARM "alarm"
> #define LED_FUNCTION_ALIVE "alive"
> #define LED_FUNCTION_ALL "all"
> #define LED_FUNCTION_APP "app"
> #define LED_FUNCTION_AUX "aux"
> #define LED_FUNCTION_BACKUP "backup"
> #define LED_FUNCTION_BEEP "beep"
> #define LED_FUNCTION_BLUETOOTH "bluetooth"
> #define LED_FUNCTION_BOOT "boot"
> #define LED_FUNCTION_BOTTOM "bottom"
> #define LED_FUNCTION_BRICK-STATUS "brick-status"
> #define LED_FUNCTION_BT "bt"
> #define LED_FUNCTION_CEL "cel"
> #define LED_FUNCTION_CEL-PWR "cel-pwr"

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlrTeqQACgkQMOfwapXb+vJmoQCfbw1wZD5UeFWTixREGHL+dD25
YLEAnAhQLQEQvFmf5GHO74jrnbenTkwe
=6z4o
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
