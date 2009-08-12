From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: ARM clock API to PowerPC
Date: Thu, 13 Aug 2009 09:15:22 +1000
Message-ID: <1250118922.3587.67.camel@pasglop>
References: <1250063825.15143.43.camel@pasglop>
	<20090812123551.GC11227@sirena.org.uk>
	<1250112847.3587.26.camel@pasglop>
	<20090812214444.GA4731@sirena.org.uk>
	<1250114192.3587.41.camel@pasglop>
	<20090812222031.GC4731@sirena.org.uk>
	<1250116373.3587.46.camel@pasglop>
	<20090812230023.GB7519@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20090812230023.GB7519-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Mark Brown <broonie-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Cc: John Jacques <john.jacques-M7mHMAq9Yzo@public.gmane.org>, linuxppc-dev list <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Torez Smith <torez-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> The problem is that you've got a chip which has a clock tree of its own
> which could benefit from using the clock API internally (in this case
> because it helps generalisation to the case where it's on the CPU for
> the MMC block to be able to just use the clock API for its clocks).

I see.

> Ideally the MFD core for the tmio would be able to extend the clock tree
> so that the MMC driver can work without knowing what sort of device it's
> part of.  Having the platform know about the clocks in the MFD means
> teaching each platform that might use the chip about the clocking
> structure of the chip in some way.  However, there's a concern about
> making the clock API too heavyweight for the on-SoC clocks that are the
> major application.  Things like per-clock memory consumption are an
> issue on bigger chips.

Right. Well, my proposal of linkage of clock providers via the
device-tree would definitely solve that problem for us at least,
provided the various parts of the chip are represented as nodes in the
DT.

> > Having more "generic" clock providers for off-SoC clock chips is an idea
> > that went through my mind but you may be right that it's not necessarily
> > something we need to cater for initially, it can be handled by platform
> > for now easily enough.
> 
> So long as that's clear to device tree users that should be fine.

That's my thought too.

Cheers,
Ben.
