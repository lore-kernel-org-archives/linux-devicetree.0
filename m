From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH 3/4] gpio: dt-bindings: Declare gpio-hog optional for GPIO subnodes
Date: Wed, 24 Feb 2016 08:01:47 +0100
Message-ID: <1813679.JaFRxta3v8@adelgunde>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de> <1456214089-13954-3-git-send-email-mpa@pengutronix.de> <20160223232534.GA29637@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1730085.g3PcDT12sk"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160223232534.GA29637@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--nextPart1730085.g3PcDT12sk
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi,

On Tuesday, February 23, 2016 05:25:34 PM Rob Herring wrote:
> On Tue, Feb 23, 2016 at 08:54:48AM +0100, Markus Pargmann wrote:
> > Reuse the GPIO hogging DT bindings for more generic specifications =
of
> > the GPIO. Therefore gpio-hog is declared optional.
>=20
> Before extending this binding further, we need to consider other case=
s=20
> that have been discussed recently such as gpio switch binding and=20
> whether it should fit in with this.

I tried to discuss my ideas and issues with the gpio-switch bindings
already some time ago, unfortunately the discussion didn't proceed:
=09http://thread.gmane.org/gmane.linux.kernel/2100574

>=20
> My biggest issue with this binding is whether the DT changes because=20=

> today we don't have a driver for some GPIO line and tomorrow we do.

This patch is just about defining that we can give GPIO lines names. In=

the best case this name refers to the line name on the schematic. In th=
e
worst case it is some arbitrary name. In both cases it should not
influence any driver that is trying to use this GPIO.

gpio-hogging indeed could cause problems for future drivers as these
GPIOs are not available for any drivers. But gpio-hogging is already
defined for quite some time in the DT bindings.
Also I would assume that for most new drivers new DT bindings are
created so that it already requires a DT update together with a kernel
update.

>=20
> That said, some specific comments below:
>=20
> > Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/gpio/gpio.txt | 28 +++++++++++++=
+++++-------
> >  1 file changed, 21 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Docu=
mentation/devicetree/bindings/gpio/gpio.txt
> > index 069cdf6f9dac..820898e0649c 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> > @@ -155,13 +155,25 @@ gpio-controller@00000000 {
> >  =09ngpios =3D <18>;
> >  }
> > =20
> > -The GPIO chip may contain GPIO hog definitions. GPIO hogging is a =
mechanism
> > -providing automatic GPIO request and configuration as part of the
> > -gpio-controller's driver probe function.
> > +The GPIO chip may contain subnodes describing specific GPIOs of th=
is
> > +controller. These GPIO nodes can be used to define GPIO hogging or=
 define GPIO
> > +names.
> > +GPIO hogging is a mechanism providing automatic GPIO request and c=
onfiguration
> > +as part of the gpio-controller's driver probe function.
>=20
> Linux driver details don't belong in binding descriptions.

This last sentence was only moved a bit. So perhaps this should be
changed in a separate patch.

>=20
> > -Each GPIO hog definition is represented as a child node of the GPI=
O controller.
> > +Each GPIO node consists of the following properties:
> >  Required properties:
> > +- gpios:      Store the GPIO information (id, flags, ...). Shall c=
ontain the
> > +=09      number of cells specified in its parent node (GPIO contro=
ller
> > +=09      node).
> > +
> > +Optional properties:
> > +- line-name:  The GPIO name. If not present the node name is used.=

>=20
> I'd like to deprecate line-name in favor of the standard property=20
> for user visible names "label".
>=20
> >  - gpio-hog:   A property specifying that this child node represent=
 a GPIO hog.
> > +
> > +For GPIO hogging which is specified by the "gpio-hog" property the=
 following
> > +additional properties are required.
> > +Required properties for GPIO hogging:
> >  - gpios:      Store the GPIO information (id, flags, ...). Shall c=
ontain the
>=20
> This doesn't make sense. gpios is always required and already listed=20=

> above.

Thanks, will remove it.

Best Regards,

Markus Pargmann

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart1730085.g3PcDT12sk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWzVVbAAoJEEpcgKtcEGQQDlkP/0DoRR+sC7zv14LiKBH0bDoE
H6lyBXur31dv6L0B6Vah33nRBee5LwTC5dHkeYl69z+6+HwkW+iJbQeouMjGFehf
e4s7x0nvcNoqMkGGaBPwtP3Xji1OHiMWhmn7t7nnddOvlxWuiJPSUTBD2OuVsW80
Z5B5LfhSiH0dEf63HogXfr5EWmDs0DPTUg4egvjkHz9tdOI8pSQAJ8uTeLyCImSq
keOE+4JIU42AUHuXxcaBbtaV24iAXUDYFuBBfarnZpT1p71xkXDiy2hQu58mQw65
8alfXLlqUOOi7oDmCgcU1RUAa1PZAxGjnZyqnCUYlQoPjHsAB98kQags2arfNFHn
FS32xSRu2hd7na9hNo36kOr+ZMAjq37t/Epgx+/pduR1yX1+PG6ZAfunaCodbxKB
geD0ap04j8yAzjdjvqK1dn7ooYljOA35DrtKyM78S9vX1tvdKGok7rGt+6z0Hjso
9Xi68Vo1X65YlspSq8QgpIDiGlIaepDTU5bJs8bVFKSvrXRwVaWiy6OWqUuSOktE
TXsBbFxYR5rMyLNCMvmzVyHRxLKC1qQnUGJKqd/9j7F4hCZZZclDsdxdb3FubDyH
HKE4FtIaTteyJrh6yQlfR0WxCWs+zT5vq6RbzW3d3HmmG36fJDdf72AqEBoU8Fs9
j3rs/Hw738L6xEF2atpu
=dzRU
-----END PGP SIGNATURE-----

--nextPart1730085.g3PcDT12sk--

