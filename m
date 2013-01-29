From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/5] dmaengine: dw_dmac: move to generic DMA binding
Date: Tue, 29 Jan 2013 16:36:38 +0000
Message-ID: <201301291636.38773.arnd@arndb.de>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <201301291455.49347.arnd@arndb.de>
 <20130129154409.GA23505@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130129154409.GA23505-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 29 January 2013, Russell King - ARM Linux wrote:
> That's a good way to represent it but it fails in a very big way:
> You're stuffing N peripherals down to 3 request lines to the DMA
> engine, and you may want more than 3 of those peripherals to be
> making use of the DMA engine at any one time.
> 
> Before anyone says "you shouldn't be doing this" consider this:
> your typical DMA slave engine already has this structure:
> 
> N DMA channels <---> M DMA requests <---> M peripherals
> 
> where N < M.  In other words, there is already a MUX between the
> peripherals and the DMA engine channels themselves (what do you think
> the "request index" which you have to program into DMA channel control
> registers is doing...

Ok.

> We support this external mux today in the PL080 driver - and we do that
> by having the PL080 driver do the scheduling of virtual DMA channels on
> the actual hardware itself.  The PL080 driver has knowledge that there
> may be some sort of additional muxing layer between it and the
> peripheral.
> 
> As the APIs stand today, you just can't do this without having the
> DMA engine driver itself intimately involved because a layer above
> doesn't really have much clue as to what's going on, and the DMA
> engine stuff itself doesn't layer particularly well.

If the pl080 driver already has code for the mux in it, then it should
handle both of_dma_controller instances in my example. It would
not change anything regarding the binding, which just describes the
way that the hardware is connected. I have not looked at the implementation
of the pl080 driver, but I'd assume we could get away with just having
two separate xlate() functions. It's slightly ugly to have one driver
take responsibility for two device_node:s, but it's not unheard of.
In the probe function for the pl080 node, the driver can walk the
entire device tree to find any mux devices connected to it and
register an of_dma_controller() with its xlate function for those.

Unless you see another issue with this, I'd assume it's all covered
by the new interface, but it also doesn't get better than what we
have today.

	Arnd
