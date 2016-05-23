From: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 52/54] MAINTAINERS: Add file patterns for watchdog device tree bindings
Date: Mon, 23 May 2016 09:07:20 +0200
Message-ID: <20160523070720.GA17439@spo001.leaseweb.nl>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org> <1463907991-7916-53-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1463907991-7916-53-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
> 
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
> Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
> Please apply this patch directly if you want to be involved in device
> tree binding documentation for your subsystem.
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9f54762f002e16de..7202b6565dd98d50 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12400,6 +12400,7 @@ L:	linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  W:	http://www.linux-watchdog.org/
>  T:	git git://www.linux-watchdog.org/linux-watchdog.git
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/watchdog/
>  F:	Documentation/watchdog/
>  F:	drivers/watchdog/
>  F:	include/linux/watchdog.h
> -- 
> 1.9.1
> 

Patch added to linux-watchdog-next.

Kind regards,
Wim.

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
