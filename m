From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Mon, 11 Feb 2019 16:39:45 +0100
Message-ID: <20190211153945.e34fpwkuk67l7lc6@flea>
References: <20190211111245.GA18147@lst.de>
 <E1gtBlV-0000Wl-Cv@stardust.g4.wien.funkfeuer.at>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0635340447579478590=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <E1gtBlV-0000Wl-Cv@stardust.g4.wien.funkfeuer.at>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 20190201113743.10058-1-harald@ccbib.org, ibu@radempa.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0635340447579478590==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4xdgdd7ok6zr6uwh"
Content-Disposition: inline


--4xdgdd7ok6zr6uwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2019 at 02:36:53PM +0100, Harald Geyer wrote:
> > > debug console multiplexing:
> > > Olimex have a userspace script that controls gpio PL9 during boot,
> > > to select between HP and serial console. I guess this is not acceptab=
le
> > > for mainline.
> >=20
> > > The best solution I can see is to switch the HP jack from serial cons=
ole
> > > to audio once the audio drivers load. With this people can still capt=
ure
> > > the bootlogs but everybody gets audio once the system is up and
> > > switching back to console output is as simple as unloading the audio
> > > drivers.
> >=20
> > IMO it is really not the audio driver's business to mess with this swit=
ch.
> > You could argue as well that the serial driver should get a flag to cla=
im
> > the HP jack, which would be similarily unjustified.
>=20
> Not the audio driver's business, but perheps the audio card's DT node.
> Which is why I came up with the pinctrl idea.

I know that the nexus7 is quite well supported, and iirc they were
using a similar trick on their UART. Have you looked at how they were
doing that?

> > My solution is to confine this choice inside U-Boot:
> > in sun50i-a64-teres-i-u-boot.dtsi I put
> >=20
> > / {
> >         leds {
> >                 compatible =3D "gpio-leds";
> >                 /* Not really a LED, but the least intrusive workaround=
 */
> >                 audioconsole {
> >                         label =3D "teres-i:audio:console";
> >                         gpio =3D <&r_pio 0 9 GPIO_ACTIVE_LOW>; /* PL9 */
> >                         default-state =3D "on";
> >                 };
> >         };
> > [...]
> >=20
> > and place a "gpio set PL9;" somewhere in the bootcmd_* logic. Otherwise=
 there's
> > a *lot* of chirping on the right ear during boot ;-)
> > The switch is for early boot debugging, so it's best to have U-Boot ena=
ble it
> > when required, and keep it off by default.
>=20
> I agree that some quirk in u-boot will be required for those who want
> to boot with headphones plugged in.
>=20
> But I still think we need a proper description of the HW in the linux DT:
> * When linux doesn't know about the pin at all, there are no guarantees
>   that it won't accidentally touch the pin during some operations like
>   suspend/resume, etc.
> * There is the usecase where somebody puts the system console on ttyS1
>   and uses ttyS0 to connect to some other board. (Actually I believe this
>   is a quite likely usecase given Olimex' usual target market.) I'd like
>   to support this.

Agreed.

> Using something like your leds hack in the linux DT would be fine for
> me, if the maintainers are willing to accept it.

Not really. The side-effects of that is that any user-space stack is
free to come by and treat it like an LED as well which would be quite
horrible as far as audio or UART reliability is concerned :)

We want to model this properly. I guess using a pinctrl driver
controlled through GPIO (similar to what regulator-gpio is) would be a
good first step.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--4xdgdd7ok6zr6uwh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXGGXQQAKCRDj7w1vZxhR
xah0AQDNke3FvZDP3fx1pwTxtI9X0ZAwQ77Kz7ab8ApZ4RRhJwEAlk24JICLapq7
L0LIPdAvmlqBONizC9kYBEMEFzrZtQ8=
=ESOE
-----END PGP SIGNATURE-----

--4xdgdd7ok6zr6uwh--


--===============0635340447579478590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0635340447579478590==--
