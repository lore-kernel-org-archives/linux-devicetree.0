From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/4] watchdog: ts4800: add new driver for TS-4800 watchdog
Date: Fri, 30 Oct 2015 13:53 +0100
Message-ID: <6804900.txcGkbUFcL@wuerfel>
References: <1445978021-13961-1-git-send-email-damien.riegel@savoirfairelinux.com> <1445978021-13961-3-git-send-email-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445978021-13961-3-git-send-email-damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 27 October 2015 16:33:39 Damien Riegel wrote:
> +static void ts4800_write_feed(struct ts4800_wdt *wdt, u16 val)
> +{
> +       __raw_writew(val, wdt->base + TS4800_WTD_FEED);
> +}
> +
> 

Using __raw_writew() is broken when you run a big-endian kernel. Better always
use the normal writew() in device drivers.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
