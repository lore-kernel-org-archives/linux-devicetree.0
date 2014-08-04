From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Mon, 4 Aug 2014 22:23:17 +0100
Message-ID: <20140804212317.GL30282@n2100.arm.linux.org.uk>
References: <20140731192016.GA6869@excalibur.cnev.de> <20140803130430.GY3952@lukather> <201408031959.27607.arnd@arndb.de> <20140804192510.GF3952@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140804192510.GF3952@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 04, 2014 at 09:25:10PM +0200, Maxime Ripard wrote:
> On Sun, Aug 03, 2014 at 07:59:27PM +0200, Arnd Bergmann wrote:
> > I would actually prefer if we could migrate a lot of these files to BSD license,
> > provided the original authors agree. We want the dtb blobs to be embeddable into
> > boot loaders of any license.
> 
> Even though I'd be open to having my contributions to DTBs under the
> BSD, is this really a thing?
> 
> I mean, for all I know, an OS/Bootloader would just parse a documented
> binary file, and I don't see any derivative work there.

How does the OS/Bootloader end up with that binary file?

For the sake of argument, let's say that the BSDs want to move to DT on
ARM.  Great, they convert over to parsing our DT blobs.

However, they can't distribute the binary DT blobs to their users without
coming up against the problems of the GPL wrt binary distribution.

They could distribute the source files, but remember that many of those
are currently GPL licensed, so they'd probably end up having to package
them entirely separately, if they're willing to do that at all.

Or they could decide to ignore us altogether, and do their own DT stuff,
maybe partially implementing our properties, or maybe coming up with
different and/or incompatible properties - which would be bad because
we now end up with two ways to describe the same hardware in active use.

I suspect the final option is the one they'd choose, and it's in our
interest that _that_ doesn't happen.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
