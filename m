From: stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [PATCH v11 4/6] ARM: dts: imx6q-evi: support altera-ps-spi
Date: Fri, 02 Jun 2017 12:39:27 -0700
Message-ID: <6513199.IxvCuS6eYj@jclayton-pc>
References: <20170525172911.11467-1-stillcompiling@gmail.com> <20170525172911.11467-5-stillcompiling@gmail.com> <a4d0815c-593f-57a9-41fc-ab636ca9b9e5@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a4d0815c-593f-57a9-41fc-ab636ca9b9e5-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Bastian Stender <bst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday, June 2, 2017 6:30:12 PM PDT Andreas F=E4rber wrote:
> Hi,
>=20
> Am 25.05.2017 um 19:29 schrieb Joshua Clayton:
> > Add support for Altera V FPGA connected to an spi port
>=20
> Did you mean "Altera Cyclone V"?
I meant to shorten it from Altera Cyclone V to Altera FPGA.
Didn't quite make it.  Will fix and resubmit today.
>=20
> > to the evi devicetree file
> >=20
> > Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >=20
> >  arch/arm/boot/dts/imx6q-evi.dts | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/imx6q-evi.dts
> > b/arch/arm/boot/dts/imx6q-evi.dts index 24fe093a66db..a0cbb2d84803 1006=
44
> > --- a/arch/arm/boot/dts/imx6q-evi.dts
> > +++ b/arch/arm/boot/dts/imx6q-evi.dts
> > @@ -82,6 +82,15 @@
> >=20
> >  	pinctrl-names =3D "default";
> >  	pinctrl-0 =3D <&pinctrl_ecspi1 &pinctrl_ecspi1cs>;
> >  	status =3D "okay";
> >=20
> > +
> > +	fpga_spi: cyclonespi@0 {
>=20
> "cyclonespi" does not strike me as the best node name.
>=20
> I am guessing this is a sub-node of a SPI controller node, so no need to
> repeat "spi", and Cyclone seems more or less implied by "altr,fpga-".
True.
>=20
> Note that the example in the bindings doc uses "evi-fpga-spi". Nodes
> don't need to be (shouldn't be?) prefixed with the board. Note that
> bindings examples tend to get copied a lot.
>=20
> Any reason not to just use "fpga@0" in both places for simplicity?
Sure. fpga: fpga@0 is probably better.
I'll change it in both the dts and the binding doc.
>=20
> > +		compatible =3D "altr,fpga-passive-serial";
> > +		spi-max-frequency =3D <20000000>;
> > +		reg =3D <0>;
> > +		pinctrl-0 =3D <&pinctrl_fpgaspi>;
> > +		nconfig-gpios =3D <&gpio4 9 GPIO_ACTIVE_LOW>;
> > +		nstat-gpios =3D <&gpio4 11 GPIO_ACTIVE_LOW>;
> > +	};
> >=20
> >  };
> > =20
> >  &ecspi3 {
>=20
> [snip]
>=20
> Regards,
> Andreas


=2D-=20
~Joshua A Clayton
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
