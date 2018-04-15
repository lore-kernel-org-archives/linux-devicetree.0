Return-Path: <SRS0=0mep=HE=ucw.cz=pavel@kernel.org>
Date: Sun, 15 Apr 2018 18:15:41 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Standardized LED function names [was: Re: [PATCH v3] leds: add
 LED driver for CR0014114 board]
Message-ID: <20180415161541.GE10802@amd>
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua>
 <20180318124925.i4yuxigkfu6spv26@rob-hp-laptop>
 <fbe35381-45a6-7084-c1f9-5ede1eb88bab@gmail.com>
 <CAL_JsqKdCa_FV13fEw8V-avojUCN_PB+2djsnCsGDH-5qAOEcA@mail.gmail.com>
 <f8cd9de6-839b-b874-40af-d84b9f7de296@gmail.com>
 <CAL_JsqKOB8tB20hL5WxbEsryCVaDEs=C=U-z5p6BqQCEMskPGg@mail.gmail.com>
 <486709a4-027a-8995-7d6f-217d3d029786@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline
In-Reply-To: <486709a4-027a-8995-7d6f-217d3d029786@gmail.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>


--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> A case I care about is I have a family of boards that all have a
> >> common defined set of 4 LEDs. They could be driven by anything, but I
> >> want the same interface presented to userspace across boards.
> >> "
> >=20
> > Yes, and "label" should provide me with that ability as the context
> > was the practice of putting the controller name in the label.
>=20
> Exactly. There are two options:
>=20
> 1.
> - label format : "<color>:<function"
> 2.
> - label format : "<function>"
> - new "color" DT property

We should provide compatibility here.

So we should really have new "color" property, and probably new
"function" property, too.

> The changes in dts files would have to be accompanied by changes in
> DT parsing part of LED class drivers. Also, I wonder if it wouldn't
> make sense to add config option to choose between old and new LED
> naming convention to avoid userspace breakage.

Both old and new kernels are expected to be working with both old and
new dts...

And having config option choosing userland interfaces would not be nice.

> It would allow to use dts files with old style labels with
> newer kernels. The LED class device names would differ like below:
>=20
> Old style name (current):
> 	/sys/class/leds/netxbig:red:power
>=20
> New style name:
> 	/sys/class/leds/red:power (we could also think of dropping
>                                    color from name and adding sysfs
>                                    file for it)

I believe color needs to stay: it is common to have "green:battery"
for "battery ok" and "yellow:battery" for charging, for
example. Notification LED has three channels, "red", "green",
"blue"...

Thanks for looking into this,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlrTeq0ACgkQMOfwapXb+vJN9gCcDyySCofIHAJl5ofNjAQQgthh
F4sAnR9sovqND3BTBgR4WltPAPykuUvB
=CISy
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
