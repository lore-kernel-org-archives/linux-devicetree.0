From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH v2] arm64: dts: ls1028a: Add USB dt nodes
Date: Tue, 7 May 2019 08:48:31 +0000
Message-ID: <AM5PR0402MB286539A070BDEEDFC3304F0EF1310@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190426055558.44544-1-ran.wang_1@nxp.com>
 <20190501235410.GA25492@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501235410.GA25492@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thursday, May 02, 2019 07:54 Rob Herring wrote:
>=20
> On Fri, Apr 26, 2019 at 05:54:26AM +0000, Ran Wang wrote:
> > This patch adds USB dt nodes for LS1028A.
> >
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> > Changes in v2:
> >   - Rename node from usb3@... to usb@... to meet DTSpec
> >
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   20
> ++++++++++++++++++++
> >  1 files changed, 20 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > index 8dd3501..188cfb8 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > @@ -144,6 +144,26 @@
> >  			clocks =3D <&sysclk>;
> >  		};
> >
> > +		usb0:usb@3100000 {
>                      ^ space needed

Yes, will update this in next version.
=20
> > +			compatible=3D "snps,dwc3";
>=20
> Needs an SoC specific compatible.

Do you mean change compatible to "snps,dwc3", "fsl,ls1028a-dwc3" ?

As I know, so far there is no SoC specific programming for this IP, so do
you think it's still necessary to add it?

Regards,
Ran

> > +			reg=3D <0x0 0x3100000 0x0 0x10000>;
> > +			interrupts=3D <0 80 0x4>;
> > +			dr_mode=3D "host";
> > +			snps,dis_rxdet_inp3_quirk;
> > +			snps,quirk-frame-length-adjustment =3D <0x20>;
> > +			snps,incr-burst-type-adjustment =3D <1>, <4>, <8>, <16>;
> > +		};
> > +
> > +		usb1:usb@3110000 {
> > +			compatible=3D "snps,dwc3";
> > +			reg=3D <0x0 0x3110000 0x0 0x10000>;
> > +			interrupts=3D <0 81 0x4>;
> > +			dr_mode=3D "host";
> > +			snps,dis_rxdet_inp3_quirk;
> > +			snps,quirk-frame-length-adjustment =3D <0x20>;
> > +			snps,incr-burst-type-adjustment =3D <1>, <4>, <8>, <16>;
> > +		};
> > +
> >  		i2c0: i2c@2000000 {
> >  			compatible =3D "fsl,vf610-i2c";
> >  			#address-cells =3D <1>;
> > --
> > 1.7.1
> >
