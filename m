From: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v4 1/2] watchdog: ImgTec PDC Watchdog Timer Driver
Date: Fri, 21 Nov 2014 05:53:24 +0000
Message-ID: <27E62D98F903554192E3C13AFCC91C3C2F509B54@hbmail01.hb.imgtec.org>
References: <1416488526-22079-1-git-send-email-jude.abraham@imgtec.com>
	<1416488526-22079-2-git-send-email-jude.abraham@imgtec.com>,<CAL1qeaGWK+ok1d48i_wrnLdfALjFCRiPZiwwiYUeBSdNdDkHEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaGWK+ok1d48i_wrnLdfALjFCRiPZiwwiYUeBSdNdDkHEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

Many thanks for the review.

> On Thu, Nov 20, 2014 at 5:02 AM,  <jude.abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
>> From: Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>>
>> This commit adds support for ImgTec PowerDown Controller Watchdog Timer.
>>
>> Signed-off-by: Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

> Reviewed-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

> Two small comments you may want to fix if you need to re-spin the series though:

Will address following two review comments and submit new Patch set today.

>> +static struct watchdog_info pdc_wdt_info = {
>> +       .options                = WDIOF_SETTIMEOUT |
>> +                                 WDIOF_KEEPALIVEPING |
>> +                                 WDIOF_MAGICCLOSE,
>> +       .identity = "IMG PDC Watchdog",
>> +};

> Inconsistent spacing.

>> +       ret = watchdog_init_timeout(&pdc_wdt->wdt_dev, timeout, &pdev->dev);
>> +       if (ret < 0)
>> +               pdc_wdt->wdt_dev.timeout = pdc_wdt->wdt_dev.max_timeout;

> Maybe print an error here?

Regards,
Naidu.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
