From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/9] doc: dt-bindings: Add doc for the Ingenic TCU
 timers driver
Date: Fri, 19 Jan 2018 15:12:57 -0600
Message-ID: <20180119211257.hl2g3awqg3lf7d5e@rob-hp-laptop>
References: <20180101143344.2099-1-paul@crapouillou.net>
 <20180110224838.16711-1-paul@crapouillou.net>
 <20180110224838.16711-5-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180110224838.16711-5-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 10, 2018 at 11:48:34PM +0100, Paul Cercueil wrote:
> Add documentation about how to properly use the Ingenic TCU
> (Timer/Counter Unit) timers driver from devicetree.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/timer/ingenic,tcu.txt      | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/ingenic,tcu.txt
> 
>  v3: New patch in this series

Similar comments in this one.

> 
> diff --git a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
> new file mode 100644
> index 000000000000..dd76877efb8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
> @@ -0,0 +1,35 @@
> +Ingenic JZ47xx SoCs Timer/Counter Unit driver
> +---------------------------------------------
> +
> +Required properties:
> +
> +- compatible : should be "ingenic,<socname>-tcu". Valid strings are:
> +  * ingenic,jz4740-tcu
> +  * ingenic,jz4770-tcu
> +  * ingenic,jz4780-tcu
> +- interrupt-parent : phandle of the TCU interrupt controller.
> +- interrupts : Specifies the interrupts the controller is connected to.
> +- clocks : List of phandle & clock specifiers for the TCU clocks.
> +- clock-names : List of name strings for the TCU clocks.

Need to be explicit with how many clocks and their order.

> +
> +Example:
> +
> +/ {
> +	mfd@10002000 {
> +		compatible = "ingenic,tcu", "simple-mfd", "syscon";
> +		reg = <0x10002000 0x1000>;
> +
> +		tcu_timer: timer {
> +			compatible = "ingenic,jz4740-tcu";
> +			reg = <0x10002010 0xFF0>;
> +
> +			clocks = <&tcu 0>, <&tcu 1>, <&tcu 2>, <&tcu 3>,
> +					 <&tcu 4>, <&tcu 5>, <&tcu 6>, <&tcu 7>;
> +			clock-names = "timer0", "timer1", "timer2", "timer3",
> +						  "timer4", "timer5", "timer6", "timer7";
> +
> +			interrupt-parent = <&tcu>;
> +			interrupts = <0 1 2 3 4 5 6 7>;
> +		};
> +	};
> +};
> -- 
> 2.11.0
> 
