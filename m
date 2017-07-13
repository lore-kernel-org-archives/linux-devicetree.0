From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH] arm64: dts: ls1012a: add USB host controller nodes
Date: Thu, 13 Jul 2017 08:46:50 +0000
Message-ID: <AM3PR04MB14896986FF8C5A18C2643C29F1AC0@AM3PR04MB1489.eurprd04.prod.outlook.com>
References: <1499223243-13253-1-git-send-email-ran.wang_1@nxp.com>
 <20170713080717.GP3172@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170713080717.GP3172@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Tang <andy.tang@nxp.com>, Harninder Rai <harninder.rai@nxp.com>, =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Thursday, July 13, 2017 4:07 PM
> To: Ran Wang <ran.wang_1@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Catalin Marinas <catalin.marinas@arm.com>; Will
> Deacon <will.deacon@arm.com>; Andy Tang <andy.tang@nxp.com>; Harninder
> Rai <harninder.rai@nxp.com>; Horia Geant=E3 <horia.geanta@nxp.com>; open
> list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> <devicetree@vger.kernel.org>; moderated list:ARM64 PORT (AARCH64
> ARCHITECTURE) <linux-arm-kernel@lists.infradead.org>; open list <linux-
> kernel@vger.kernel.org>
> Subject: Re: [PATCH] arm64: dts: ls1012a: add USB host controller nodes
>=20
> On Wed, Jul 05, 2017 at 10:54:03AM +0800, Ran Wang wrote:
> > LS1012A has one USB 3.0(DWC3) controller and one USB 2.0 controller.
> >
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> > index b497ac1..8aa2dcf 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> > @@ -411,6 +411,23 @@
> >  				 <&clockgen 4 3>;
> >  		};
> >
> > +		usb0: usb3@2f00000 {
> > +			compatible =3D "snps,dwc3";
> > +			reg =3D <0x0 0x2f00000 0x0 0x10000>;
> > +			interrupts =3D <0 60 0x4>;
> > +			dr_mode =3D "host";
> > +			snps,quirk-frame-length-adjustment =3D <0x20>;
> > +			snps,dis_rxdet_inp3_quirk;
> > +		};
> > +
> > +		usb1: usb2@8600000 {
> > +			compatible =3D "fsl-usb2-dr-v2.5", "fsl-usb2-dr";
> > +			reg =3D <0x0 0x8600000 0x0 0x1000>;
> > +			interrupts =3D <0 139 0x4>;
> > +			dr_mode =3D "host";
> > +			phy_type =3D "ulpi";
> > +		};
>=20
> Please keep the nodes sorted in unit-address.
>=20
> Shawn
Do you mean to move the node 'usb1: usb2@8600000' forward to where it's add=
ress is just before  '@8600000 '?
I think it's reasonable to put USB controller nodes together in DTS for dev=
eloper to do issue analysis.

Ran
>=20
> > +
> >  		sata: sata@3200000 {
> >  			compatible =3D "fsl,ls1012a-ahci", "fsl,ls1043a-ahci";
> >  			reg =3D <0x0 0x3200000 0x0 0x10000>,
> > --
> > 2.1.0.27.g96db324
> >
