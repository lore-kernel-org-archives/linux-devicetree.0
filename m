From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH] ARM: dts: am43xx-clocks: use ti,fixed-factor-clock for
 dpll_per_clkdcoldo
Date: Mon, 19 May 2014 15:25:16 +0300
Message-ID: <5379F82C.3020702@ti.com>
References: <1396040071-17900-1-git-send-email-d-gerlach@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1396040071-17900-1-git-send-email-d-gerlach@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Dave Gerlach <d-gerlach@ti.com>, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Cc: Paul Walmsley <paul@pwsan.com>, Tony Lindgren <tony@atomide.com>, Benoit Cousson <bcousson@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 03/28/2014 10:54 PM, Dave Gerlach wrote:
> Use the ti,fixed-factor-clock version so that autoidle for
> dpll_per_clkdcoldo is properly controlled after power management code
> is introduced. Without this the clock may be held active even when
> it is gated.
>
> Signed-off-by: Dave Gerlach <d-gerlach@ti.com>

Thanks, queued for 3.16/clk-dt.

> ---
>   arch/arm/boot/dts/am43xx-clocks.dtsi | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/am43xx-clocks.dtsi b/arch/arm/boot/dts/am43xx-clocks.dtsi
> index 142009c..1d9b6bb 100644
> --- a/arch/arm/boot/dts/am43xx-clocks.dtsi
> +++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
> @@ -609,10 +609,13 @@
>
>   	dpll_per_clkdcoldo: dpll_per_clkdcoldo {
>   		#clock-cells = <0>;
> -		compatible = "fixed-factor-clock";
> +		compatible = "ti,fixed-factor-clock";
>   		clocks = <&dpll_per_ck>;
> -		clock-mult = <1>;
> -		clock-div = <1>;
> +		ti,clock-mult = <1>;
> +		ti,clock-div = <1>;
> +		ti,autoidle-shift = <8>;
> +		reg = <0x2e14>;
> +		ti,invert-autoidle-bit;
>   	};
>
>   	dll_aging_clk_div: dll_aging_clk_div {
>

