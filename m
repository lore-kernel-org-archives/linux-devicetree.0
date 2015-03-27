From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] watchdog: digicolor: driver for Conexant Digicolor
 CX92755 SoC
Date: Thu, 26 Mar 2015 22:48:21 -0700
Message-ID: <5514EF25.4000400@roeck-us.net>
References: <a4554d0a61c62b85a7d66b6e3d16d07f8a498025.1427356791.git.baruch@tkos.co.il>	<148dd2d6912211bc468c30acf85a463192576039.1427356791.git.baruch@tkos.co.il> <CAM=Q2ctS6_=pzW2H+Yd3nEBgF269vfdh8yV3NbnWFP7b-MWLbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM=Q2ctS6_=pzW2H+Yd3nEBgF269vfdh8yV3NbnWFP7b-MWLbA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shubhrajyoti Datta <omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/26/2015 10:40 PM, Shubhrajyoti Datta wrote:
>
>     +
>     +static int dc_restart_handler(struct notifier_block *this, unsigned long mode,
>     +                             void *cmd)
>     +{
>     +       struct dc_wdt *wdt = container_of(this, struct dc_wdt, restart_handler);
>     +
>     +       dc_wdt_set(wdt, 1);
>     +       /* wait for reset to assert... */
>     +       mdelay(500);
>
>
> How is the 500 calculated ?
> Also is it possible to sleep here?
>
sleep: No. It would also be pretty pointless, since this is after all the very last step
of rebooting the system.

Guenter

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
