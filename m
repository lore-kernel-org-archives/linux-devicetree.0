From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: Add pinctrl bindings for
 mt65xx/mt81xx.
Date: Tue, 13 Jan 2015 17:16:14 +0100
Message-ID: <20150113161614.GF23940@pengutronix.de>
References: <1415709535-31515-1-git-send-email-hongzhou.yang@mediatek.com>
 <1415709535-31515-3-git-send-email-hongzhou.yang@mediatek.com>
 <CACRpkdYSe_BH_qiHma2BA+c2otEi3wd0TBXy83t8vwrNL+3U2g@mail.gmail.com>
 <20141127101830.GP30369@pengutronix.de>
 <CACRpkdbMdJT6y-NL36RgQe0-CAFAVGqKiwY9+yFcwA7JDLmA+Q@mail.gmail.com>
 <20141202135527.GM30369@pengutronix.de>
 <CACRpkdZeRd+j7d_iRphruHRg8p3XjqWK8_HQzLH2PTZ_pqOrYA@mail.gmail.com>
 <20150112122200.GC18908@pengutronix.de>
 <CACRpkdYXrdiRWMV8YpxrSLe2rLEV-ZnX7=36w21zGquh==6WgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYXrdiRWMV8YpxrSLe2rLEV-ZnX7=36w21zGquh==6WgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Heiko =?iso-8859-15?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 13, 2015 at 11:05:22AM +0100, Linus Walleij wrote:
> >> I am worried that there is something in your reasoning that sort of
> >> assumes all pin controllers mux pins one-by-one and not in groups.
> >> How do we make it impossible to write a device tree that also
> >> make hardware that do groupwise config viable without ambiguities?
> >
> > Sorry, I don't understand this sentence. What do you mean here?
> >
> > The bindings I suggested are for individual pin based controllers
> > only. I know there are group based controllers, but I don't want to
> > change their bindings. I believe there is no single binding that is
> > good for both types of controllers.
> >
> > I think we must face it that individual pin based controllers are
> > different from group based controllers. That's the main difference
> > between different pin controllers and I think there are good reasons
> > to reflect that in the device tree.
> 
> OK let's work on a binding for this usecase.

Okay.

> 
> > You often talk about ambiguities. Could you give an example what
> > ambiguities you mean?
> 
> What happened was this pins = ; arguments were sometimes
> strings and sometimes integers, that becomes strange to handle
> in code, ambiguous.

I see. I like naming it 'pinmux' because that's what it is: pins and
mux settings. A plain 'pinno' suggests that it contains only pin mubers,
without mux setting. How about 'pin-no-mux'? We also could add an
explicit "pins-are-numbered" property instead of distinguishing this
by property names.

> 
> I'm fuzzily referring to the concept of things being named the
> same way in different device trees, yet lacking commonality,
> confusing a human reader that they may be the same thing,
> even if it is possible to write schemas and parsers handling
> it unambigously, so not ambiguity in the formal logic sense.
> 
> If i later want to refactor the code around this to a central
> parser I cannot do so because it would lead to formal ambiguities
> and is non-doable.

There could be a flag in the pinctroller struct indicating whether the
properties are to be interpreted as strings or as numbers.

> 
> > Note that the way we combine pin/mux in a single define is not new,
> > the i.MX pin controller uses this already and so far I'm not aware of
> > any problems this makes.
> 
> Yeah we never had time to sit down and come up with proper
> generic pin control bindings, we went with custom bindings
> partly because of general disagreements, partly because I
> was new to device tree and honestly had no idea of how
> to skin this cat.
> 
> Now that we get to formalize generic bindings for DT and
> ACPI and whatever alike, I prefer if we make both groupwise
> and per-pin pin controllers as strict and well defined as
> possible.
> 
> One minor problem I have with using an integer for mux config
> is that it assumes something about how many pins, configs etc
> that may exist on such a system. This should be stated
> explicitly in the bindings atleast so we know what restrictions
> we build into them. String-based function+group matching has
> no such restrictions.

No problem, that can be documented. Normally the defines should be used
anyway, not the plain pin numbers.

BTW one thing I really like about integers is the pure binary size. In
barebox I also parse the pinmux settings from the device tree. The
drivers using string matching are multiple times bigger due to the
string tables:

-rw-r--r-- 1 sha ptx  5436 Jan 13 15:00 imx-iomux-v3.o
-rw-r--r-- 1 sha ptx 42060 Jan 13 15:00 pinctrl-tegra30.o

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
