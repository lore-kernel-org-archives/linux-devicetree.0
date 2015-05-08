From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH 02/12] clocksource: sti: Provide support for the ST LPC
 Clocksource IP
Date: Fri, 08 May 2015 12:09:57 +0200
Message-ID: <1431079797.13593.28.camel@x220>
References: <1431005924-21777-1-git-send-email-lee.jones@linaro.org>
	 <1431005924-21777-3-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431005924-21777-3-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-05-07 at 14:38 +0100, Lee Jones wrote:
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig

> +config CLKSRC_ST_LPC
> +	bool
> +	depends on ARCH_STI

By itself this does nothing. You can't set this symbol to 'y', even if
ARCH_STI is 'y', right? Of course, ARCH_STI will select this symbol (see
11/12) otherwise it would be inert. But as ARCH_STI selects
CLKSRC_ST_LPC I'd say this dependency isn't actually needed.

Are other selects of CLKSRC_ST_LPC expected to be added in the future?
If not, CLKSRC_ST_LPC should operate in lockstep with ARCH_STI. In that
case you might as well not bother with CLKSRC_ST_LPC and use ARCH_STI
directly. (But that forces you to move the select statement below into
the ARCH_STI entry, which might be ugly.)

> +	select CLKSRC_OF if OF
> +	help
> +	  Enable this option to use the Low Power controller timer
> +	  as clocksource.

(Please add an empty line.)

>  endmenu

Thanks,


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
