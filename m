From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/4] misc: sram: Allow ARM64 to select SRAM_EXEC
Date: Wed, 28 Jun 2017 15:57:08 +0100
Message-ID: <20170628145707.GB8252@leverpostej>
References: <20170626223248.14199-1-f.fainelli@gmail.com>
 <20170626223248.14199-3-f.fainelli@gmail.com>
 <20170627173859.GA5189@leverpostej>
 <171ae8ff-2af2-65e3-9796-308b21976876@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <171ae8ff-2af2-65e3-9796-308b21976876-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Berger <opendmb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:BROADCOM BCM47XX MIPS ARCHITECTURE" <linux-mips@lin>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 27, 2017 at 11:21:17AM -0700, Florian Fainelli wrote:
> On 06/27/2017 10:38 AM, Mark Rutland wrote:
> > On Mon, Jun 26, 2017 at 03:32:42PM -0700, Florian Fainelli wrote:
> >> Now that ARM64 also has a fncpy() implementation, allow selection
> >> SRAM_EXEC for ARM64 as well.
> >>
> >> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > Sorr,y but I must NAK this patch.
> > 
> > As mentioned on prior threads regarding fncpy, I do not think it makes
> > sense to enable this for arm64. The only use-cases that have been
> > described so far for this are power-management stuff that should live in
> > PSCI or other secure FW, and have no place in the kernel on arm64
> 
> This is a valid reason, but this is only one use case presented, the
> only thing is that we need to make sure, as patch reviewers and you guys
> as architecture maintainers, that this is not used as a means to bypass
> PSCI for suspend/resume operation, which I now agree with.
> 
> Still, the general use case remains: you have a piece of addressable
> memory which can be used to allocate space from and relocate code to be
> it for security, performance, predictability, isolation, or anything,
> and that should be possible given standard kernel facilities offered by
> the SRAM driver.

While I agree that these are *theoretically* possible use cases, they
aren't *real* cases today. 

If someone comes by with code that needs this (which doesn't fall into
one of those NAK'd cases above), then I'm happy for this to be enabled
for that feature.

Until such time, I see no reason to enable this. Given it comes with
strong the potential for abuse, I'd rather it remained disabled.

> > > There are no other users of this functionality, and until there are, I
> > see no reason to enable this, and risk a proliferation of unnecessary
> > platform-specific code.
> > 
> > It should be possible to #ifdef-ise the relevant callers of this such
> > that they can be built on arm64 without using fncpy or sram_exec
> > functionality. AFAICT, there are no users on arm64 introduced by this
> > series.
> 
> I sent this patch accidentally as part of this patch series anyway, so
> if you want to keep the discussion alive, reply here:
> 
> https://patchwork.kernel.org/patch/9793745/

That appears to be v2 of the series, and there's a v3 afterwards, so
I've replied on v3.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
