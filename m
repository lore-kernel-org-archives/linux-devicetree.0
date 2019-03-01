From: Alison Wang <alison.wang@nxp.com>
Subject: RE: [PATCH v2] arm64: dts: ls1028a: Add Audio DT nodes
Date: Fri, 1 Mar 2019 07:35:20 +0000
Message-ID: <VI1PR04MB4062B92CC89BA1DC4591426EF4760@VI1PR04MB4062.eurprd04.prod.outlook.com>
References: <20190220084457.31357-1-alison.wang@nxp.com>
 <20190301024107.GN26041@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301024107.GN26041@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> On Wed, Feb 20, 2019 at 04:44:57PM +0800, Alison Wang wrote:
> > This patch adds Audio DT nodes for LS1028ARDB and LS1028AQDS boards.
> >
> > Signed-off-by: Alison Wang <alison.wang@nxp.com>
> > ---
> > Changes in v2:
> >  - Modify some nodes' names.
> >  - Use GIC_SPI and IRQ_TYPE_LEVEL_HIGH.
> >
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts |   62
> ++++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts |   63
> +++++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi    |   57
> +++++++++++++++++++
> >  3 files changed, 182 insertions(+), 0 deletions(-)
> >  <snip>
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > index a8cf92a..de590ec 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > @@ -335,5 +335,62 @@
> >  				     <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 207
> IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 209
> IRQ_TYPE_LEVEL_HIGH>;
> >  		};
> > +
> > +		edma0: dma-controller@22c0000 {
>=20
> Please sort the node in unit-address.
>=20
[Alison] Ok, I will update it in v3. Thanks.


Best Regards,
Alison Wang
