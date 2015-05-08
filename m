From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH 03/12] clocksource: sti: Provide 'use timer as sched
 clock' capability
Date: Fri, 08 May 2015 10:44:59 +0200
Message-ID: <1431074699.13593.4.camel@x220>
References: <1431005924-21777-1-git-send-email-lee.jones@linaro.org>
	 <1431005924-21777-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431005924-21777-4-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-05-07 at 14:38 +0100, Lee Jones wrote:
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig

> +config CLKSRC_ST_LPC_TIMER_SCHED_CLOCK
> +	bool
> +	depends on CLKSRC_ST_LPC
> +	default y
> +	help
> +	  Use Low Power controller timer clock source as sched_clock

This adds, as far as I can see, a Kconfig symbol that will always be in
lockstep with CLKSRC_ST_LPC. Ie, CLKSRC_ST_LPC and
CLKSRC_ST_LPC_TIMER_SCHED_CLOCK will always both be 'n' or both be 'y'.

Are there plans to break that lockstep in the future?

Thanks,


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
