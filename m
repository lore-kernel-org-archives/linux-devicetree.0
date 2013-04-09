From: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFCv1 08/11] PCI: Introduce new MSI chip infrastructure
Date: Tue, 9 Apr 2013 09:11:19 +0100
Message-ID: <20130409081119.GA30736@arm.com>
References: <1364316746-8702-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364316746-8702-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAErSpo42AFdKH2RKTxOaeJgCPrYD5KYkOs3UEBez8x8Bjmun5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAErSpo42AFdKH2RKTxOaeJgCPrYD5KYkOs3UEBez8x8Bjmun5w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 08, 2013 at 11:28:58PM +0100, Bjorn Helgaas wrote:
> On Tue, Mar 26, 2013 at 10:52 AM, Thomas Petazzoni
> <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> >
> >  #endif /* LINUX_MSI_H */
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 2461033a..6aca43ea 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -416,6 +416,7 @@ struct pci_bus {
> >         struct resource busn_res;       /* bus numbers routed to this bus */
> >
> >         struct pci_ops  *ops;           /* configuration access functions */
> > +       struct msi_chip *msi;           /* MSI controller */
> 
> "msi" seems like a too-generic name here; it suggests an interrupt or
> IRQ, not a controller.
> 
> I'm not sure this is the correct place for it.  Having it in the
> struct pci_bus means you need arch code to fill it in, e.g., you added
> it in mvebu_pcie_scan_bus() in patch 09/11.  There's no good way to do
> that for arches that use pci_scan_root_bus(), which is the direction
> I'd like to go.
> 
> I think it probably should go in sysdata instead.  That would mean you
> can't really do generic weak setup/tear-down functions, because they
> wouldn't know how to pull the MSI controller info out of the
> arch-specific sysdata.  But there are so many levels of weak-ness
> going on there, maybe it would be a good thing to get rid of one :)

But generic setup/tear-down functions would allow for architecture
independent MSI controllers. This would be useful for MSI controllers that
are unrelated to PCI host controllers or a specific architecture. It would
make drivers sit more comfortably in drivers/irqchip or drivers/pci/host. Also
having the msi_chip in struct pci_bus could allow there to exist multiple
MSI controllers on a PCI fabric and is consistent with pci_ops.

Assuming the MSI controller is represented in the device tree and there is a
relationship between the controller and the host bridge
(phandle/interrupt-parent) then as Thierry suggested[1] previously you could call
something like of_find_msi_chip_by_node(node) to locate an msi_chip from a
device node. Could this look up exist in pci_scan_root_bus via its struct
device.of_node? Perhaps pci_create_root_bus can be changed to take a parameter
for msi_chip alongside the ops parameter? The of_find_msi_chip_by_node could
walk up the device tree until it finds an MSI controller.

In the case where device tree isn't used - then I guess the weakly defined
arch_ callbacks would be replaced with the architectures existing
implementation. Or perhaps if MSI controllers are registered (msi_chip_add)
then pci_scan_root_bus could use the first controller it finds.

Also I believe pci_alloc_child_bus function would need to be changed to add
"b->msi = msi" to inherit msi_chip for child buses in the above patch?

Andrew Murray

[1] http://lkml.org/lkml/2013/3/25/67
