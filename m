From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFCv1 07/11] irqchip: armada-370-xp: add MSI support to
 interrupt controller driver
Date: Tue, 26 Mar 2013 18:38:22 +0000
Message-ID: <201303261838.23246.arnd@arndb.de>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201303261707.41563.arnd@arndb.de> <20130326181754.33b89559@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130326181754.33b89559@skate>
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
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 26 March 2013, Thomas Petazzoni wrote:

> 
> I've tried to explain that in the commit log of PATCH 6, which says:
> 
>     However, we need the driver to expose two different IRQ domains: one
>     for the main interrupt controller itself, and one for the MSI
>     interrupt controller. In order to achieve this, we will create two
>     subnodes in the interrupt-controller@d0020000 node: one subnode for
>     the main interrupt controller, and one subnode for the MSI interrupt
>     controller. The two irq domains can't be registered on the same DT
>     node, otherwise when irq_find_host() gets used by of_irq_map_one()
>     to resolve IRQs of devices, they may find the MSI interrupt
>     controller instead of the main interrupt controller.

Right, I should have read the commit log better ...

>     Note that both the parent and the child node need to have the
>     'interrupt-controller' empty property:
>     
>       * The interrupt-controller property is needed in the main
>     interrupt controller node (interrupt-controller@d0020000) because
>     the of_irq_init() function skips nodes that are matching the given
>        compatible string, but that don't have the interrupt-controller
>        property.
>     
>      * The interrupt-controller property is needed in the child
>     interrupt controller node (main-intc@d0020000) otherwise the
>     resolution done by of_irq_map_one() doesn't work.

If you add compatible properties to the children, that would work
I suppose.

> So really, the thing is that irq_domain_add_linear() registers an IRQ
> domain on a specific DT node, and then irq_find_host() finds back an
> IRQ domain from a given DT node. So if you have two IRQ domains
> registered on the same DT node, then you don't know which one will be
> used.
> 
> So if I do the two irq_domain_add_linear() (one for MPIC, one for MSI)
> on one single DT node, when the timer driver will request its
> interrupt, it turns out that the MSI IRQ domain is used and not the
> MPIC IRQ domain, even though the timer has <&mpic> as its interrupt
> parent.

I still wonder if the real solution shouldn't instead be to make the
irq domain code MSI aware. For instance, you don't really need a
cell to describe an interrupt because the interrupt number is
not a hardware property. So an MSI using device doesn't really
needs an "msis" or "interrupts" property, just an "msi-parent",
and we can add code to handle as a separate domain even if you
have a single device node that can do both level and message
interrupts.

	Arnd
