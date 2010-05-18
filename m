From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Boot interface for device trees on ARM
Date: Tue, 18 May 2010 18:49:54 +1000
Message-ID: <20100518084954.GC25892@yookeroo>
References: <201005181054.32325.jeremy.kerr@canonical.com>
	<alpine.LFD.2.00.1005172341200.12758@xanadu.home>
	<201005181324.45701.jeremy.kerr@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201005181324.45701.jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nicolas.pitre-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 18, 2010 at 01:24:43PM +0800, Jeremy Kerr wrote:
> Hi Nicolas,
> 
> > I think that, for the moment, it is best if the bootloader on already 
> > existing subarchitectures where DT is introduced still preserve the 
> > already existing ability to boot using ATAGs.  This allows for the 
> > testing and validation of the DT concept against the legacy ATAG method 
> > more easily.
> 
> Just to clarify - by "still preserve the existing ability to use ATAGs" you 
> mean only for non-DT boot, right? This proposal still does not require 
> ATAG_DEVTREE?
> 
> > Why one DT machine ID per subarchitecture?  Simply because a significant
> > part of the DT handling code will have to be subarchitecture specific
> > anyway.  The timer hardware, the GPIO configuration and muxing, SOC
> > specific platform data handling, power management config, and many other
> > things are simply too different from one SOC family to another and
> > trying to have a single global DT support code to rule them all is
> > insane.
> 
> The code for DT boot will be still subarch-specific, but I don't
> think we need IDs for that. There is enough information in the
> device tree to select the subarch-specific code to use for early
> init, without needing to parameterise every element of the
> machine. The machine-level "compatible" property allows us to do
> this.

That's right.  On PowerPC currently we don't have any real concept of
sub-architecture, but we do have platform level code to cover exactly
the sorts of messy things you mention, and it is selected on the basis
of the device tree's top-level compatible property.  Well, usually on
the compatible property, the platform probe routines can use other
information if, for example, firmware has screwed up the compatible
property.

One of the nice features that makes using the flat device tree quite
robust, is that even when firmware (or whoever) totally and utterly
stuffs up the device tree, there's nearly always *something* in there
that's sufficient to identify the board (by accident, if nothing
else).  A suitable platform probe routine can look for that, and claw
its way back to sanity from there (in the worst case, it could even
substitute an entire new corrected device tree, though I don't think
that's been necessary yet).

The only reason you'd need a subarchitecture number or equivalent is
if you need to do things differently in the very, very early asm boot
code.  We may need a minimal form of this on PowerPC if we ever
support multiple MMU families in the same kernel binary.

> Therefore, I don't think we need the machine ID at all: once the DT is 
> available, we can use that for any machine-specific stuff. Even though we're 
> not *configuring* it from the device tree, we can *select* it from there 
> instead.

Yes, absolutely.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
