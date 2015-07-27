From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v5 4/6] dt-binding: document the binding for mxc rtc
Date: Mon, 27 Jul 2015 22:03:33 +0800
Message-ID: <20150727140333.GN12927@tiger>
References: <1437946673-7402-1-git-send-email-tremyfr@gmail.com>
 <1437946673-7402-5-git-send-email-tremyfr@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437946673-7402-5-git-send-email-tremyfr@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Reynes <tremyfr@gmail.com>
Cc: a.zummo@towertech.it, alexandre.belloni@free-electrons.com, shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, rtc-linux@googlegroups.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 26, 2015 at 11:37:51PM +0200, Philippe Reynes wrote:
> This adds documentation of device tree bindings for the
> mxc rtc.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>

DT maintainers,

Any comments on the bindings?  Otherwise, I will queue the whole patch
series on IMX tree for 4.3.

Shawn

> Cc: devicetree@vger.kernel.org
> Signed-off-by: Philippe Reynes <tremyfr@gmail.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-mxc.txt |   26 +++++++++++++++++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mxc.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-mxc.txt b/Documentation/devicetree/bindings/rtc/rtc-mxc.txt
> new file mode 100644
> index 0000000..49aa550
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-mxc.txt
> @@ -0,0 +1,26 @@
> +* Real Time Clock of the i.MX SoCs
> +
> +RTC controller for the i.MX SoCs
> +
> +Required properties:
> +- compatible: Should be "fsl,imx1-rtc" or "fsl,imx21-rtc".
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +- interrupts: IRQ line for the RTC.
> +- clocks: should contain two entries:
> +  * one for the input reference
> +  * one for the the SoC RTC
> +- clock-names: should contain:
> +  * "ref" for the input reference clock
> +  * "ipg" for the SoC RTC clock
> +
> +Example:
> +
> +rtc@10007000 {
> +	compatible = "fsl,imx21-rtc";
> +	reg = <0x10007000 0x1000>;
> +	interrupts = <22>;
> +	clocks = <&clks IMX27_CLK_CKIL>,
> +	       	 <&clks IMX27_CLK_RTC_IPG_GATE>;
> +	clock-names = "ref", "ipg";
> +};
> -- 
> 1.7.4.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
