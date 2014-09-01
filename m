From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 6/6 v4] ARM: realview: basic device tree implementation
Date: Mon, 1 Sep 2014 13:03:13 +0100
Message-ID: <20140901120313.GI30401@n2100.arm.linux.org.uk>
References: <1406294628-16079-1-git-send-email-linus.walleij@linaro.org> <20140725152401.GA21830@leverpostej> <20140725155010.GP21766@n2100.arm.linux.org.uk> <9626823.572BIYcQL9@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9626823.572BIYcQL9@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 25, 2014 at 05:58:24PM +0200, Arnd Bergmann wrote:
> On Friday 25 July 2014 16:50:10 Russell King - ARM Linux wrote:
> > 
> > I toyed with the idea of adding the standard cache size specifications
> > to the L2C code, it sounds like there's a reason to do that now.
> > 
> > Let's not mess around with adding stuff like the above to work around
> > the L2 code not parsing the appropriate specs from DT, let's do the
> > right thing and add bindings to allow DT to provide the cache geometry.
> 
> Yes, please!
> 
> That would actually reduce the realview to just the dma_zone_size
> definition, and I think someone also posted a patch to get that from
> DT recently. Having realview booting with an empty board file would
> be ideal.

I did have a patch in my L2C cleanup series to provide these properties,
but it got discarded - even though we have existing platforms which
provide these values.

The reason for that was because requiring new properties causes a DT
breakage - previous versions of the DT suddenly stop working because
the values necessary to setup the L2C have been removed from the
kernel, and the older DT files do not contain the neccessary values
either.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
