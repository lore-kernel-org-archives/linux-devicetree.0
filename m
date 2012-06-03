From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: ARM PCI controller registration and representation using device
 tree?
Date: Sun, 3 Jun 2012 11:54:42 +0000
Message-ID: <201206031154.42290.arnd@arndb.de>
References: <4113992.BTnO0ZYQON@bender> <201206030241.52775.arnd@arndb.de>
 <20120603075544.GA15354@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120603075544.GA15354-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
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

On Sunday 03 June 2012, Russell King - ARM Linux wrote:
> 
> On Sun, Jun 03, 2012 at 02:41:52AM +0000, Arnd Bergmann wrote:
> > On Saturday 02 June 2012, Russell King - ARM Linux wrote:
> > > I think we have to keep the existing strategy of having struct hw_pci and
> > > its pci_sys_data, registering each bus separately with its own individual
> > > swizzle and map_irq functions depending on how the bus hardware is setup.
> > 
> > Actually, I think we won't need to call pci_fixup_irqs for DT at all, so
> > there won't be host specific swizzle and map_irq functions. AFAICT the
> > interrupt-map property can handle all possible cases, it certainly does
> > so for a large number of obscure buses on powerpc.
> 
> That means you have to list every PCI device in DT along with its
> interrupt number - which means your boot loader will have to scan the
> PCI bus and provide interrupt and BAR settings into the kernel.

Actually not, there is only one "interrupt-map" property in the PCI
host node, no need to list the add-on cards that use regular swizzling.

The binding is a little hard to understand at first, but it's all in there:
http://www.openfirmware.org/1275/proposals/Attachments/321att.pdf

> And that will suck if you have something like a 4 port PCI network card
> which has a PCI-to-PCI bridge on - are boot loaders going to have the
> correct swizzling support?  I think not.

I can assure you that those cases are covered by the binding. We have PCI
buses on most PowerPC systems, and we don't normally list the devices on
them, although the PCI binding allows us to. In the example you mention,
of_irq_map_pci will walk up the buses across all PCI bridges using standard
swizzling until it gets to a device that has a device node, which is
normally the host controller, but it can also be a device that is hardwired.

If a device or slot is hardwired to a specific IRQ, there is no problem
listing it in the device tree without the need for a bus walk in the boot
loarder. If it's not hardwired, then it should use the swizzling algorithm
in the bridge.

	Arnd
