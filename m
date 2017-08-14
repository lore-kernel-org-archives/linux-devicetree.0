From: honghui.zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] PCI: mediatek: add msi support for mt2712 and mt7622
Date: Mon, 14 Aug 2017 09:12:35 +0800
Message-ID: <1502673155.7754.1.camel@mhfsdcap03>
References: <1502454469-29230-1-git-send-email-honghui.zhang@mediatek.com>
 <1502499441.31707.6.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1502499441.31707.6.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, xinping.qian-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2017-08-12 at 08:57 +0800, Ryder Lee wrote:
> Hi Honghui,
> 
> On Fri, 2017-08-11 at 20:27 +0800, honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> ...
> > +static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
> > +{
> > +	u32 val;
> > +
> > +	val = lower_32_bits((u64)(port->base + PCIE_MSI_VECTOR));
> > +	writel(val, port->base + PCIE_IMSI_ADDR);
> > +
> > +	val = readl(port->base + PCIE_INT_MASK);
> > +	val &= ~MSI_MASK;
> > +	writel(val, port->base + PCIE_INT_MASK);
> > +}
> > +
> >  static int mtk_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
> >  			     irq_hw_number_t hwirq)
> >  {
> > @@ -460,6 +574,18 @@ static int mtk_pcie_init_irq_domain(struct mtk_pcie_port *port,
> >  		return PTR_ERR(port->irq_domain);
> >  	}
> >  
> > +	/* Setup MSI */
> > +	if (IS_ENABLED(CONFIG_PCI_MSI)) {
> > +		port->msi_domain = irq_domain_add_linear(node, MTK_MSI_IRQS_NUM,
> > +							 &msi_domain_ops,
> > +							 &mtk_pcie_msi_chip);
> > +		if (!port->msi_domain) {
> > +			dev_err(dev, "Failed to get a MSI IRQ domain\n");
> > +			return PTR_ERR(port->msi_domain);
> 
> Just return -ENOMEM. PTR_ERR(NULL) will cause a static checker warning.

I will fix this in the next version.

Thanks.
> 
> > +		}
> > +		mtk_pcie_enable_msi(port);
> > +	}
> > +
> >  	return 0;
> >  }
> 
> Ryder
> 
