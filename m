From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] PCI: mediatek: Set up class type and vendor ID
 for MT7622
Date: Tue, 26 Dec 2017 09:41:12 +0800
Message-ID: <1514252472.25872.29.camel@mhfsdcap03>
References: <1513921178-16148-1-git-send-email-honghui.zhang@mediatek.com>
         <1513921178-16148-3-git-send-email-honghui.zhang@mediatek.com>
         <1514197661.25015.9.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514197661.25015.9.camel@mtkswgap22>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, xinping.qian-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-12-25 at 18:27 +0800, Ryder Lee wrote:
> On Fri, 2017-12-22 at 13:39 +0800, honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > The hardware default value of IDs and class type is not correct,
> > fix that by setup the correct values before start up.
> > 
> > Signed-off-by: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/pci/host/pcie-mediatek.c | 12 ++++++++++++
> >  include/linux/pci_ids.h          |  3 +++
> >  2 files changed, 15 insertions(+)
> > 
> > diff --git a/drivers/pci/host/pcie-mediatek.c b/drivers/pci/host/pcie-mediatek.c
> > index fc29a9a..0ef33e4 100644
> > --- a/drivers/pci/host/pcie-mediatek.c
> > +++ b/drivers/pci/host/pcie-mediatek.c
> > @@ -74,6 +74,10 @@
> >  
> >  /* PCIe V2 per-port registers */
> >  #define PCIE_MSI_VECTOR		0x0c0
> > +
> > +#define PCIE_CONF_ID		0x100
> > +#define PCIE_CONF_CLASS		0x104
> > +
> >  #define PCIE_INT_MASK		0x420
> >  #define INTX_MASK		GENMASK(19, 16)
> >  #define INTX_SHIFT		16
> > @@ -393,6 +397,14 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
> >  		val |= PCIE_CSR_LTSSM_EN(port->slot) |
> >  		       PCIE_CSR_ASPM_L1_EN(port->slot);
> >  		writel(val, pcie->base + PCIE_SYS_CFG_V2);
> > +
> > +		/* Set up vendor ID and device ID for MT7622*/
> > +		val = PCI_VENDOR_ID_MEDIATEK | (PCI_DEVICE_ID_MT7622 << 16);
> > +		writel(val, port->base + PCIE_CONF_ID);
> 
> IMHO, this is a general function so you can ignore "device ID for
> MT7622" here, but just make sure class code/vendor ID correct.

Hmm, this condition is only for MT7622 for now.
Well, host driver and framework does not cares about the device ID for
host bridge. I guess I can bypass the setting of device ID.

thanks.

> 
> > +		/* Set up class code for MT7622 */
> > +		val = PCI_CLASS_BRIDGE_PCI << 16;
> > +		writel(val, port->base + PCIE_CONF_CLASS);
> >  	}
> >  
> >  	/* Assert all reset signals */
> > diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> > index ab20dc5..000c5df 100644

> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
