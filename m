From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH RESEND V2 1/3] clocksource/drivers/sysctr: Add optional
 clock-frequency property
Date: Thu, 27 Jun 2019 12:34:19 +0200
Message-ID: <bb362db6-9c50-5d2c-349a-4097dea0449f@linaro.org>
References: <20190623123850.22584-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623123850.22584-1-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, l.stach@pengutronix.de, abel.vesa@nxp.com, ccaione@baylibre.com, angus@akkea.ca, andrew.smirnov@gmail.com, agx@sigxcpu.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On 23/06/2019 14:38, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Systems which use platform driver model for clock driver require the
> clock frequency to be supplied via device tree when system counter
> driver is enabled.
> 
> This is necessary as in the platform driver model the of_clk operations
> do not work correctly because system counter driver is initialized in
> early phase of system boot up, and clock driver using platform driver
> model is NOT ready at that time, it will cause system counter driver
> initialization failed.
> 
> Add the optinal clock-frequency to the device tree bindings of the NXP
> system counter, so the frequency can be handed in and the of_clk
> operations can be skipped.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- improve commit log, no content change.
> ---
>  Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt b/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt
> index d576599..c9907a0 100644
> --- a/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt
> @@ -14,6 +14,11 @@ Required properties:
>  - clocks : 	    Specifies the counter clock.
>  - clock-names: 	    Specifies the clock's name of this module
>  
> +Optional properties:
> +
> +- clock-frequency : Specifies system counter clock frequency and indicates system
> +		    counter driver to skip clock operations.
> +

Shouldn't it be required and mutually exclusive with clocks/clock-names?

>  Example:
>  
>  	system_counter: timer@306a0000 {
> @@ -22,4 +27,5 @@ Example:
>  		clocks = <&clk_8m>;
>  		clock-names = "per";
>  		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +		clock-frequency = <8333333>;
>  	};
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
