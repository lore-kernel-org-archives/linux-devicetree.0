From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: ARM PCI controller registration and representation using
 device tree?
Date: Sat, 2 Jun 2012 15:34:48 +0100
Message-ID: <20120602143448.GA1624@n2100.arm.linux.org.uk>
References: <4113992.BTnO0ZYQON@bender>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4113992.BTnO0ZYQON@bender>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Jun 02, 2012 at 04:18:11PM +0200, Florian Fainelli wrote:
> I was wondering if anyone had started working on representing the various PCI 
> controllers found on SoCs to a device tree representation?
> 
> It seems like quite some generic code could be borrowed from PowerPC, 
> especially the parsing of the PCI ranges, though I don't see ARM directly 
> exposing a struct pci_controller to easily allow that.
> 
> Any thoughts about this?

I think we have to keep the existing strategy of having struct hw_pci and
its pci_sys_data, registering each bus separately with its own individual
swizzle and map_irq functions depending on how the bus hardware is setup.
Also rememer that the PCI configuration space accessor functions are highly
PCI host bridge specific.

I don't think we can (or should) rely upon platforms having code in their
boot loader to probe the PCI bus, and provide the kernel with the PCI bus
structure.

I don't see this as a problem for DT - we just need a way to represent
each PCI bus as some kind of device.  I'm thinking whether we could get
away with converting the existing model to use platform devices, and
then we can use the existing DT platform device code to create the
relevant platform device.

Irrespective of whether your PCI host bridge appears as PCI device 0:0.0
or not, that's probably the right idea anyway.
