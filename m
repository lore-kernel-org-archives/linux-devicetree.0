From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH] arm64: dts: fsl: imx8mq: enable the thermal management
 unit (TMU)
Date: Mon, 11 Mar 2019 19:35:25 -0700
Message-ID: <CAHQ1cqEHr1mB2EH3-fJPrYa+nkcWPPjmCTjSt-XsDnJp-SCf+w@mail.gmail.com>
References: <20190311213124.29325-1-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311213124.29325-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, daniel.baluta@nxp.com, agx@sigxcpu.org, dl-linux-imx <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 11, 2019 at 2:35 PM Angus Ainslie (Purism) <angus@akkea.ca> wrote:
>
> These are the TMU nodes from the NXP vendor kernel
>

Hey Angus,

TMU block supports multiple thermal zones and vendor kernel doesn't
really account for that (see below). Latest version of the driver in
thermal tree now actually supports that feature (mulit-sensor), so I
think the code in DT should reflect that as well. I recently submitted
a series adding HWMON integration for TMU
(https://lore.kernel.org/lkml/20190222200508.26325-1-andrew.smirnov@gmail.com/T/#u)
and this is my take on this patch:

https://github.com/ndreys/linux/commit/09931e3d60af0a74377307b433db97da1be31570

All of the code there is up for grabs, if you feel like using it.

> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 83 +++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 9155bd4784eb..087620c6e17f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/power/imx8mq-power.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/thermal/thermal.h>
>  #include "imx8mq-pinfunc.h"
>
>  / {
> @@ -89,6 +90,7 @@
>                         reg = <0x0>;
>                         enable-method = "psci";
>                         next-level-cache = <&A53_L2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 A53_1: cpu@1 {
> @@ -210,6 +212,87 @@
>                                 #interrupt-cells = <2>;
>                         };
>
> +                       tmu: tmu@30260000 {
> +                               compatible = "fsl,imx8mq-tmu";
> +                               reg = <0x30260000 0x10000>;
> +                               interrupt = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +                               little-endian;
> +                               fsl,tmu-range = <0xb0000 0xa0026 0x80048 0x70061>;
> +                               fsl,tmu-calibration = <0x00000000 0x00000023
> +                                                      0x00000001 0x00000029
> +                                                      0x00000002 0x0000002f
> +                                                      0x00000003 0x00000035
> +                                                      0x00000004 0x0000003d
> +                                                      0x00000005 0x00000043
> +                                                      0x00000006 0x0000004b
> +                                                      0x00000007 0x00000051
> +                                                      0x00000008 0x00000057
> +                                                      0x00000009 0x0000005f
> +                                                      0x0000000a 0x00000067
> +                                                      0x0000000b 0x0000006f
> +
> +                                                      0x00010000 0x0000001b
> +                                                      0x00010001 0x00000023
> +                                                      0x00010002 0x0000002b
> +                                                      0x00010003 0x00000033
> +                                                      0x00010004 0x0000003b
> +                                                      0x00010005 0x00000043
> +                                                      0x00010006 0x0000004b
> +                                                      0x00010007 0x00000055
> +                                                      0x00010008 0x0000005d
> +                                                      0x00010009 0x00000067
> +                                                      0x0001000a 0x00000070
> +
> +                                                      0x00020000 0x00000017
> +                                                      0x00020001 0x00000023
> +                                                      0x00020002 0x0000002d
> +                                                      0x00020003 0x00000037
> +                                                      0x00020004 0x00000041
> +                                                      0x00020005 0x0000004b
> +                                                      0x00020006 0x00000057
> +                                                      0x00020007 0x00000063
> +                                                      0x00020008 0x0000006f
> +
> +                                                      0x00030000 0x00000015
> +                                                      0x00030001 0x00000021
> +                                                      0x00030002 0x0000002d
> +                                                      0x00030003 0x00000039
> +                                                      0x00030004 0x00000045
> +                                                      0x00030005 0x00000053
> +                                                      0x00030006 0x0000005f
> +                                                      0x00030007 0x00000071>;
> +                               #thermal-sensor-cells =  <0>;

As per #thermal-sensor-cells must be 1 (see
Documentation/devicetree/bindings/thermal/qoriq-thermal.txt), since as
I mentioned above there are multiple thermal zones (CPU, GPU, VPU).

> +                       };
> +
> +                       thermal-zones {
> +                               cpu-thermal {
> +                                       polling-delay-passive = <250>;
> +                                       polling-delay = <2000>;
> +                                       thermal-sensors = <&tmu>;

Ditto.

Thanks,
Andrey Smirnov
