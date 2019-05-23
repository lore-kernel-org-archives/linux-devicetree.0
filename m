From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [RESEND][PATCH] arm64: dts: lx2160a: Enable usb3-lpm-capable for
 usb3 node
Date: Thu, 23 May 2019 07:51:41 +0000
Message-ID: <AM5PR0402MB2865A81EB93DBAC90DB22E87F1010@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190515060434.33581-1-ran.wang_1@nxp.com>
 <20190523074300.GH9261@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523074300.GH9261@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Thursday, May 23, 2019 15:43, Shawn Guo wrote:
>=20
> On Wed, May 15, 2019 at 02:04:34PM +0800, Ran Wang wrote:
> > Enable USB3 HW LPM feature for lx2160a and active patch for snps
> > erratum A-010131. It will disable U1/U2 temperary when initiate U3
> > request.
> >
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> > Depend on:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .kernel.org%2Fpatchwork%2Fpatch%2F870134%2F&amp;data=3D02%7C01%7Cr
> an.wan
> >
> g_1%40nxp.com%7Cc6df41748bc243397d3008d6df526c04%7C686ea1d3bc2b4c
> 6fa92
> >
> cd99c5c301635%7C0%7C0%7C636941942428322802&amp;sdata=3DNR2zs8BE%2
> FNn8KdP
> > do6%2FsNwJJdx2VgaQTy5H4bAlTJgw%3D&amp;reserved=3D0
>=20
> Is the dependency accepted?

No, I got no comment for that post since then.
lore.kernel.org/patchwork/patch/870134/

Regards,
Ran
=20
>=20
> >
> >  arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > index 125a8cc..0073df3 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > @@ -696,6 +696,8 @@
> >  			interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> >  			dr_mode =3D "host";
> >  			snps,quirk-frame-length-adjustment =3D <0x20>;
> > +			usb3-lpm-capable;
> > +			snps,dis-u1u2-when-u3-quirk;
> >  			snps,dis_rxdet_inp3_quirk;
> >  			snps,incr-burst-type-adjustment =3D <1>, <4>, <8>, <16>;
> >  			status =3D "disabled";
> > @@ -707,6 +709,8 @@
> >  			interrupts =3D <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> >  			dr_mode =3D "host";
> >  			snps,quirk-frame-length-adjustment =3D <0x20>;
> > +			usb3-lpm-capable;
> > +			snps,dis-u1u2-when-u3-quirk;
> >  			snps,dis_rxdet_inp3_quirk;
> >  			snps,incr-burst-type-adjustment =3D <1>, <4>, <8>, <16>;
> >  			status =3D "disabled";
> > --
> > 1.7.1
> >
