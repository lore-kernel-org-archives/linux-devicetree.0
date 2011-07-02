From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: CSR: Adding CSR SiRFprimaII board support
Date: Sat, 2 Jul 2011 21:34:19 +0200
Message-ID: <201107022134.19690.arnd@arndb.de>
References: <1309231954-23260-1-git-send-email-bs14@csr.com>
	<201107011819.43316.arnd@arndb.de>
	<20110702122527.GH21898@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110702122527.GH21898-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, workgroup.linux-kQvG35nSl+M@public.gmane.org, weizeng.he-kQvG35nSl+M@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 02 July 2011 14:25:27 Russell King - ARM Linux wrote:
> On Fri, Jul 01, 2011 at 06:19:43PM +0200, Arnd Bergmann wrote:
> > On Friday 01 July 2011, Barry Song wrote:
> > > It looks like we can new a common function named as of_io_earlymap()
> > > or something in drivers/of/address.c. of_iomap() does ioremap,
> > > of_io_earlymap() does early static mapping?
> > > Then all SoCs can call this function to do early static mapping. if
> > > so, some lines can be deleted in sirfsoc_of_clk_init(). How do you
> > > think about newing the function in drivers/of/address.c?
> > 
> > I think that's a good idea, but the ARM specific implementation cannot
> > be in common code. Other architectures have stuff similar to iotable_init
> > in asm/fixmap.h. If we decide on a function prototype for this, the
> > implementation can be arch/*/.
> 
> One of the issues with fixmap is that its based around single pages
> and indexing an area.  It's idiotic to use such a thing if you have
> to map the ISA memory regions for VGA.
> 
> Plus, of course, forcing everything down the route of ioremap() and
> fixmap forces everyone to use 2-level page tables and 4K page table
> entries, avoiding the possibility of having just a single 1st level
> page table entry covering their IO space.  Not only does it increase
> TLB pressure but it also makes page table walking more expensive.

I didn't mean converting ARM to use fixmap, but having a common prototype
for the function to do an early mapping of devices, regardless if it's
based on fixmap or iotable.

We already discussed the issue of large TLBs for iotable before. If
we ever want to conver that to the fixmap API, we would first have
to extend it with a more straightforward way to do large mappings,
and I'm not going to start that discussion.

I actually didn't know that we had fixmap support on ARM until I looked
now. In fact there are now at least three interfaces that would let you
establish early mappings:

* iotable (ARM only)
* fixmap (some architectures, unused on ARM except for kmap_atomic)
* early_ioremap (x86 only, built on top of fixmap)

Maybe we could implement early_ioremap on ARM on top of iotable,
with support for large pages, and build of_io_earlymap() as suggested
by Barry on top of that?

	Arnd
