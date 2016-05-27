From: Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/2] pci: Add PCIe driver for Rockchip Soc
Date: Fri, 27 May 2016 07:13:29 +0000
Message-ID: <8520D5D51A55D047800579B094147198258AF22F@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1463740105-7061-1-git-send-email-shawn.lin@rock-chips.com>
 <1463740156-7148-1-git-send-email-shawn.lin@rock-chips.com>
 <9836736.6VjP1ug4kE@wuerfel> <5747EDC9.2080603@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <5747EDC9.2080603-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >
> >> +
> >> +static int rockchip_pcie_rd_other_conf(struct rockchip_pcie_port *pp,
> >> +				       struct pci_bus *bus, u32 devfn,
> >> +				       int where, int size, u32 *val)
> >> +{
> >> +	u32 busdev;
> >> +
> >> +	busdev = PCIE_ECAM_ADDR(bus->number, PCI_SLOT(devfn),
> >> +				PCI_FUNC(devfn), where);
> >> +
> >> +	if (busdev & (size - 1)) {
> >> +		*val = 0;
> >> +		return PCIBIOS_BAD_REGISTER_NUMBER;
> >> +	}
> >> +
> >> +	if (size == 4) {
> >> +		*val = readl(pp->reg_base + busdev);
> >> +	} else if (size == 2) {
> >> +		*val = readw(pp->reg_base + busdev);
> >> +	} else if (size == 1) {
> >> +		*val = readb(pp->reg_base + busdev);
> >> +	} else {
> >> +		*val = 0;
> >> +		return PCIBIOS_BAD_REGISTER_NUMBER;
> >> +	}
> >> +	return PCIBIOS_SUCCESSFUL;
> >> +}
> >> +
> >
> > This looks like the normal ECAM operations, you could just call those.
> 
> I read ECAM reference code, I found it not support ioremap config space
> for each bus individually on 64-bit systems. Our soc is 64-bit system,
> and bus0 config space base address is 0xfda00000, bus1 base address is
> 0xf8100000. So I think it is not normal ECAM operations, I do not know
> if I have understood correctly?
> 
Hi,

I think Arnd was suggesting to use generic config read/write calls, pci_generic_config_read/pci_generic_config_write
which does above functionality.

Bharat 
