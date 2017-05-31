From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [linux-sunxi] [PATCH v2 1/6] dt-bindings: clock: sunxi-ccu: Add pll-periph to PRCM's needed clocks
Date: Wed, 31 May 2017 20:50:05 +0200
Message-ID: <20248930.d7orRrYxWW@jernej-laptop>
References: <20170531075824.657-1-wens@csie.org> <20170531075824.657-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170531075824.657-2-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-sunxi@googlegroups.com, wens@csie.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi!

Dne sreda, 31. maj 2017 ob 09:58:19 CEST je Chen-Yu Tsai napisal(a):
> The AR100 clock in the PRCM has parents, one of which is pll-periph from
> the main CCU.
> 
> Add it to the list of required clocks for the PRCM CCU.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt index
> 095a5807d874..966345972d83 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> @@ -25,7 +25,8 @@ Required properties :
>  - #clock-cells : must contain 1
>  - #reset-cells : must contain 1
> 
> -For the PRCM CCUs on A83T/H3/A64, one more clock is needed:
> +For the PRCM CCUs on A83T/H3/A64, two more clock is needed:

nit: s/clock is/clocks are/

Best regards,
Jernej

> +- "pll-periph": the SoC's peripheral PLL from the main CCU
>  - "iosc": the SoC's internal frequency oscillator
> 
>  Example for generic CCU:
> @@ -42,8 +43,8 @@ Example for PRCM CCU:
>  r_ccu: clock@01f01400 {
>  	compatible = "allwinner,sun50i-a64-r-ccu";
>  	reg = <0x01f01400 0x100>;
> -	clocks = <&osc24M>, <&osc32k>, <&iosc>;
> -	clock-names = "hosc", "losc", "iosc";
> +	clocks = <&osc24M>, <&osc32k>, <&iosc>, <&ccu CLK_PLL_PERIPH0>;
> +	clock-names = "hosc", "losc", "iosc", "pll-periph";
>  	#clock-cells = <1>;
>  	#reset-cells = <1>;
>  };
> --
> 2.11.0
> 
> --
> You received this message because you are subscribed to the Google Groups
> "linux-sunxi" group. To unsubscribe from this group and stop receiving
> emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> For more options, visit https://groups.google.com/d/optout.


