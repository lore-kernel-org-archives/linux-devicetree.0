From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 01/10] arm64: allwinner: a64: enable RSB on A64
Date: Tue, 2 May 2017 13:22:08 +0200
Message-ID: <20170502112208.km7q4inncospx673@lukather>
References: <20170426152023.41567-1-icenowy@aosc.io>
 <20170426152023.41567-2-icenowy@aosc.io>
 <20170427132805.izv6xfktlhfc4yty@lukather>
 <4f910cd7ab972c1b6d93b0327833b596@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kux766qlxcubpkqj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4f910cd7ab972c1b6d93b0327833b596-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kux766qlxcubpkqj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2017 at 02:14:58AM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-04-27 21:28=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Wed, Apr 26, 2017 at 11:20:14PM +0800, Icenowy Zheng wrote:
> > > Allwinner A64 have a RSB controller like the one on A23/A33 SoCs.
> > >=20
> > > Add it and its pinmux.
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > > Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > > ---
> > > Changes in v2:
> > > - Removed bonus properties in pio node.
> > > - Added Chen-Yu's ACK.
> > >=20
> > >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 19
> > > +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > index c7f669f5884f..05ec9fc5e81f 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > @@ -422,6 +422,25 @@
> > >  			#gpio-cells =3D <3>;
> > >  			interrupt-controller;
> > >  			#interrupt-cells =3D <3>;
> > > +
> > > +			r_rsb_pins: rsb@0 {
> > > +				pins =3D "PL0", "PL1";
> > > +				function =3D "s_rsb";
> > > +			};
> > > +		};
> > > +
> > > +		r_rsb: rsb@1f03400 {
> > > +			compatible =3D "allwinner,sun8i-a23-rsb";
> > > +			reg =3D <0x01f03400 0x400>;
> > > +			interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks =3D <&r_ccu 6>;
> >=20
> > Please use the defines here..
>=20
> Linux-4.12 doesn't yet enter rc1, and the defines are still not in
> Linus's tree.
>=20
> Please note that I have already mentioned that this patch is necessary
> to be merged into 4.12, otherwise poweroff won't work properly at 4.12 .

This is too late for 4.12. We don't merge any patch two weeks before
the merge window opens, which makes it around -rc6. This will be 4.13
material, so we'll definitely have the defines by then.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kux766qlxcubpkqj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCGvcAAoJEBx+YmzsjxAgQoUQAKixNoCm/HULeW2dXqlbkV6H
NSpTXM5r0Hpq75N9qtXd3sdgE5zWxDwJQ5kz1xMQBQUEx8zhMA38d6vVCeJA8NRM
BJpcIO9Pgxma35IUzvqV00EkCdmst2skytT/r69u+XmgnGzNI8QIaXAMcnPveCy/
HS9KEDAevm+H36d8J8AcNAp+7h/deWlWppAY6wzeeM1tmDRN0nED/jutwr6tSIVq
yTEW7/ewEekMQ2YFFOFapVeBSxI1myUWaNYOJtevKoi3J48Ip4ti4/wSoy4P6au2
jeLiLpmK7taCco1SUElSodHts1BxgO3PcDf6MQTKjyFeXgVCIhpxHvzFvCy7kdH9
AhNu5JSbOqLcpBjS5wdXjzn2tUWJQBqt2hu11Ewcj0KB+ifwf2MEIfxl+hvY0CiX
d+eQNzQMlCezu+9aRiB2IlliJk9lKyL4zNbKzPnvOuKwbqA/fP7Xty7+irtycpq+
QWkJUfjdfhtMZG4+HsTxOmd48yAYU8gMdkaiLehCiRBHt5ZadQwT4WX3TmY88oHA
Ly+MpDxjJ7fyKESETwdfT5dkELpo9A7tLD0duXMgdBc8TxOGOjy8qp2gN6+GMPdY
/xIa3Toyoq6ggacZMTaqlVm+uYrvBHNDBoEYSXGpUTrLufxbSL04e03I4tGm/5fW
Q5AYo0xb6erPETadHqqS
=t/KP
-----END PGP SIGNATURE-----

--kux766qlxcubpkqj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
