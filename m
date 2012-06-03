From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: ARM PCI controller registration and representation using device
 tree?
Date: Sun, 3 Jun 2012 02:41:52 +0000
Message-ID: <201206030241.52775.arnd@arndb.de>
References: <4113992.BTnO0ZYQON@bender>
 <20120602143448.GA1624@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120602143448.GA1624-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 02 June 2012, Russell King - ARM Linux wrote:
> I think we have to keep the existing strategy of having struct hw_pci and
> its pci_sys_data, registering each bus separately with its own individual
> swizzle and map_irq functions depending on how the bus hardware is setup.

Actually, I think we won't need to call pci_fixup_irqs for DT at all, so
there won't be host specific swizzle and map_irq functions. AFAICT the
interrupt-map property can handle all possible cases, it certainly does
so for a large number of obscure buses on powerpc.

Please have a look at drivers/of/of_pci_irq.c to see if you can spot
anything missing in there. The interrupt-map lets you define a mapping
from a bus-specific interrupt number to a global one, with an address/mask
of the bus/dev/fn ID of the device(s) it applies to. For anything with
default swizzling, we just provide the map for the root dev, while those
devices that require a more complex mapping need to list each IRQ line
that is connected differently. See arch/powerpc/boot/dts/mpc5121ads.dts
for an example with a nonstandard mapping.

> Also rememer that the PCI configuration space accessor functions are highly
> PCI host bridge specific.

Right. We can have a default ones for mmconfig and PIO 0xcfc in drivers/pci,
but I think most will have a separate one on ARM.

	Arnd
