From: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 0/2] add Alphascale asm9260-wdt driver
Date: Mon, 28 Dec 2015 22:49:28 +0100
Message-ID: <20151228214928.GA1395@spo001.leaseweb.nl>
References: <5652BFA5.9010101@roeck-us.net> <1448480003-8029-1-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448480003-8029-1-git-send-email-linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Oleksij,

> v2:
> - fix DT types
> - remove obsolet comments
> - add clk error handling
> - reduce log noise
> - allow to return an error in asm9260_wdt_get_dt_mode
> 
> v3:
> - split patch to two parts, binding documentation and driver
> - spelling fixes
> - make reset a required property. It will make the code easier
> - reduce timeout for asm9260_wdt_sys_reset
> - rework error handling in asm9260_wdt_get_dt_clks
> - asm9260_wdt_get_dt_mode - convert return type from int to void
> - don't touch watchdog_set_nowayout
> - don't do dev_err() if driver is still working, use dev_warn instead.
> - asm9260_wdt_remove - use asm9260_wdt_disable() instead of asm9260_wdt_shutdown()
> 
> v4:
> - update commit message
> - remove IRQF_SHARED flag. This SOC don't need it.
> - make "Watchdog enabled" more user freandly
> - add watchdog_unregister_device to asm9260_wdt_remove
> 
> Oleksij Rempel (2):
>   watchdog: add Alphascale asm9260-wdt driver
>   DT: watchdog: add Alphascale asm9260 watchdog binding documentation.
> 
>  .../bindings/watchdog/alphascale-asm9260.txt       |  35 ++
>  drivers/watchdog/Kconfig                           |  10 +
>  drivers/watchdog/Makefile                          |   1 +
>  drivers/watchdog/asm9260_wdt.c                     | 403 +++++++++++++++++++++
>  4 files changed, 449 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/alphascale-asm9260.txt
>  create mode 100644 drivers/watchdog/asm9260_wdt.c
> 
> -- 
> 2.5.0
>

This new driver has been added o linux-watchdog-next.

Kind regards,
Wim.

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
