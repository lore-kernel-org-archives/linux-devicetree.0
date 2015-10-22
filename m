From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/13] ARM: add some L220 DT settings
Date: Thu, 22 Oct 2015 14:57:13 +0200
Message-ID: <CACRpkdaQxbvtdrX4Vat4mJ1gRORCWjwReeAyjafnK5_mLAL1nw@mail.gmail.com>
References: <1444916813-31024-1-git-send-email-linus.walleij@linaro.org>
	<1444916813-31024-2-git-send-email-linus.walleij@linaro.org>
	<20151015135730.GC32532@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151015135730.GC32532-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 15, 2015 at 3:57 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Thu, Oct 15, 2015 at 03:46:41PM +0200, Linus Walleij wrote:

>> +- arm,eventmon-enable : enable the event monitor on the L2 cache (PL220 only).
>
> I don't think we should introduce a DT property for this: if we support
> the event monitor, then the event monitor support code should be
> controlling this bit.

OK that's reasonable. I'll make a patch for the parity enable and think
about how to implement eventmonitor bit setting.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
