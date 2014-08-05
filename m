From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Tue, 5 Aug 2014 10:06:03 +0200
Message-ID: <201408051006.03303.arnd@arndb.de>
References: <20140731192016.GA6869@excalibur.cnev.de> <20140804192510.GF3952@lukather> <20140804212317.GL30282@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140804212317.GL30282-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 04 August 2014, Russell King - ARM Linux wrote:
> On Mon, Aug 04, 2014 at 09:25:10PM +0200, Maxime Ripard wrote:
> > On Sun, Aug 03, 2014 at 07:59:27PM +0200, Arnd Bergmann wrote:
> > > I would actually prefer if we could migrate a lot of these files to BSD license,
> > > provided the original authors agree. We want the dtb blobs to be embeddable into
> > > boot loaders of any license.
> > 
> > Even though I'd be open to having my contributions to DTBs under the
> > BSD, is this really a thing?
> > 
> > I mean, for all I know, an OS/Bootloader would just parse a documented
> > binary file, and I don't see any derivative work there.
> 
> How does the OS/Bootloader end up with that binary file?
> 
> For the sake of argument, let's say that the BSDs want to move to DT on
> ARM.  Great, they convert over to parsing our DT blobs.

They already do, at least FreeBSD.

> However, they can't distribute the binary DT blobs to their users without
> coming up against the problems of the GPL wrt binary distribution.
> 
> They could distribute the source files, but remember that many of those
> are currently GPL licensed, so they'd probably end up having to package
> them entirely separately, if they're willing to do that at all.
>
> Or they could decide to ignore us altogether, and do their own DT stuff,
> maybe partially implementing our properties, or maybe coming up with
> different and/or incompatible properties - which would be bad because
> we now end up with two ways to describe the same hardware in active use.

I think this is exactly what is happening on the platforms that FreeBSD
first adopted DT on.

> I suspect the final option is the one they'd choose, and it's in our
> interest that that doesn't happen.

Right, or at least not have it spread to other platforms.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
