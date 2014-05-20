From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [Patch v3 0/5] Introduce keystone reset driver
Date: Tue, 20 May 2014 15:44:15 +0200
Message-ID: <5272855.vIyLIadgKe@wuerfel>
References: <1400495155-11136-1-git-send-email-ivan.khoronzhuk@ti.com> <5095812.b6DgWAxYzH@wuerfel> <537B5598.8070603@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537B5598.8070603-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, w-kwok2-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 20 May 2014 16:16:08 Ivan Khoronzhuk wrote:
> Thank for the reply
> 
> The reset driver uses two ranges:
> - RSTYPE, RSTCTRL,RSTCFG, RSISO  (Reset Main PLL Controller)
> - RESETMUX8-10 registers
> 
> The content of these register ranges are completely used by the reset 
> driver.
> Currently no one on the SoC can access them instead of the reset driver.
> Also we don't use syscon/regmap at all - so adding this will be some 
> overhead.
> 
> As I posted previously:
> "...configuring Reset multiplexer & PLL. And it tunes not only watchdog 
> usage..."
> 
> Yes, it tunes not only watchdog usage and uses part of registers from 
> PLL controller,
> but all it works with are connected with reset functionality. These 
> ranges are used only
> by reset driver and their purpose is reset functionality.
> 
> Maybe in the future some soft can use ranges in question for own tasks, 
> but it should be
> done via reset driver. So as I see there is no reasons to use regmap for 
> reset driver.

You should not look at these registers in isolation, they are part of
some register area that has other functions as well and that you should
at least represent correctly in DT.

When I see something like

+                       reg = <0x23100e4 0x10>,
+                             <0x2620328 0x10>;

I am certain that there are other things between 0x2310000 and 0x23100e3, and
probably after 0x23100f4 as well. There must be some data sheet that
gives this register range a proper name, so put that into DT rather than
making up some arbitrary stuff that happens to match how today's kernel
driver needs it.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
