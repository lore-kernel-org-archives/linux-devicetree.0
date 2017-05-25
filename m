From: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610-zii-dev-rev-b: add hi8435 device
Date: Thu, 25 May 2017 11:03:20 +0300
Message-ID: <eb1e1778-c228-8e37-be70-3e9fa17e5bab@cogentembedded.com>
References: <20170522131010.3537-1-nikita.yoush@cogentembedded.com>
 <a74ee28c1c62fee5a5e75dda70a02990@agner.ch>
 <076f6258-f0b4-6ba5-9670-e2c0582a92b5@cogentembedded.com>
 <20170522182119.GN29447@lunn.ch>
 <486f703b-fc8a-ccc1-134d-a908df798b2e@cogentembedded.com>
 <20170525071940.GV26102@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170525071940.GV26102@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff White <Jeff.White-c8ZVq/bFV1I@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Healy <Chris.Healy-c8ZVq/bFV1I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>> "Crap origin" here is that in vast majority of cases, polarity is
>> per-chip, not per-chip-use, knowledge. And proper location for per-chip
>> knowledge is chip's driver.  Moving this knowledge to per-chip-use
>> location in device trees only provides a source for errors, with little
>> gain.
>>
>> Vladimir Barinov mentions possibility that signal can be inverted by
>> board between gpio provider and chip's pin ...   but do we have at least
>> one practical case of this?  And if we even do, it's quite uncommon, and
>> something special should be required in device tree for these special
>> cases and not for "normal" cases.
> 
> I disagree.  Not for hi8435, but I have seen quite some board designs
> invert GPIOs before getting them into board level components.  That's
> why we should define those xxx-gpios properties on board level DTS,
> where polarity can be chosen per board design.

Even if such, still board specific knowledge is "is gpio as-is or
inverted", but knowledge if chip expects signal to be active low or
active high, remains chip-specific.

I'm thinking of proposing new flags in gpio binding, say
GPIO_NATIVE_POLARITY / GPIO_INVERTED_POLARITY,  that could be used
instead of GPIO_ACTIVE_HIGH / GPIO_ACTIVE_LOW, and leave knowledge about
signal polarity to chip's driver, while still allow to describe
inversion of needed.

Nikita
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
