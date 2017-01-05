From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Enable spi1 and spi2 for Olimex A20 SOM
 EVB
Date: Thu, 5 Jan 2017 19:01:51 +0100
Message-ID: <20170105180151.gooxj3zy53hgojah@lukather>
References: <20161226175349.17712-1-manu@bidouilliste.com>
 <20170105171601.us4wffupptilvvqp@lukather>
 <20170105183734.c56cf3e0be4ad4ac21028851@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4920666680927998965=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170105183734.c56cf3e0be4ad4ac21028851@bidouilliste.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emmanuel Vadot <manu@bidouilliste.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4920666680927998965==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ppsgujwqpvzfamyz"
Content-Disposition: inline


--ppsgujwqpvzfamyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 05, 2017 at 06:37:34PM +0100, Emmanuel Vadot wrote:
>=20
>  Hi,
>=20
> On Thu, 5 Jan 2017 18:16:01 +0100
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > Hi,
> >=20
> > On Mon, Dec 26, 2016 at 06:53:49PM +0100, Emmanuel Vadot wrote:
> > > Enable the spi1 and spi2 node since the pins are exposed on the UEXT
> > > connectors.
> > >=20
> > > Signed-off-by: Emmanuel Vadot <manu@bidouilliste.com>
> > > ---
> > >  arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts b/arch/ar=
m/boot/dts/sun7i-a20-olimex-som-evb.dts
> > > index 669a1c338c76..fa8c6f60552b 100644
> > > --- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
> > > +++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
> > > @@ -300,12 +300,14 @@
> > >  	pinctrl-names =3D "default";
> > >  	pinctrl-0 =3D <&spi1_pins_a>,
> > >  		    <&spi1_cs0_pins_a>;
> > > +	status =3D "okay";
> > >  };
> > > =20
> > >  &spi2 {
> > >  	pinctrl-names =3D "default";
> > >  	pinctrl-0 =3D <&spi2_pins_a>,
> > >  		    <&spi2_cs0_pins_a>;
> > > +	status =3D "okay";
> > >  };
> >=20
> > Those nodes don't exist unfortunately. Maybe you forgot to send one
> > patch?
> >=20
> > Thanks!
> > Maxime
> >=20
> > --=20
> > Maxime Ripard, Free Electrons
> > Embedded Linux and Kernel engineering
> > http://free-electrons.com
>=20
>  It's based on a previous sent patch :
> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-November/46928=
8.html
>=20
>  You said you'll squash the two commits.

Hmmm, indeed, I might have made a mistake on this one and ended up
dropping it... :/

I reapplied both and squashed them together, thanks (and sorry again)!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ppsgujwqpvzfamyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYbooOAAoJEBx+YmzsjxAgM1QP/3mmLxRQLd+bCBZ56xPT47Fo
68U31x1XMy315kuAQQYIx9tGg7YX8yySi1a4JC5cXoRoz+LfuhGhTie3L5YhvjKL
cs1OtzGHWFc1foKyjL+zdPQMtuV5+Ndh33ZYO+zznzoRY1cUhqpd8KknnyyB/Wxf
4awrcqXTx1Sdpf0w8qFLk8nF79JSb9kO33NIBKaALJLn88upM+N1DLLT/PXz3lmu
EXISwCHXNPoRYJJuynLkt09bBDLUeSB60aLMHfskMRCySqIew+dPMR26OFNjxcDd
ji2Of8K71OyVbPvK+zRckd0lonfkIS2WFiEEOraXCR7U212xrVuJFHMxanapnby4
qG/KZINvbIErIXqZKltZfDb22GOuvJqwyocDrO3DplI7J2pV+4oYDDkDxUP6xm99
Ch1Bh+1B+z9wZNunOO85YWUEXg0F7280WmImEBfA65PW0nYMkQQsCD6kkXg17tVo
l0mV0htfZ7QSi0YyvoN6ONiO4hBYR2JyxFwwuT8QpnoOGiQp4bsSpISgXhK76ecJ
OfGc8CMaFQVnU2XzQ8kgRIp4TtVxeMoOV2N0jj0sr0/NSH1nfPvxobjfIQTX5WNi
ttPtmXxcNOhctF8A8eZOF3jtW1JB5thcpI2Zi3gG3WmWhu+jqOKA1VwYbFGgAWLg
yM1kB8qLsVotBN5CTVjS
=ylEF
-----END PGP SIGNATURE-----

--ppsgujwqpvzfamyz--


--===============4920666680927998965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4920666680927998965==--
