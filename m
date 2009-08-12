From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: ARM clock API to PowerPC
Date: Thu, 13 Aug 2009 08:32:53 +1000
Message-ID: <1250116373.3587.46.camel@pasglop>
References: <1250063825.15143.43.camel@pasglop>
	<20090812123551.GC11227@sirena.org.uk>
	<1250112847.3587.26.camel@pasglop>
	<20090812214444.GA4731@sirena.org.uk>
	<1250114192.3587.41.camel@pasglop>
	<20090812222031.GC4731@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20090812222031.GC4731-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
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

On Wed, 2009-08-12 at 23:20 +0100, Mark Brown wrote:

> ...which is much easier if you discourage people from using the NULL
> name in the first place :)  

Agreed.

> My concern is more about new device tree and
> older driver code than the other way round (which wouldn't suprise me,
> if only during things like bisection).

Right. That would only be a problem with NULL name -and- the new
device-tree changing the first clock in the list instead of adding to
the end, but I see your point, and it's a valid concern.

> There was a recent thread on linux-kernel (last week) about the tmio_mmc
> drivers - it's a MMC controller which is present in both some SH CPUs
> and some MFD chips.  I can probably dig up a more exact reference if
> required.

Or maybe just explain quickly how it needs to "register new clocks" in
ways that can be problematic. I'm not trying to be dense, I'm really not
sure what the problem you are trying to highlight is :-)

> Probably you will be able to, like the ARMs have, get a very long way
> with just supporting the on-SoC clock tree just now and can punt on
> dealing with other things for now.  It's where a large part of the
> interesting clocking in a lot of embedded systems is.

Right. And having the platform able to always trump the device-tree will
allow for hacks if necessary. If they start growing out of control, that
will tell us that we need to do something differently :-)

I'm afraid of over-design, so I'd rather go for something minimalist yet
flexible, which seems to be the case here, as the actual clock provider
implementation and platform code have pretty much all latitude to do
whatever they want.

Having more "generic" clock providers for off-SoC clock chips is an idea
that went through my mind but you may be right that it's not necessarily
something we need to cater for initially, it can be handled by platform
for now easily enough.

Cheers,
Ben.
