From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/7] rtc: Add rtc-sh
Date: Tue, 28 Mar 2017 20:24:41 -0500
Message-ID: <20170329012441.bxnkyqui24mymuvr@rob-hp-laptop>
References: <20170322142754.30888-1-chris.brandt@renesas.com>
 <20170322142754.30888-3-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170322142754.30888-3-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 10:27:49AM -0400, Chris Brandt wrote:
> rtc-sh is an RTC for SuperH and RZ/A SoCs.

Please work on the subject. It's a bit brief. "dt-bindings: rtc: " is 
the preferred prefix.

> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
> * added interrupt-names and clock-names
> * clocks now include counting sources
> * changed 'is a RTC' to 'is an RTC' in commit message
> ---
>  Documentation/devicetree/bindings/rtc/rtc-sh.txt | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sh.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-sh.txt b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
> new file mode 100644
> index 0000000..adbb8af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
> @@ -0,0 +1,29 @@
> +* Real Time Clock for Renesas SH and ARM SoCs
> +
> +Required properties:
> +- compatible: Should be "renesas,r7s72100-rtc" and "renesas,sh-rtc" as a
> +  fallback.
> +- reg: physical base address and length of memory mapped region.
> +- interrupts: 3 interrupts for alarm, period, and carry.
> +- interrupt-names: The interrupts should be labeled as "alarm", "period", and
> +  "carry".
> +- clocks: The functional clock source for the RTC controller must be listed
> +  first (if exists). Additionally, potential clock counting sources are to be
> +  listed.
> +- clock-names: The functional clock must be labeled as "fck". Other clocks
> +  may be named in accordance to the SoC hardware manuals.
> +
> +
> +Example:
> +rtc: rtc@fcff1000 {
> +	compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
> +	reg = <0xfcff1000 0x2e>;
> +	interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
> +		      GIC_SPI 277 IRQ_TYPE_EDGE_RISING
> +		      GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
> +	interrupt-names = "alarm", "period", "carry";
> +	clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
> +		 <&rtc_x3_clk>, <&extal_clk>;
> +	clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
> +	power-domains = <&cpg_clocks>;

Not documented.

Rob
