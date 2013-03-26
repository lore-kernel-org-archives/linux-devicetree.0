From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFCv1 07/11] irqchip: armada-370-xp: add MSI support to
 interrupt controller driver
Date: Tue, 26 Mar 2013 21:10:15 +0000
Message-ID: <201303262110.15582.arnd@arndb.de>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201303261838.23246.arnd@arndb.de> <20130326214613.30fbdddf@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130326214613.30fbdddf@skate>
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
> Dear Arnd Bergmann,
> 
> On Tue, 26 Mar 2013 18:38:22 +0000, Arnd Bergmann wrote:
> 
> > >     Note that both the parent and the child node need to have the
> > >     'interrupt-controller' empty property:
> > >     
> > >       * The interrupt-controller property is needed in the main
> > >     interrupt controller node (interrupt-controller@d0020000)
> > > because the of_irq_init() function skips nodes that are matching
> > > the given compatible string, but that don't have the
> > > interrupt-controller property.
> > >     
> > >      * The interrupt-controller property is needed in the child
> > >     interrupt controller node (main-intc@d0020000) otherwise the
> > >     resolution done by of_irq_map_one() doesn't work.
> > 
> > If you add compatible properties to the children, that would work
> > I suppose.
> 
> To which children? Only to the main-intc children? If so,
> armada_370_xp_mpic_of_init() would be called with a 'device_node *'
> that points to the main-intc, correct? Then it would have to go back up
> in the Device Tree to find the msi node? It's doable of course, but
> sounds strange, no?

I was thinking of registering two init functions as well.

> To me, the topology of the hardware is really that a single device
> provides two features: the main interrupt controller and the MSI
> interrupt controller. But I will adapt to whatever DT binding you
> propose.

My preference would be to have no sub-nodes but rather make the
code deal with an interrupt controller that has an interrupt domain
for regular IRQs but can also handle MSI.

> > I still wonder if the real solution shouldn't instead be to make the
> > irq domain code MSI aware. For instance, you don't really need a
> > cell to describe an interrupt because the interrupt number is
> > not a hardware property. So an MSI using device doesn't really
> > needs an "msis" or "interrupts" property, just an "msi-parent",
> > and we can add code to handle as a separate domain even if you
> > have a single device node that can do both level and message
> > interrupts.
> 
> So the msi-parent property should point to the single mpic node? But
> then the IRQ domain for MSI cannot be registered on this single MPIC
> node. Then, what would be the first argument of:
> 
>         armada_370_xp_msi_domain =
>                 irq_domain_add_linear(msi_node, PCI_MSI_DOORBELL_NR,
>                                       &armada_370_xp_msi_irq_ops, NULL);
> 
> and how would the PCIe driver get a pointer to this IRQ domain? (In the
> currently proposed code, it just does a irq_find_host(), which sounded
> very simple and straightforward).

I guess one way would be to have a single domain that is responsible
for the controller and handles both MSI and legacy interrupts. That
could probably be done without changes to the interrupt domain code.

Another option would be to add an irq_domain_add_msi() function that
creates a domain which is also tied to the same device node but does
not interact with it when going through the legacy interrupts.
You could then add a matching msi_find_host() or irq_find_msi_host()
function to return the domain.

> To clarify: I really don't mind reworking the code, but unfortunately
> "make the IRQ domain code MSI aware" is too vague for me to understand
> the direction you're thinking of.

I don't have specific code in mind yet, mainly playing around with the
possibilities for now.

	Arnd
