From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 4/7] spi: pl022: attempt to get sspclk by name
Date: Tue, 11 Feb 2014 16:48:29 +0100
Message-ID: <33149723.ycUmvZkobH@wuerfel>
References: <1392118632-11312-1-git-send-email-mark.rutland@arm.com> <201402111508.06267.arnd@arndb.de> <20140211150438.GJ26684@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140211150438.GJ26684-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 11 February 2014 15:04:38 Russell King - ARM Linux wrote:
> On Tue, Feb 11, 2014 at 03:08:06PM +0100, Arnd Bergmann wrote:
> > On Tuesday 11 February 2014, Mark Brown wrote:
> > > On Tue, Feb 11, 2014 at 11:37:09AM +0000, Mark Rutland wrote:
> > > 
> > > > -     pl022->clk = devm_clk_get(&adev->dev, NULL);
> > > > +     /*
> > > > +      * For compatibility with old DTBs and platform data, fall back to the
> > > > +      * first clock if there's not an explicitly named "sspclk" entry.
> > > > +      */
> > > > +     pl022->clk = devm_clk_get(&adev->dev, "sspclk");
> > > > +     if (IS_ERR(pl022->clk))
> > > > +             pl022->clk = devm_clk_get(&adev->dev, NULL);
> > > > +
> > > 
> > > I'll just have a bit of a grumble here and point out that this sort of
> > > stuff always worries me with the convention of using nameless clocks -
> > > it causes hassle adding further clocks.
> > 
> > I think the best solution for this is to continue with anonymous clocks
> > rather than adding names after the fact. This could be done (for DT-only
> > drivers) using the of_clk_get() interface that takes an index, or
> > we could add a generic dev_clk_get_index() or similar interface that
> > has the same behavior but also works for clkdev.
> 
> Mixing devm_* and non-devm_* interfaces doesn't work.  If you want to do
> that, devm_of_clk_get() would be a prerequisit.

Yes, good point. So if we want to do it, we would have to add a new
function anyway, there is just the question whether it should be
devm_of_clk_get() or devm_clk_get_index() if that can also work for
non-DT devices. Do you think the latter actually makes sense in
the clkdev interfaces? I'm not familiar enough with the code to
tell how that would be implemented in a reasonable way.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
