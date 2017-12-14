From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: DT dtc warnings
Date: Thu, 14 Dec 2017 20:21:31 +0100
Message-ID: <20171214192131.GH2559@piout.net>
References: <CAL_JsqJKCzjx3zNigu_0T=Ku=_P2SQEjTx=uVbvr_QxJQR7kYg@mail.gmail.com>
 <20171214183642.GF2559@piout.net>
 <CAL_JsqKqiyCb8s9cyM-LdZv+hyMjv2ZpfGZmyy9_+Wrd7-qF8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKqiyCb8s9cyM-LdZv+hyMjv2ZpfGZmyy9_+Wrd7-qF8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 14/12/2017 at 13:00:07 -0600, Rob Herring wrote:
> On Thu, Dec 14, 2017 at 12:36 PM, Alexandre Belloni
> <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi Rob,
> >
> > On 14/12/2017 at 12:21:06 -0600, Rob Herring wrote:
> >> Hi all,
> >>
> >> Below is a current list of ARM boards with more than 40 dtc warnings
> >> when building with W=1. There's a treewide patch in flight to fix some
> >> unit-address warnings[1], so those aren't included here. The list is
> >> grouped by maintainer. AT91, Exynos, and Allwinner continue to be at
> >> the top of the list and have been for some time (though having
> >> multiple boards for an SoC can cause lots of duplicated warnings).
> >>
> >> Please help fix these. More checks are being added[2].
> >>
> >
> > For the at91 ones, IIRC, they are coming from the clock binding and we
> > will have to break the ABI to fix it. This is not something we wanted to
> > do before 4.14 but it will happen at some point.
> 
> Looks like they are just missing unit-address. How does adding a
> unit-address break the ABI? Though, aren't you planning to change from
> a node per clock to clock controller node(s)? If so, then fixing when
> doing that is fine.

Adding the unit-address breaks the lookup of the clocks unless you want
to have nodes named prog0@0, prog1@1, pck0@8, etc...

I don't think it is worth the hassle going through all the dtsi to do
that.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
