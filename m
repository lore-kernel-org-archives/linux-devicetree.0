From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Mon, 13 Jun 2011 11:14:17 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1106131058080.2142@xanadu.home>
References: <20110612112219.GD16318@ibawizard.net>
	<20110612115820.GF10283@n2100.arm.linux.org.uk>
	<201106121615.24059.arnd@arndb.de>
	<20110612145751.GA4013@ponder.secretlab.ca>
	<20110612151931.GK10283@n2100.arm.linux.org.uk>
	<alpine.LFD.2.00.1106121145570.2142@xanadu.home>
	<20110612155940.GM10283@n2100.arm.linux.org.uk>
	<alpine.LFD.2.00.1106121454510.2142@xanadu.home>
	<20110613095142.GA10951@atomide.com>
	<alpine.LFD.2.00.1106131010150.2142@xanadu.home>
	<20110613142044.GC13643@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110613142044.GC13643-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, =?ISO-8859-15?Q?Petr_=A6tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 13 Jun 2011, Russell King - ARM Linux wrote:

> On Mon, Jun 13, 2011 at 10:14:07AM -0400, Nicolas Pitre wrote:
> > On Mon, 13 Jun 2011, Tony Lindgren wrote:
> > 
> > > I agree that we need to parse the user configurable ATAGs to support
> > > existing hardware properly. Otherwise we have edit the .dts for each board
> > > to change the user configurable things, which is not nice for distros.
> > 
> > You mean "existing bootloaders", right?
> > 
> > Updated bootloaders should translate user configurable information into 
> > proper DT records and pass the resulting DTB to the kernel separately.
> 
> OMAP is one of the code bases where this really matters - they have a
> _lot_ of existing platforms with boot loaders which do the ATAG stuff.
> They also have a lot of code in arch/arm that needs to be converted to
> a DT representation.

Yes, agreed.  I just wanted to make the situation clear above, so people 
aren't confused in believing that the DT data is always static.  New 
bootloaders should have the same ability to dynamically change some of 
the parameters passed to the kernel.  So the issue is not about existing 
hardware, but rather about existing bootloaders.

> With the current situation where you can have either ATAGs or DT but
> not both, they're currently facing either having to break all the
> existing platforms by ignoring the ATAGs _or_ keeping two copies of
> a considerable amount of data - one in DT form and one in its existing
> form.
> 
> At present, DT can only be used sensibly on brand new SoCs where there
> are no existing platforms with ATAG based boot loaders to worry about.
> As things stand at present, even with your patch series, existing SoCs
> have no viable path to transition to DT.

As I said, I'm now convinced that the patch adding a shim to translate 
ATAGs into DT entries should be added to this series.  I was reluctant 
initially for insentive purposes, but your argument clearly tilted the 
balance the other way.


Nicolas
