From: Martyn Welch <martyn.welch@collabora.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: imx6: Add support for Phytec phyBOARD
 i.MX6UL Segin
Date: Mon, 21 Jan 2019 09:40:54 +0000
Message-ID: <8746aab308f76b4d8f33a20fea3f54da323832b3.camel@collabora.com>
References: <20190118194812.3319-1-martyn.welch@collabora.com>
 <20190118194812.3319-2-martyn.welch@collabora.com>
 <CAOMZO5ASTUDfKkghXq5FftM8-XNztXCYpmdOU9CVfyX3pgKxxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5ASTUDfKkghXq5FftM8-XNztXCYpmdOU9CVfyX3pgKxxA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Stefan =?ISO-8859-1?Q?Riedm=FCller?= <s.riedmueller@phytec.de>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Christian Hemp <c.hemp@phytec.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On Fri, 2019-01-18 at 19:18 -0200, Fabio Estevam wrote:
> diff --git a/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-
> > full.dts b/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts
> > new file mode 100644
> > index 000000000000..83cdf4fa10c0
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts
> > @@ -0,0 +1,96 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2016 PHYTEC Messtechnik GmbH
> > + * Author: Christian Hemp <c.hemp@phytec.de>
> > + */
> > +
> > +/dts-v1/;
> > +#include "imx6ul-phytec-pcl063.dtsi"
> > +#include "imx6ul-phytec-phyboard-segin.dtsi"
> > +#include "imx6ul-phytec-peb-eval-01.dtsi"
> > +
> > +/ {
> > +       model = "Phytec phyBOARD-Segin i.MX6 UltraLite Full
> > Featured";
> > +       compatible = "phytec,imx6ul-pbacd10", "phytec,imx6ul-
> > pcl063",
> > +                    "fsl,imx6ul";
> 
> Better keep it in a single line?
> 

It makes it longer than 80 chars, but I'm not adverse to that.

> > +&ecspi3 {
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_ecspi3>;
> > +       cs-gpios = <&gpio1 20 GPIO_ACTIVE_HIGH>;
> > +       status = "okay";
> > +
> > +       spidev@0 {
> > +               compatible = "spidev";
> 
> Doesn't the kernel complain about spidev dts nodes?
> 

Oh, yes, it does when spidev is loaded...

Removing.

Martyn
