From: Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v10 0/4] This suspend patch is only support cut off the power of cpu and some external
Date: Mon, 01 Dec 2014 11:51:03 -0800
Message-ID: <7htx1f409k.fsf@deeprootsystems.com>
References: <1417423940-1669-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417423940-1669-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> (Chris
	Zhong's message of "Mon, 1 Dec 2014 16:52:16 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tony Xie <xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> writes:

> devices, since we still lack power_domain driver, so the other power rail
> of rk3288 need keep power on.
> I have tested it on rk3288-evb board, atop next-20141112. goto suspend by type
> "echo mem > /sys/power/state", vdd_cpu is about 0mv by measuring, so it can be
> determined in sleep mode, then press power button to wakeup it.

I tested this on top of today's linux-next (next-20141201) and it
suspends, but doesn't wake up from any of the button presses.  What
wakeup sources are configured for the rk3288-evb-rk808?

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
