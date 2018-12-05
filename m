From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH v4 2/2] PCI: uniphier: Add UniPhier PCIe host controller support
Date: Wed, 05 Dec 2018 11:13:52 +0900
Message-ID: <20181205111351.00E3.4A936039@socionext.com>
References: <1543377866-16634-3-git-send-email-hayashi.kunihiko@socionext.com> <20181204151227.GA29926@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204151227.GA29926@e107981-ln.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi Lorenzo,

On Tue, 4 Dec 2018 15:12:27 +0000 <lorenzo.pieralisi@arm.com> wrote:

> On Wed, Nov 28, 2018 at 01:04:26PM +0900, Kunihiko Hayashi wrote:
> 
> [...]
> 
> > +static void uniphier_pcie_irq_ack(struct irq_data *d)
> > +{
> > +	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct uniphier_pcie_priv *priv = to_uniphier_pcie(pci);
> > +	u32 val;
> > +
> > +	val = readl(priv->base + PCL_RCV_INTX);
> > +	val &= ~PCL_RCV_INTX_ALL_STATUS;
> > +	val |= BIT(irqd_to_hwirq(d) + PCL_RCV_INTX_STATUS_SHIFT);
> > +	writel(val, priv->base + PCL_RCV_INTX);
> > +}
> > +
> > +static void uniphier_pcie_irq_mask(struct irq_data *d)
> > +{
> > +	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct uniphier_pcie_priv *priv = to_uniphier_pcie(pci);
> > +	u32 val;
> > +
> > +	val = readl(priv->base + PCL_RCV_INTX);
> > +	val &= ~PCL_RCV_INTX_ALL_STATUS;
> > +	val |= BIT(irqd_to_hwirq(d) + PCL_RCV_INTX_MASK_SHIFT);
> > +	writel(val, priv->base + PCL_RCV_INTX);
> > +}
> > +
> > +static void uniphier_pcie_irq_unmask(struct irq_data *d)
> > +{
> > +	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct uniphier_pcie_priv *priv = to_uniphier_pcie(pci);
> > +	u32 val;
> > +
> > +	val = readl(priv->base + PCL_RCV_INTX);
> > +	val &= ~PCL_RCV_INTX_ALL_STATUS;
> 
> I have noticed this operation is carried out on ACK/MASK/UNMASK,
> what's its purpose ?

Thanks for pointing out. This is wrong.

The register PCL_RCV_INTX has 3 parts of bits.

#define PCL_RCV_INTX_ALL_ENABLE         GENMASK(19, 16)
#define PCL_RCV_INTX_ALL_MASK           GENMASK(11, 8)
#define PCL_RCV_INTX_ALL_STATUS         GENMASK(3, 0)

In the mask/unmask operation,
We should use PCL_RCV_INTX_ALL_MASK to represent 'mask bits',
not PCL_RCV_INTX_ALL_STATUS.
And the ack operation is effective by writing 1 to 'status bits'.

Thank you,

---
Best Regards,
Kunihiko Hayashi
