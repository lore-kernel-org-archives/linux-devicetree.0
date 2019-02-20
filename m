From: Alison Wang <alison.wang@nxp.com>
Subject: RE: [PATCH] arm64: dts: ls1028a: Add Audio DT nodes
Date: Wed, 20 Feb 2019 08:12:44 +0000
Message-ID: <VI1PR04MB4062E534325E82002E5DCBEEF47D0@VI1PR04MB4062.eurprd04.prod.outlook.com>
References: <20190123052135.26829-1-alison.wang@nxp.com>
 <20190201045002.GH19882@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201045002.GH19882@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi, Shawn,

> On Wed, Jan 23, 2019 at 01:21:35PM +0800, Alison Wang wrote:
> > This patch adds Audio DT nodes for LS1028ARDB and LS1028AQDS boards.
> >
> > Signed-off-by: Alison Wang <alison.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts |   62
> ++++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts |   63
> +++++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi    |   57
> +++++++++++++++++++
> >  3 files changed, 182 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> > index 14c79f4..139728e 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> > @@ -32,6 +32,49 @@
> >  		device_type =3D "memory";
> >  		reg =3D <0x0 0x80000000 0x1 0x00000000>;
> >  	};
> > +
> > +	sys_mclk: clock-mclk {
> > +		compatible =3D "fixed-clock";
> > +		#clock-cells =3D <0>;
> > +		clock-frequency =3D <25000000>;
> > +	};
> > +
> > +	reg_1p8v: regulator-1p8v {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "1P8V";
> > +		regulator-min-microvolt =3D <1800000>;
> > +		regulator-max-microvolt =3D <1800000>;
> > +		regulator-always-on;
> > +	};
> > +
> > <snip>
> > +
> > +			codec: sgtl5000@a {
> > +				#sound-dai-cells =3D <0>;
> > +				compatible =3D "fsl,sgtl5000";
> > +				reg =3D <0xa>;
> > +				VDDA-supply =3D <&reg_1p8v>;
> > +				VDDIO-supply =3D <&reg_1p8v>;
> > +				clocks =3D <&sys_mclk>;
> > +				sclk-strength =3D <3>;
>=20
> What is this property?
[Alison] It is a new property. I have submitted a patch for this new proper=
ty https://lkml.org/lkml/2018/12/25/123. This patch is already merged in li=
nux-next.

For other items you mentioned, I will modify them in v2. Thanks a lot for y=
our review.


Best Regards,
Alison Wang
