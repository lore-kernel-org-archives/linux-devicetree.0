From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: device_tree binding for "amba bus"
Date: Wed, 18 May 2011 01:24:42 +0100
Message-ID: <20110518002442.GB30588@sirena.org.uk>
References: <f9ae780a-2747-427f-826a-e0b510ca8afb@VA3EHSMHS001.ehs.local>
	<20110517224134.GC2266@n2100.arm.linux.org.uk>
	<64ff6672-0ce3-475b-b1c7-dc18bf2c2658@VA3EHSMHS005.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <64ff6672-0ce3-475b-b1c7-dc18bf2c2658-+Ck8Kgl/v09Eus+KprP3J7jjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 17, 2011 at 05:05:12PM -0700, Stephen Neuendorffer wrote:

Please fix your mail client to word wrap properly.  You've got lines
alternating 80 and ~20 columns which is really hard to read.

> So users of this bus have to have a clock and a regulator with those
> exact names.
> Is it your expectation that the clock/regulator names are standardized
> across arch/arm?

For both clock and regulator APIs the names are defined in terms of the
consumer of the driver.  Even if the consumer drivers wouild open code
this each driver would the same for all platforms using the driver.

> My thinking (at least with respect to these) was that clock sources and
> regulators could
> be represented by nodes in the device tree and if a device required a
> particular clock
> source to be enabled that it would declare that in the device tree.

This is pretty much what happens already, it's just that the tables
doing the mappings are defined in code.  Many systems are already doing
the clock management as part of their runtime PM infrastructure for the
basic clocks required to keep things operational and there's a
generalisation of this just going into the core runtime PM code at the
minute.

> This could be handled automatically by a more general abstraction of the
> clock dependencies
> of an arbitrary driver.

OTOH some clocks will need to be actively managed by drivers at runtime
- they're not just basic "turn it on when I'm running" clocks.

This is all pretty much orthogonal to device tree, I don't understand
why you feel that it's related.
