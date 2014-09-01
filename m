From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 6/6 v4] ARM: realview: basic device tree implementation
Date: Mon, 1 Sep 2014 13:44:45 +0100
Message-ID: <20140901124445.GA7624@leverpostej>
References: <1406294628-16079-1-git-send-email-linus.walleij@linaro.org>
 <1406294628-16079-7-git-send-email-linus.walleij@linaro.org>
 <20140725152401.GA21830@leverpostej>
 <CACRpkdaugAmVt5CF194xd+eVyz=Yfir6Jz0k9h4VSvSWLkKPRQ@mail.gmail.com>
 <20140901121700.GC6617@leverpostej>
 <CACRpkdYoqhiLqVMqrrUxZEq-c63NuDT--FVWs3j_5b1BC24FeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYoqhiLqVMqrrUxZEq-c63NuDT--FVWs3j_5b1BC24FeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 01, 2014 at 01:27:17PM +0100, Linus Walleij wrote:
> On Mon, Sep 1, 2014 at 2:17 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Mon, Sep 01, 2014 at 12:52:49PM +0100, Linus Walleij wrote:
> 
> >> Should use the string "arm,arm1176jzf-devchip-gic"?
> >
> > That sounds fine to me.
> >
> > The document you've linked to says the GIC is derived from the MPCore
> > GIC, so I'd place "arm,arm11mp-gic" as a fallback entry in the
> > compatible list. Until we need to distinguish the two the driver
> > shouldn't need to be updated.
> 
> Well the driver doesn't have a IRQCHIP_DECLARE() for arm11mp-gic
> either so I'll have to add that instead.

Sorry, I's assumed that because it was documented the driver already
supported it. I should know better ;)

let's add an IRQCHIP_DECLARE for both "arm,arm1176jzf-devchip-gic" and
"arm,arm11mp-gic" (given it was already documented), so as to make
things less painful.

Thanks,

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
