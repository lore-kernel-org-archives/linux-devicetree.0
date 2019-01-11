From: Nipun Gupta <nipun.gupta@nxp.com>
Subject: RE: [PATCH 1/2] arm64: dts: ls1088: add smmu device node
Date: Fri, 11 Jan 2019 08:45:26 +0000
Message-ID: <VI1PR04MB44805B25ED8EB8B74E6E8EBBE6850@VI1PR04MB4480.eurprd04.prod.outlook.com>
References: <1545109016-1779-1-git-send-email-nipun.gupta@nxp.com>
 <20190111083956.GF32649@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111083956.GF32649@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Friday, January 11, 2019 2:10 PM
> To: Nipun Gupta <nipun.gupta@nxp.com>
> Cc: Leo Li <leoyang.li@nxp.com>; robh+dt@kernel.org;
> mark.rutland@arm.com; robin.murphy@arm.com; will.deacon@arm.com;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 1/2] arm64: dts: ls1088: add smmu device node
>=20
> On Tue, Dec 18, 2018 at 04:51:58AM +0000, Nipun Gupta wrote:
> > This patch also adds the iommu-map property in fsl-mc node, so
> > that fsl-mc can use iommu.
> >
> > Signed-off-by: Nipun Gupta <nipun.gupta@nxp.com>
> > ---
> > These patches are based over:
> > git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git,
> > as there are couple of changes related to fsl-mc bus in this tree:
> >
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor
> e.kernel.org%2Fpatchwork%2Fpatch%2F1021020%2F&amp;data=3D02%7C01%
> 7Cnipun.gupta%40nxp.com%7C32db0a82c058487b3b9b08d677a0686c%7C686
> ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636827928177177279&amp;s
> data=3DowEtCHfG%2Bc4pjO5lkb0TODYs6xORn2jXgLv4qJ95u8o%3D&amp;reser
> ved=3D0
> >
> >  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 92
> +++++++++++++++++++++++++-
> >  1 file changed, 91 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > index de93b42..dec0c2d 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > @@ -576,6 +576,7 @@
> >  			reg =3D <0x00000008 0x0c000000 0 0x40>,	 /* MC portal
> base */
> >  			      <0x00000000 0x08340000 0 0x40000>; /* MC
> control reg */
> >  			msi-parent =3D <&its>;
> > +			iommu-map =3D <0 &smmu 0 0>;	/* This is fixed-up by
> u-boot */
> >  			#address-cells =3D <3>;
> >  			#size-cells =3D <1>;
> >
> > @@ -641,6 +642,96 @@
> >  				};
> >  			};
> >  		};
> > +
> > +		smmu: iommu@5000000 {
>=20
> We are trying to keep the nodes with unit-address sorted in the address.
> I move the node to where it should be, and applied both patches.

Thank you.
