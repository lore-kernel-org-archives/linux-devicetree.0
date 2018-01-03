From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/6] clocksource: Add a new timer-ingenic driver
Date: Wed, 3 Jan 2018 15:08:40 -0600
Message-ID: <20180103210840.hsh4kghuxz7btu5f@rob-hp-laptop>
References: <20171229125942.27305-2-paul@crapouillou.net>
 <20180101143344.2099-1-paul@crapouillou.net>
 <20180101143344.2099-5-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180101143344.2099-5-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 01, 2018 at 03:33:43PM +0100, Paul Cercueil wrote:
> This driver will use the TCU (Timer Counter Unit) present on the Ingenic
> JZ47xx SoCs to provide the kernel with a clocksource and timers.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/timer/ingenic,tcu.txt      |  35 +++

Separate patch please.

>  drivers/clocksource/Kconfig                        |   8 +
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/timer-ingenic.c                | 256 +++++++++++++++++++++
>  4 files changed, 300 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/ingenic,tcu.txt
>  create mode 100644 drivers/clocksource/timer-ingenic.c
> 
>  v2: Use SPDX identifier for the license
> 
> diff --git a/Documentation/devicetree/bindings/timer/ingenic,tcu.txt b/Documentation/devicetree/bindings/timer/ingenic,tcu.txt
> new file mode 100644
> index 000000000000..e4944972ea53
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
> +- ingenic,channels: a list of TCU channels to be used as timers.

Why is this needed? This looks like you are trying to assign certain 
timers to clocksource and clockevent. A common problem, but one that 
should be decided by describing h/w features. There must be some 
property present or missing to make you decide to use a given channel or 
not.

> +
> +Example:
> +
> +/ {
> +	regmap {
> +		compatible = "simple-mfd", "syscon";
> +		reg = <0x10002000 0x1000>;
> +
> +		tcu: timer {
> +			compatible = "ingenic,jz4740-tcu";
> +
> +			clocks = <&tcu 0>, <&tcu 1>;
> +			clock-names = "timer0", "timer1";

It's curious that you have timer0 and timer1 here and then channels 0 
and 1 below. Would your clocks change if you use channel 2 for example? 
The binding should be a list of clock connections in the h/w, not 
just what the driver needs or what the used h/w configuration is. 

Rob
