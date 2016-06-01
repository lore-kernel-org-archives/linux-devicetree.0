From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/2] pci: Add PCIe driver for Rockchip Soc
Date: Wed, 01 Jun 2016 10:24:11 +0200
Message-ID: <4816755.yFEaWXVu6I@wuerfel>
References: <1463740105-7061-1-git-send-email-shawn.lin@rock-chips.com>
 <8520D5D51A55D047800579B094147198258AF22F@XAP-PVEXMBX01.xlnx.xilinx.com>
 <57482200.9090008@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <57482200.9090008-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday, May 27, 2016 6:31:28 PM CEST Wenrui Li wrote:
> Hi,
> 
> On 2016/5/27 15:13, Bharat Kumar Gogada wrote:
> >>>
> >>>> +
> >>>> +static int rockchip_pcie_rd_other_conf(struct rockchip_pcie_port *pp,
> >>>> +                                 struct pci_bus *bus, u32 devfn,
> >>>> +                                 int where, int size, u32 *val)
> >>>> +{
> >>>> +  u32 busdev;
> >>>> +
> >>>> +  busdev = PCIE_ECAM_ADDR(bus->number, PCI_SLOT(devfn),
> >>>> +                          PCI_FUNC(devfn), where);
> >>>> +
> >>>> +  if (busdev & (size - 1)) {
> >>>> +          *val = 0;
> >>>> +          return PCIBIOS_BAD_REGISTER_NUMBER;
> >>>> +  }
> >>>> +
> >>>> +  if (size == 4) {
> >>>> +          *val = readl(pp->reg_base + busdev);
> >>>> +  } else if (size == 2) {
> >>>> +          *val = readw(pp->reg_base + busdev);
> >>>> +  } else if (size == 1) {
> >>>> +          *val = readb(pp->reg_base + busdev);
> >>>> +  } else {
> >>>> +          *val = 0;
> >>>> +          return PCIBIOS_BAD_REGISTER_NUMBER;
> >>>> +  }
> >>>> +  return PCIBIOS_SUCCESSFUL;
> >>>> +}
> >>>> +
> >>>
> >>> This looks like the normal ECAM operations, you could just call those.
> >>
> >> I read ECAM reference code, I found it not support ioremap config space
> >> for each bus individually on 64-bit systems. Our soc is 64-bit system,
> >> and bus0 config space base address is 0xfda00000, bus1 base address is
> >> 0xf8100000. So I think it is not normal ECAM operations, I do not know
> >> if I have understood correctly?
> >>
> > Hi,
> >
> > I think Arnd was suggesting to use generic config read/write calls, pci_generic_config_read/pci_generic_config_write
> > which does above functionality.
> 
> Yeah, I seem the pci_generic_config_write use writew/writeb for byte and 
> word write. but our SOC not support byte and word write in RC config 
> spcace. So I redefine the the pci_ops.write

Rihgt, that bug should be documented somewhere. You can also use
the pci_generic_config_read32/pci_generic_config_write32 functions
for this.

I wonder if we should add a more general way of treating type 1
config space accesses differently, as a lot of host bridges have
similar requirements, accessing the registers in a different place,
different layout, or other constraints.

The patch below would make that very easy to do. Suggestions for
better naming welcome.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index d11cdbb8fba3..2f7dcaa63e1d 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -34,9 +34,12 @@ int pci_bus_read_config_##size \
 	u32 data = 0;							\
 	if (PCI_##size##_BAD) return PCIBIOS_BAD_REGISTER_NUMBER;	\
 	raw_spin_lock_irqsave(&pci_lock, flags);			\
-	res = bus->ops->read(bus, devfn, pos, len, &data);		\
+	if (bus->number == 0 && bus->ops->read0)			\
+		res = bus->ops->read0(bus, devfn, pos, len, &data);	\
+	else								\
+		res = bus->ops->read(bus, devfn, pos, len, &data);	\
 	*value = (type)data;						\
-	raw_spin_unlock_irqrestore(&pci_lock, flags);		\
+	raw_spin_unlock_irqrestore(&pci_lock, flags);			\
 	return res;							\
 }
 
@@ -48,8 +51,11 @@ int pci_bus_write_config_##size \
 	unsigned long flags;						\
 	if (PCI_##size##_BAD) return PCIBIOS_BAD_REGISTER_NUMBER;	\
 	raw_spin_lock_irqsave(&pci_lock, flags);			\
-	res = bus->ops->write(bus, devfn, pos, len, value);		\
-	raw_spin_unlock_irqrestore(&pci_lock, flags);		\
+	if (bus->number == 0 && bus->ops->write0)			\
+		res = bus->ops->write0(bus, devfn, pos, len, value);	\
+	else								\
+		res = bus->ops->write(bus, devfn, pos, len, value);	\
+	raw_spin_unlock_irqrestore(&pci_lock, flags);			\
 	return res;							\
 }
 
@@ -72,7 +78,11 @@ int pci_generic_config_read(struct pci_bus *bus, unsigned int devfn,
 {
 	void __iomem *addr;
 
-	addr = bus->ops->map_bus(bus, devfn, where);
+	if (bus->number == 0 && bus->ops->map_bus0)
+		addr = bus->ops->map_bus0(bus, devfn, where);
+	else
+		addr = bus->ops->map_bus(bus, devfn, where);
+
 	if (!addr) {
 		*val = ~0;
 		return PCIBIOS_DEVICE_NOT_FOUND;
@@ -94,7 +104,10 @@ int pci_generic_config_write(struct pci_bus *bus, unsigned int devfn,
 {
 	void __iomem *addr;
 
-	addr = bus->ops->map_bus(bus, devfn, where);
+	if (bus->number == 0 && bus->ops->map_bus0)
+		addr = bus->ops->map_bus0(bus, devfn, where);
+	else
+		addr = bus->ops->map_bus(bus, devfn, where);
 	if (!addr)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
@@ -114,7 +127,10 @@ int pci_generic_config_read32(struct pci_bus *bus, unsigned int devfn,
 {
 	void __iomem *addr;
 
-	addr = bus->ops->map_bus(bus, devfn, where & ~0x3);
+	if (bus->number == 0 && bus->ops->map_bus0)
+		addr = bus->ops->map_bus0(bus, devfn, where);
+	else
+		addr = bus->ops->map_bus(bus, devfn, where & ~0x3);
 	if (!addr) {
 		*val = ~0;
 		return PCIBIOS_DEVICE_NOT_FOUND;
@@ -135,7 +151,10 @@ int pci_generic_config_write32(struct pci_bus *bus, unsigned int devfn,
 	void __iomem *addr;
 	u32 mask, tmp;
 
-	addr = bus->ops->map_bus(bus, devfn, where & ~0x3);
+	if (bus->number == 0 && bus->ops->map_bus0)
+		addr = bus->ops->map_bus0(bus, devfn, where);
+	else
+		addr = bus->ops->map_bus(bus, devfn, where & ~0x3);
 	if (!addr)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index df41c4645911..1caae3bd7115 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -580,6 +580,9 @@ struct pci_ops {
 	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
 	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
 	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
+	void __iomem *(*map_bus0)(struct pci_bus *bus, unsigned int devfn, int where);
+	int (*read0)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
+	int (*write0)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
 };
 
 /*
