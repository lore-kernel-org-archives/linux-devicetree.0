From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] PCI: mediatek: add msi support for mt2712 and mt7622
Date: Sat, 12 Aug 2017 08:57:21 +0800
Message-ID: <1502499441.31707.6.camel@mtkswgap22>
References: <1502454469-29230-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502454469-29230-1-git-send-email-honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, hongkun.cao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, xinping.qian-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Honghui,

On Fri, 2017-08-11 at 20:27 +0800, honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
...
> +static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
> +{
> +	u32 val;
> +
> +	val = lower_32_bits((u64)(port->base + PCIE_MSI_VECTOR));
> +	writel(val, port->base + PCIE_IMSI_ADDR);
> +
> +	val = readl(port->base + PCIE_INT_MASK);
> +	val &= ~MSI_MASK;
> +	writel(val, port->base + PCIE_INT_MASK);
> +}
> +
>  static int mtk_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
>  			     irq_hw_number_t hwirq)
>  {
> @@ -460,6 +574,18 @@ static int mtk_pcie_init_irq_domain(struct mtk_pcie_port *port,
>  		return PTR_ERR(port->irq_domain);
>  	}
>  
> +	/* Setup MSI */
> +	if (IS_ENABLED(CONFIG_PCI_MSI)) {
> +		port->msi_domain = irq_domain_add_linear(node, MTK_MSI_IRQS_NUM,
> +							 &msi_domain_ops,
> +							 &mtk_pcie_msi_chip);
> +		if (!port->msi_domain) {
> +			dev_err(dev, "Failed to get a MSI IRQ domain\n");
> +			return PTR_ERR(port->msi_domain);

Just return -ENOMEM. PTR_ERR(NULL) will cause a static checker warning.

> +		}
> +		mtk_pcie_enable_msi(port);
> +	}
> +
>  	return 0;
>  }

Ryder

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
