From: Alison Wang <alison.wang@nxp.com>
Subject: RE: [PATCH] arm64: dts: ls1028a: add pmu dt nodes
Date: Wed, 6 Mar 2019 08:25:08 +0000
Message-ID: <DB7PR04MB4058729B6DDC6767647AD716F4730@DB7PR04MB4058.eurprd04.prod.outlook.com>
References: <20190227015752.18342-1-alison.wang@nxp.com>
 <20190304014838.GV26041@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304014838.GV26041@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi, Shawn,

> On Wed, Feb 27, 2019 at 09:57:52AM +0800, Alison Wang wrote:
> > This patch adds pmu dt nodes for LS1028A.
> >
> > Signed-off-by: Alison Wang <alison.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |    5 +++++
> >  1 files changed, 5 insertions(+), 0 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > index a8cf92a..36ef9c5 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > @@ -89,6 +89,11 @@
> >  					  IRQ_TYPE_LEVEL_LOW)>;
> >  	};
> >
> > +	pmu {
> > +		compatible =3D "arm,armv8-pmuv3";
>=20
> Shouldn't we use "arm,cortex-a72-pmu" as compatible for better?
>=20
[Alison] Yes, it is better as compatible. I will change it in v2.
Thanks.


Best Regards,
Alison Wang

> Shawn
>=20
> > +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > +	};
> > +
> >  	gic: interrupt-controller@6000000 {
> >  		compatible=3D "arm,gic-v3";
> >  		#address-cells =3D <2>;
> > --
> > 1.7.1
> >
