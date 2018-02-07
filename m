From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: imx: Add basic dtsi file for imx6sll
Date: Wed, 7 Feb 2018 00:52:35 -0200
Message-ID: <CAOMZO5A0-X4XC=023vABSZ26dr9oSU4RCJTKhD5r8=O7CpR8iA@mail.gmail.com>
References: <1517969481-13411-1-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517969481-13411-1-git-send-email-ping.bai-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, jacky.baip-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 7, 2018 at 12:11 AM, Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org> wrote:
> Add dtsi file for imx6sll.
>
> Signed-off-by: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6sll.dtsi | 811 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 811 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6sll.dtsi
>
> diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
> new file mode 100644
> index 0000000..b87ee2b
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6sll.dtsi
> @@ -0,0 +1,811 @@
> +/*
> + * Copyright 2016 Freescale Semiconductor, Inc.
> + * Copyright 2017-2018 NXP.
> + *
> + * SPDX-License-Identifier: (GPL-2.0 OR MIT)

SPDX line should be the first one and it should start with //

> + */
> +
> +#include <dt-bindings/clock/imx6sll-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "imx6sll-pinfunc.h"
> +#include "skeleton.dtsi"

Please avoid including "skeleton.dtsi". We do not include it anyomre
in imx6 dtsi files.


> +       intc: interrupt-controller@00a01000 {

No leading zeros, please.

Building it with W=1 would warn you about this.

Make sure the next version does not generate warnings with W=1.
> +                       mmdc: mmdc@021b0000 {
> +                               compatible = "fsl,imx6sll-mmdc", "fsl,imx6q-mmdc";
> +                               reg = <0x021b0000 0x4000>;
> +                       };
> +
> +                       rngb: rngb@021b4000 {
> +                               compatible = "fsl,imx6sl-rng", "fsl,imx-rng", "imx-rng";

These compatible strings are not documented.

> +                               reg = <0x021b4000 0x4000>;
> +                               interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks =  <&clks IMX6SLL_CLK_DUMMY>;
> +                       };
> +
> +                       ocotp: ocotp-ctrl@021bc000 {
> +                               compatible = "fsl,imx6sll-ocotp", "syscon";
> +                               reg = <0x021bc000 0x4000>;
> +                               clocks = <&clks IMX6SLL_CLK_OCOTP>;
> +                       };
> +
> +                       csu: csu@021c0000 {
> +                               compatible = "fsl,imx6sll-csu";

This compatible strings is not documented.


> +                               reg = <0x021c0000 0x4000>;
> +                               interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +                               status = "disabled";
> +                       };
> +
> +                       snvs_gpr: snvs-gpr@0x021c4000 {
> +                               compatible = "fsl, imx6sll-snvs-gpr";

Ditto.

> +                               reg = <0x021c4000 0x10000>;
> +                       };
> +
> +                       iomuxc_snvs: iomuxc-snvs@021c8000 {
> +                               compatible = "fsl,imx6sll-iomuxc-snvs";

Ditto.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
