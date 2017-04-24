From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH v3 02/12] arm64: allwinner: a64: add NMI
 controller on A64
Date: Mon, 24 Apr 2017 09:17:46 +0200
Message-ID: <20170424071746.u2lrk43kmvvd7m25@lukather>
References: <20170417115747.7300-1-icenowy@aosc.io>
 <20170417115747.7300-3-icenowy@aosc.io>
 <20170418070016.qsng3qtk76bqxyc5@lukather>
 <FB3B3C68-EB16-4352-B0B9-64857B1A6C03@aosc.io>
 <20170420055802.btibui5pspan4qal@lukather>
 <18ae853e9ce59a83bdeb6b64f96caee0@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2qaitrzo4wvoa5p2"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBHGN63DQKGQEACN4UKQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <18ae853e9ce59a83bdeb6b64f96caee0-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2qaitrzo4wvoa5p2
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2017 at 03:03:38PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-04-20 13:58=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Tue, Apr 18, 2017 at 06:56:43PM +0800, Icenowy Zheng wrote:
> > >=20
> > >=20
> > > =E4=BA=8E 2017=E5=B9=B44=E6=9C=8818=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=
=8D=883:00:16, Maxime Ripard
> > > <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> =E5=86=99=E5=88=B0:
> > > >On Mon, Apr 17, 2017 at 07:57:37PM +0800, Icenowy Zheng wrote:
> > > >> Allwinner A64 SoC features a NMI controller, which is usually
> > > >connected
> > > >> to the AXP PMIC.
> > > >>
> > > >> Add support for it.
> > > >>
> > > >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > > >> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > > >> ---
> > > >> Changes in v2:
> > > >> - Added Chen-Yu's ACK.
> > > >>
> > > >>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 ++++++++
> > > >>  1 file changed, 8 insertions(+)
> > > >>
> > > >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > >b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > >> index 05ec9fc5e81f..53c18ca372ea 100644
> > > >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > >> @@ -403,6 +403,14 @@
> > > >>  				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> > > >>  		};
> > > >>
> > > >> +		nmi_intc: interrupt-controller@01f00c0c {
> > > >> +			compatible =3D "allwinner,sun6i-a31-sc-nmi";
> > > >> +			interrupt-controller;
> > > >> +			#interrupt-cells =3D <2>;
> > > >> +			reg =3D <0x01f00c0c 0x38>;
> > > >
> > > >The base address is not correct, and there's uncertainty on whether
> > > >this is this particular controller or not. Did you even test this?
> > >=20
> > > Tested by axp20x-pek.
> >=20
> > Still, the base address is wrong, which is yet another hint that this
> > is not the same interrupt controller, and just works by accident.
>=20
> No, it's the same as other post-sun6i device trees.
> See other post-sun6i device trees: (or maybe they're all wrong, but
> as we have no document for it, we should temporarily keep them)
>=20
> sun6i-a31.dtsi
> ```
> 		nmi_intc: interrupt-controller@01f00c0c {
> 			compatible =3D "allwinner,sun6i-a31-sc-nmi";
> 			interrupt-controller;
> 			#interrupt-cells =3D <2>;
> 			reg =3D <0x01f00c0c 0x38>;
> 			interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> 		};
> ```
>=20
> sun8i-a23-a33.dtsi
> ```
> 		nmi_intc: interrupt-controller@01f00c0c {
> 			compatible =3D "allwinner,sun6i-a31-sc-nmi";
> 			interrupt-controller;
> 			#interrupt-cells =3D <2>;
> 			reg =3D <0x01f00c0c 0x38>;
> 			interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> 		};
> ```
>=20
> But according to the BSP device tree, the base address should be
> 0x01f00c00. Should I send some patch to fix all of them? (but it will
> break device tree compatibility)

I'm really not a big fan of "if we see something that is broken, just
let it rot" to be honest.

We have no idea how this controller works exactly, just like we have
no idea if it is exactly the same controller or not.

The only thing we have today is the memory map, and it tells us that
it has more registers than what you express here.

Because of the DT backward compatibility, you have to think of it the
other way around: what will happen if it turns out we need to setup
any register outside of that region you described in the DT, in
something like a year or so?

We can't, really. While if you have the full memory region from the
beginning, then you just have to add a single writel in your driver.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--2qaitrzo4wvoa5p2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY/aaXAAoJEBx+YmzsjxAggwIQALW3BKBpQq+CmIU1wtrJrUMU
0knw4yTU+Gwffzqtcl+kqdt5zXkr9ckx68y1WdEinj4RkXFqVUO150dEnz5XRiNI
zlFS9d+KKi9KnJlmXb3aKjr8jnaSl3dmtKBJYFTZtvrv4AGB+m1Uiuy1B9P3Qgek
wi8aT+7LNNsWKMuVV+YpD+hQVSP4/IqqCpQ72MdSaWzILzOUCjSbqZcQu0Q2CqLW
FDM1KiCi61y/N8HeT1NuvzmegtMo7/sZR4hOQzcMEP6QKK6RB79D/mfYFDCdeq2M
icRNDGUzDmyfOTvDsC/0V0p4O5WeSoUFAWJ6ri03HaFJEwm27YGG/5KbHG99o+9o
QDumyWdd2lIpfmZF0F8xKFdQ7/uXfP01jaVHVccCRzuZZjVX/sSHa8oKrrMX67rw
JXKc0AZux/YhOKU6q5k4lfOxE8tJ5Tp4QJ/VSVHYHwSByhylBKSSYIMDo8KNOep8
PUtnd3Uo2Uht2A/cXG3106x2643pjMvgEl7RLwoO6EXJ/1ipLtufZlvs5Bi8/H2j
AM7DKBLr8pIom22KQQ+9zwno+wuI3I3I6o5j7zJFgMiqcD7IRj9glTzdL8hPuI+w
qj3fgGmUQaOv0k+3uHiYGd5jSg3yAjt2bDRQA3NIW++A8l7je8uFxvqTiEtgTldC
aNgV411l+uH1p9nsCpXt
=COM/
-----END PGP SIGNATURE-----

--2qaitrzo4wvoa5p2--
