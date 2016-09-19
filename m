From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clocksource: oxnas: add OX820 compatible
Date: Mon, 19 Sep 2016 16:20:07 -0500
Message-ID: <20160919212007.GA13791@rob-hp-laptop>
References: <20160909132608.12605-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160909132608.12605-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 09, 2016 at 03:26:08PM +0200, Neil Armstrong wrote:
> In order to support the Oxford Semiconductor OX820 SoC, add new
> compatible string to rps timer driver.
> Also add new string in the dt-bindings.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt | 2 +-
>  drivers/clocksource/timer-oxnas-rps.c                        | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt b/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
> index 3ca89cd..d191612 100644
> --- a/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt
> @@ -2,7 +2,7 @@ Oxford Semiconductor OXNAS SoCs Family RPS Timer
>  ================================================
>  
>  Required properties:
> -- compatible: Should be "oxsemi,ox810se-rps-timer"
> +- compatible: Should be "oxsemi,ox810se-rps-timer" or "oxsemi,ox820-rps-timer"

Seems like this should be ox820 followed by ox810se and no kernel 
change.

>  - reg : Specifies base physical address and size of the registers.
>  - interrupts : The interrupts of the two timers
>  - clocks : The phandle of the timer clock source
> diff --git a/drivers/clocksource/timer-oxnas-rps.c b/drivers/clocksource/timer-oxnas-rps.c
> index bd887e2..d630bf4 100644
> --- a/drivers/clocksource/timer-oxnas-rps.c
> +++ b/drivers/clocksource/timer-oxnas-rps.c
> @@ -295,3 +295,5 @@ err_alloc:
>  
>  CLOCKSOURCE_OF_DECLARE(ox810se_rps,
>  		       "oxsemi,ox810se-rps-timer", oxnas_rps_timer_init);
> +CLOCKSOURCE_OF_DECLARE(ox820_rps,
> +		       "oxsemi,ox820se-rps-timer", oxnas_rps_timer_init);
> -- 
> 2.7.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
