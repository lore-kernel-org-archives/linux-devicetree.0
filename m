From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 07/15] ARM: dts: sunxi: h3/h5: Add msgbox node
Date: Tue, 5 Mar 2019 21:39:26 -0600
Message-ID: <f1e7b836-412f-0d6c-c7cf-2c41c871758e@sholland.org>
References: <20190302042951.53671-1-samuel@sholland.org>
 <20190302042951.53671-8-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190302042951.53671-8-samuel@sholland.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jassi Brar <jassisinghbrar@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On 03/01/19 22:29, Samuel Holland wrote:
> The H3 and H5 SoCs contain a message box that can be used to send
> messages and interrupts back and forth between the ARM application CPUs
> and the ARISC coprocessor. Add a device tree node for it.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> index a4c757c0b741..a42fd3f9739e 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -227,6 +227,16 @@
>  			#size-cells = <0>;
>  		};
>  
> +		msgbox: mailbox@1c17000 {
> +			compatible = "allwinner,sun8i-h3-msgbox",
> +				     "allwinner,sun6i-a31-msgbox";
> +			reg = <0x01c17000 0x1000>;
> +			clocks = <&ccu CLK_BUS_MSGBOX>;
> +			resets = <&ccu RST_BUS_MSGBOX>;
> +			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +			#mbox-cells = <2>;

This should be 1. And it was caught by the new DTB schema validation :)

> +		};
> +
>  		usb_otg: usb@1c19000 {
>  			compatible = "allwinner,sun8i-h3-musb";
>  			reg = <0x01c19000 0x400>;
> 
