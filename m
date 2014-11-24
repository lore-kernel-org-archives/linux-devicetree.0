From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v8 0/4] This is the 1st version of suspend for RK3288.
Date: Mon, 24 Nov 2014 23:50 +0100
Message-ID: <2829328.asIzdRTr9b@diego>
References: <1416051910-16730-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416051910-16730-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tony Xie <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Chris,

Am Samstag, 15. November 2014, 19:45:06 schrieb Chris Zhong:
> This suspend patch is only support cut off the power of cpu and some
> external devices, since we still lack power_domain driver, so the other
> power rail of rk3288 need keep power on.
> I have tested it on rk3288-evb board, atop next-20141112. goto suspend by
> type "echo mem > /sys/power/state", vdd_cpu is about 0mv by measuring, so
> it can be determined in sleep mode, then press power button to wakeup it.

with this version my board can finally wake up again. Although it wakes 
immediatly again. But as it wakes at all, I'm quite happy :-) .

I remember this being mentioned before, but I don't remember what was 
responsible for that. Was it because we only enter the light suspend mode 
instead of the deep one or some interrupt somewhere?


I've been running on top of linux-next from 20141124 with the following 
patches applied on top of your v8 series:

pinctrl: rockchip: Fix enable/disable/mask/unmask
pinctrl: rockchip: Handle wakeup pins
serial: 8250_dw: Handle no_console_suspend when uart loses state


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
