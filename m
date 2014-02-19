From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: add device tree source for imx6sx SoC
Date: Wed, 19 Feb 2014 17:42:36 +0000
Message-ID: <20140219174236.GD25079@e106331-lin.cambridge.arm.com>
References: <1392796036-19094-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392796036-19094-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> +       intc: interrupt-controller@00a01000 {
> +               compatible = "arm,cortex-a9-gic";
> +               #interrupt-cells = <3>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;

Any reason for the #address-cells and #size-cells? The node has no
children, and I don't see an interrupt-map.

> +               interrupt-controller;
> +               reg = <0x00a01000 0x1000>,
> +                     <0x00a00100 0x100>;
> +       };
> +
> +       clocks {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ckil {
> +                       compatible = "fsl,imx-ckil", "fixed-clock";
> +                       clock-frequency = <32768>;
> +               };
> +
> +               osc {
> +                       compatible = "fsl,imx-osc", "fixed-clock";
> +                       clock-frequency = <24000000>;
> +               };
> +       };

What is this clocks container node? It has no compatible property. The
children have no reg entries and thus #address-cells and #size cells are
useless.

Why have this at all? Why not put the clocks directly under the root?

[...]

> +                       anatop: anatop@020c8000 {
> +                               compatible = "fsl,imx6sx-anatop", "fsl,imx6q-anatop",
> +                                               "syscon", "simple-bus";

NAK. That compatible list makes _no_ sense. Why are both simple-bus and
syscon there?

> +                               reg = <0x020c8000 0x1000>;
> +                               interrupts = <0 49 0x04 0 54 0x04 0 127 0x04>;

Please bracket list entries individually. It's not clear where one
interrupt ends and the next begins.

> +                       };
> +
> +                       snvs@020cc000 {
> +                               compatible = "fsl,sec-v4.0-mon", "simple-bus";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               ranges = <0 0x020cc000 0x4000>;
> +
> +                               snvs-rtc-lp@34 {
> +                                       compatible = "fsl,sec-v4.0-mon-rtc-lp";
> +                                       reg = <0x34 0x58>;
> +                                       interrupts = <0 19 0x04 0 20 0x04>;
> +                               };
> +                       };

The binding document mentions nothing about fsl,sec-v4.0-mon being a
bus, let alone one compatible with simple-bus. Are the child nodes
usable in isolation, even if the parent node weren't probed?

> +                       sdma: sdma@020ec000 {
> +                               compatible = "fsl,imx6q-sdma", "fsl,imx35-sdma";
> +                               reg = <0x020ec000 0x4000>;
> +                               interrupts = <0 2 0x04>;
> +                               clocks = <&clks IMX6SX_CLK_SDMA>, <&clks IMX6SX_CLK_SDMA>;
> +                               clock-names = "ipg", "ahb";
> +                               #dma-cells = <3>;
> +                               fsl,sdma-ram-script-name = "imx/sdma/sdma-imx6sx.bin";

This is insane. Why is this path in the DT at all?

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
