Return-Path: <SRS0=LAGs=DS=mobiveil.co.in=l.subrahmanya@kernel.org>
MIME-Version: 1.0
In-Reply-To: <23b886bf-b21e-8e8c-460c-42316469f989@arm.com>
References: <1513181336-19955-1-git-send-email-l.subrahmanya@mobiveil.co.in> <23b886bf-b21e-8e8c-460c-42316469f989@arm.com>
From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Date: Fri, 22 Dec 2017 14:22:32 +0530
Message-ID: <CAFZiPx1jAMLCtPZx75j_H07NGXJy-Hq2gJzuMhU=7iw4Tkk+ZA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] PCI: mobiveil: Add MSI support for Mobiveil PCIe Host
Content-Type: multipart/alternative; boundary="f403045f4dd6f603440560e9efd8"
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, robh@kernel.org, devicetree@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, Peter W Newton <peter.newton@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Raj Raina <rajesh.raina@nxp.com>, Rajan Kapoor <rajan.kapoor@nxp.com>, Prabhjot Singh <prabhjot.singh@nxp.com>
List-ID: <devicetree@vger.kernel.org>

--f403045f4dd6f603440560e9efd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marc,

On Fri, Dec 15, 2017 at 9:43 PM, Marc Zyngier <marc.zyngier@arm.com> wrote:

> On 13/12/17 16:08, Subrahmanya Lingappa wrote:
> > Adds MSI support for Mobiveil PCIe Host Bridge IP driver
> >
> > Signed-off-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > Cc: linux-pci@vger.kernel.org
> > ---
> >  drivers/pci/host/pcie-mobiveil.c | 222 ++++++++++++++++++++++++++++++
> ++++++++-
> >  1 file changed, 220 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/host/pcie-mobiveil.c b/drivers/pci/host/pcie-
> mobiveil.c
> > index 8611aaa..39818d5 100644
> > --- a/drivers/pci/host/pcie-mobiveil.c
> > +++ b/drivers/pci/host/pcie-mobiveil.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/irqdomain.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > +#include <linux/msi.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/of_platform.h>
> > @@ -55,6 +56,7 @@
> >  #define PAB_INTP_AMBA_MISC_ENB       0x0b0c
> >  #define PAB_INTP_AMBA_MISC_STAT      0x0b1c
> >  #define  PAB_INTP_INTX_MASK  0x1e0
> > +#define  PAB_INTP_MSI_MASK   0x8
> >
> >  #define PAB_AXI_AMAP_CTRL(win)       PAB_REG_ADDR_16(0x0ba0, win)
> >  #define  WIN_ENABLE_SHIFT    0
> > @@ -85,8 +87,19 @@
> >
> >  /* supported number of interrupts */
> >  #define PCI_NUM_INTX         4
> > +#define PCI_NUM_MSI          16
> >  #define PAB_INTA_POS         5
> >
> > +/* MSI registers */
> > +#define MSI_BASE_LO_OFFSET   0x04
> > +#define MSI_BASE_HI_OFFSET   0x08
> > +#define MSI_SIZE_OFFSET              0x0c
> > +#define MSI_ENABLE_OFFSET    0x14
> > +#define MSI_STATUS_OFFSET    0x18
> > +#define MSI_DATA_OFFSET              0x20
> > +#define MSI_ADDR_L_OFFSET    0x24
> > +#define MSI_ADDR_H_OFFSET    0x28
> > +
> >  /* outbound and inbound window definitions */
> >  #define WIN_NUM_0            0
> >  #define WIN_NUM_1            1
> > @@ -105,11 +118,22 @@
> >  #define UINT64_MAX           (u64)(~((u64)0))
> >  #endif
> >
> > +struct mobiveil_msi {                        /* MSI information */
> > +     struct mutex lock;              /* protect bitmap variable */
> > +     struct irq_domain *msi_domain;
> > +     struct irq_domain *dev_domain;
> > +     phys_addr_t msi_pages_phys;
> > +     int *msi_pages;
> > +     int num_of_vectors;
> > +     DECLARE_BITMAP(msi_irq_in_use, PCI_NUM_MSI);
> > +};
> > +
> >  struct mobiveil_pcie {
> >       struct platform_device *pdev;
> >       struct list_head resources;
> >       void __iomem *config_axi_slave_base;    /* endpoint config base *=
/
> >       void __iomem *csr_axi_slave_base;       /* root port config base =
*/
> > +     void __iomem *apb_csr_base;     /* MSI register base */
> >       struct irq_domain *intx_domain;
> >       int irq;
> >       int apio_wins;
> > @@ -118,6 +142,7 @@ struct mobiveil_pcie {
> >       int ib_wins_configured; /*  configured inbound windows */
> >       struct resource *ob_io_res;
> >       char root_bus_nr;
> > +     struct mobiveil_msi msi;
> >  };
> >
> >  static inline void csr_writel(struct mobiveil_pcie *pcie, const u32
> value,
> > @@ -202,11 +227,18 @@ static void mobiveil_pcie_isr(struct irq_desc
> *desc)
> >       struct irq_chip *chip =3D irq_desc_get_chip(desc);
> >       struct mobiveil_pcie *pcie =3D irq_desc_get_handler_data(desc);
> >       struct device *dev =3D &pcie->pdev->dev;
> > -     u32 intr_status;
> > +     struct mobiveil_msi *msi =3D &pcie->msi;
> > +     u32 msi_data, msi_addr_lo, msi_addr_hi;
> > +     u32 intr_status, msi_status;
> >       unsigned long shifted_status;
> >       u32 bit, virq;
> >       u32 val, mask;
> >
> > +     /*
> > +      * The core provides a single interrupt for both INTx/MSI message=
s.
> > +      * So we'll read both INTx and MSI status
> > +      */
> > +
> >       chained_irq_enter(chip, desc);
> >
> >       /* read INTx status */
> > @@ -241,6 +273,41 @@ static void mobiveil_pcie_isr(struct irq_desc *des=
c)
> >               } while ((shifted_status >>  PAB_INTA_POS) !=3D 0);
> >       }
> >
> > +     /* read extra MSI status register */
> > +     msi_status =3D readl(pcie->apb_csr_base + MSI_STATUS_OFFSET);
>
> You are using the non-relaxed accessors here, while the rest of the
> driver used the _relaxed version. Why is that so?
>
> i
=E2=80=8Bt was a slip, I will correct it to use relaxed order.
=E2=80=8B

> > +
> > +     /* handle MSI interrupts */
> > +     if ((intr_status & PAB_INTP_MSI_MASK) || (msi_status & 1)) {
> > +             do {
> > +                     msi_data =3D readl(pcie->apb_csr_base +
> MSI_DATA_OFFSET);
> > +
> > +                     /*
> > +                      * MSI_STATUS_OFFSET gets updated to zero once we
> have
> > +                      * popped not only the data but also address from
> MSI
> > +                      * hardware FIFO.so keeping these following two
> dummy
> > +                      * reads.
> > +                      */
> > +                     msi_addr_lo =3D readl(pcie->apb_csr_base +
> > +                                     MSI_ADDR_L_OFFSET);
> > +                     msi_addr_hi =3D readl(pcie->apb_csr_base +
> > +                                     MSI_ADDR_H_OFFSET);
>
> Is that really valid? Don't you have to issue a 64bit access?
>
Seems like its valid, because its just a pair of DWORD =E2=80=8B

=E2=80=8Baccesses to config register space to read MSI data captured inside=
 bridge
hardware FIFO.
is there any reason you think its invalid?

>
> > +                     dev_dbg(dev,
> > +                             "MSI registers, data: %08x, addr:
> %08x:%08x\n",
> > +                             msi_data, msi_addr_hi, msi_addr_lo);
> > +
> > +                     if (msi_data) {
> > +                             virq =3D irq_find_mapping(msi->dev_domain=
,
> > +                                     msi_data);
> > +                             if (virq)
> > +                                     generic_handle_irq(virq);
> > +                     } else
> > +                             dev_err_ratelimited(dev, "MSI data
> null\n");
>
> Braces on both sides of the else statement.
>
> Also, why is msi_data=3D=3D0 not valid? You can definitely allocate it fr=
om
> your bitmap, and I'm expecting that there is a strong correlation
> between what you read from MSI_DATA_OFFSET and the payload that the
> =E2=80=8B=E2=80=8B
> endpoint writes.
>
> =E2=80=8B=E2=80=8BAgreed msi_=E2=80=8Bdata=3D=3D0 should also be valid. w=
ill be fixed.=E2=80=8B

> +
> > +                     msi_status =3D readl(pcie->apb_csr_base +
> > +                                     MSI_STATUS_OFFSET);
> > +             } while (msi_status & 1);
> > +     }
> > +
> >       csr_writel(pcie, intr_status, PAB_INTP_AMBA_MISC_STAT);
> >       chained_irq_exit(chip, desc);
> >  }
> > @@ -274,6 +341,12 @@ static int mobiveil_pcie_parse_dt(struct
> mobiveil_pcie *pcie)
> >       if (IS_ERR(pcie->csr_axi_slave_base))
> >               return PTR_ERR(pcie->csr_axi_slave_base);
> >
> > +     /* map MSI config resource */
> > +     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "apb_csr");
> > +     pcie->apb_csr_base =3D devm_pci_remap_cfg_resource(dev, res);
> > +     if (IS_ERR(pcie->apb_csr_base))
> > +             return PTR_ERR(pcie->apb_csr_base);
> > +
> >       /* read the number of windows requested */
> >       if (!pcie->apio_wins &&
> >               of_property_read_u32(node, "apio-wins", &pcie->apio_wins)=
)
> {
> > @@ -430,6 +503,27 @@ static int mobiveil_bringup_link(struct
> mobiveil_pcie *pcie)
> >       return -ETIMEDOUT;
> >  }
> >
> > +static void mobiveil_pcie_enable_msi(struct mobiveil_pcie *pcie)
> > +{
> > +     phys_addr_t msg_addr;
> > +     struct mobiveil_msi *msi =3D &pcie->msi;
> > +
> > +
> > +     pcie->msi.num_of_vectors =3D PCI_NUM_MSI;
> > +
> > +     msi->msi_pages =3D (void *)__get_free_pages(GFP_DMA, 0);
>
> That old trick again... Do you really need to carve out a RAM page for
> this? Can't you use just some dummy physical address instead? The base
> address of your PCIe RC, for example.
>
=E2=80=8BDue to the current hardware bug=E2=80=8B

=E2=80=8Bwe do need a real RAM location to write this MSI data into, as we =
cant use
any dummy address for now.
=E2=80=8B

>
> > +     msg_addr =3D virt_to_phys((void *)msi->msi_pages);
> > +     msi->msi_pages_phys =3D (phys_addr_t)msg_addr;
> > +
> > +     writel_relaxed(lower_32_bits(msg_addr),
> > +             pcie->apb_csr_base + MSI_BASE_LO_OFFSET);
> > +     writel_relaxed(upper_32_bits(msg_addr),
> > +             pcie->apb_csr_base + MSI_BASE_HI_OFFSET);
> > +     writel_relaxed(4096, pcie->apb_csr_base + MSI_SIZE_OFFSET);
> > +     writel_relaxed(1,
> > +             pcie->apb_csr_base + MSI_ENABLE_OFFSET);
>
> nit: No need to break all these writes, each of them can fit on a single
> line.
>
> > +}
> > +
> >  static int mobiveil_host_init(struct mobiveil_pcie *pcie)
> >  {
> >       u32 value;
> > @@ -465,7 +559,8 @@ static int mobiveil_host_init(struct mobiveil_pcie
> *pcie)
> >               (1 << PEX_PIO_ENABLE_SHIFT),
> >               PAB_CTRL);
> >
> > -     csr_writel(pcie, PAB_INTP_INTX_MASK, PAB_INTP_AMBA_MISC_ENB);
> > +     csr_writel(pcie, (PAB_INTP_INTX_MASK | PAB_INTP_MSI_MASK),
> > +             PAB_INTP_AMBA_MISC_ENB);
> >
> >       /* program PIO Enable Bit to 1 and Config Window Enable Bit to 1 =
in
> >        * PAB_AXI_PIO_CTRL Register
> > @@ -503,6 +598,10 @@ static int mobiveil_host_init(struct mobiveil_pcie
> *pcie)
> >               }
> >       }
> >
> > +     /* setup MSI hardware registers */
> > +     if (IS_ENABLED(CONFIG_PCI_MSI))
>
> Your driver already depends on
> =E2=80=8B=E2=80=8B
> PCI_MSI_IRQ_DOMAIN, which depends on
> PCI_MSI. So this IS_ENABLED() is pointless.
>
=E2=80=8Bas Lorenzo=E2=80=8B pointed out on the other thread, I will take
out =E2=80=8BPCI_MSI_IRQ_DOMAIN dependency.
So looks like better to follow other tested drivers and continue to keep it
no ?

>
>
> > +             mobiveil_pcie_enable_msi(pcie);
> > +
> >       return err;
> >  }
> >
> > @@ -520,6 +619,118 @@ static int mobiveil_pcie_intx_map(struct
> irq_domain *domain, unsigned int irq,
> >       .map =3D mobiveil_pcie_intx_map,
> >  };
> >
> > +static struct irq_chip mobiveil_msi_irq_chip =3D {
> > +     .name =3D "Mobiveil PCIe MSI",
> > +     .irq_mask =3D pci_msi_mask_irq,
> > +     .irq_unmask =3D pci_msi_unmask_irq,
> > +};
> > +
> > +static struct msi_domain_info mobiveil_msi_domain_info =3D {
> > +     .flags  =3D (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS=
 |
> > +                  MSI_FLAG_PCI_MSIX),
> > +     .chip   =3D &mobiveil_msi_irq_chip,
> > +};
> > +
> > +static void mobiveil_compose_msi_msg(struct irq_data *data, struct
> msi_msg *msg)
> > +{
> > +     struct mobiveil_pcie *pcie =3D irq_data_get_irq_chip_data(data);
> > +     phys_addr_t addr =3D virt_to_phys((void *)pcie->msi.msi_pages +
> > +                             (data->hwirq * sizeof(int)));
> > +
> > +     msg->address_lo =3D lower_32_bits(addr);
> > +     msg->address_hi =3D upper_32_bits(addr);
> > +     msg->data =3D data->hwirq;
> > +
> > +     dev_dbg(&pcie->pdev->dev, "msi#%d address_hi %#x address_lo %#x\n=
",
> > +             (int)data->hwirq, msg->address_hi, msg->address_lo);
> > +}
> > +
> > +static int mobiveil_msi_set_affinity(struct irq_data *irq_data,
> > +             const struct cpumask *mask, bool force)
> > +{
> > +     return -EINVAL;
> > +}
> > +
> > +static struct irq_chip mobiveil_msi_bottom_irq_chip =3D {
> > +     .name                   =3D "Mobiveil MSI",
> > +     .irq_compose_msi_msg    =3D mobiveil_compose_msi_msg,
> > +     .irq_set_affinity       =3D mobiveil_msi_set_affinity,
> > +};
> > +
> > +static int mobiveil_irq_msi_domain_alloc(struct irq_domain *domain,
> > +             unsigned int virq, unsigned int nr_irqs, void *args)
> > +{
> > +     struct mobiveil_pcie *pcie =3D domain->host_data;
> > +     struct mobiveil_msi *msi =3D &pcie->msi;
> > +     unsigned long bit;
> > +
> > +     WARN_ON(nr_irqs !=3D 1);
> > +     mutex_lock(&msi->lock);
> > +
> > +     bit =3D find_first_zero_bit(msi->msi_irq_in_use,
> msi->num_of_vectors);
> > +     if (bit >=3D msi->num_of_vectors) {
> > +             mutex_unlock(&msi->lock);
> > +             return -ENOSPC;
> > +     }
> > +
> > +     set_bit(bit, msi->msi_irq_in_use);
> > +
> > +     mutex_unlock(&msi->lock);
> > +
> > +     irq_domain_set_info(domain, virq, bit,
> &mobiveil_msi_bottom_irq_chip,
> > +                         domain->host_data, handle_simple_irq,
> > +                         NULL, NULL);
> > +     return 0;
> > +}
> > +
> > +static void mobiveil_irq_msi_domain_free(struct irq_domain *domain,
> > +             unsigned int virq, unsigned int nr_irqs)
> > +{
> > +     struct irq_data *d =3D irq_domain_get_irq_data(domain, virq);
> > +     struct mobiveil_pcie *pcie =3D irq_data_get_irq_chip_data(d);
> > +     struct mobiveil_msi *msi =3D &pcie->msi;
> > +
> > +     mutex_lock(&msi->lock);
> > +
> > +     if (!test_bit(d->hwirq, msi->msi_irq_in_use)) {
> > +             dev_err(&pcie->pdev->dev, "trying to free unused
> MSI#%lu\n",
> > +                     d->hwirq);
> > +     } else {
> > +             __clear_bit(d->hwirq, msi->msi_irq_in_use);
> > +     }
> > +
> > +     mutex_unlock(&msi->lock);
> > +}
> > +
> > +static const struct irq_domain_ops msi_domain_ops =3D {
> > +     .alloc  =3D mobiveil_irq_msi_domain_alloc,
> > +     .free   =3D mobiveil_irq_msi_domain_free,
> > +};
> > +
> > +static int mobiveil_allocate_msi_domains(struct mobiveil_pcie *pcie)
> > +{
> > +     struct device *dev =3D &pcie->pdev->dev;
> > +     struct fwnode_handle *fwnode =3D of_node_to_fwnode(dev->of_node);
> > +     struct mobiveil_msi *msi =3D &pcie->msi;
> > +
> > +     mutex_init(&pcie->msi.lock);
> > +     msi->dev_domain =3D irq_domain_add_linear(NULL, msi->num_of_vecto=
rs,
> > +                                          &msi_domain_ops, pcie);
> > +     if (!msi->dev_domain) {
> > +             dev_err(dev, "failed to create IRQ domain\n");
> > +             return -ENOMEM;
> > +     }
> > +
> > +     msi->msi_domain =3D pci_msi_create_irq_domain(fwnode,
> > +                             &mobiveil_msi_domain_info,
> msi->dev_domain);
> > +     if (!msi->msi_domain) {
> > +             dev_err(dev, "failed to create MSI domain\n");
> > +             irq_domain_remove(msi->dev_domain);
> > +             return -ENOMEM;
> > +     }
> > +     return 0;
> > +}
> > +
> >  static int mobiveil_pcie_init_irq_domain(struct mobiveil_pcie *pcie)
> >  {
> >       struct device *dev =3D &pcie->pdev->dev;
> > @@ -535,6 +746,13 @@ static int mobiveil_pcie_init_irq_domain(struct
> mobiveil_pcie *pcie)
> >               return -ENODEV;
> >       }
> >
> > +#ifdef CONFIG_PCI_MSI
>
> Useless #ifdef
>
> > +     /* setup MSI */
> > +     ret =3D mobiveil_allocate_msi_domains(pcie);
> > +     if (ret)
> > +             return ret;
> > +#endif
> > +
> >       return 0;
> >  }
> >
> >
>
> Now, there is something that I find a bit annoying: This code looks very
> similar to drivers/pci/host/pcie-altera-msi.c, to the extent that I
> suspect this is the same IP.
> =E2=80=8B
>

=E2=80=8BIts a different IP.
=E2=80=8B


> I suggest you investigate whether you can reuse the existing code
> instead of adding yet another MSI driver to the kernel.
>
> =E2=80=8BYes, Since the hardware architecture is similar so they do look =
similar.
 =E2=80=8B


> Thanks,
>
>         M.
> --
> Jazz is not dead. It just smells funny...
>

=E2=80=8BThanks,
Subrahmanya=E2=80=8B

--f403045f4dd6f603440560e9efd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:rgb(7,55,99)">Marc,</div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Fri, Dec 15, 2017 at 9:43 PM, Marc Zyngier <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:marc.zyngier@arm.com" target=3D"_blank"=
>marc.zyngier@arm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">O=
n 13/12/17 16:08, Subrahmanya Lingappa wrote:<br>
&gt; Adds MSI support for Mobiveil PCIe Host Bridge IP driver<br>
&gt;<br>
&gt; Signed-off-by: Subrahmanya Lingappa &lt;<a href=3D"mailto:l.subrahmany=
a@mobiveil.co.in">l.subrahmanya@mobiveil.co.in</a>&gt;<br>
&gt; Cc: Bjorn Helgaas &lt;<a href=3D"mailto:bhelgaas@google.com">bhelgaas@=
google.com</a>&gt;<br>
&gt; Cc: Lorenzo Pieralisi &lt;<a href=3D"mailto:lorenzo.pieralisi@arm.com"=
>lorenzo.pieralisi@arm.com</a>&gt;<br>
&gt; Cc: Marc Zyngier &lt;<a href=3D"mailto:marc.zyngier@arm.com">marc.zyng=
ier@arm.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:linux-pci@vger.kernel.org">linux-pci@vger.kernel=
.org</a><br>
&gt; ---<br>
&gt;=C2=A0 drivers/pci/host/pcie-<wbr>mobiveil.c | 222 ++++++++++++++++++++=
++++++++++<wbr>++++++++-<br>
&gt;=C2=A0 1 file changed, 220 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/pci/host/pcie-<wbr>mobiveil.c b/drivers/pci/host/=
pcie-<wbr>mobiveil.c<br>
&gt; index 8611aaa..39818d5 100644<br>
&gt; --- a/drivers/pci/host/pcie-<wbr>mobiveil.c<br>
&gt; +++ b/drivers/pci/host/pcie-<wbr>mobiveil.c<br>
&gt; @@ -14,6 +14,7 @@<br>
&gt;=C2=A0 #include &lt;linux/irqdomain.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/kernel.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/msi.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/of_address.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/of_irq.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/of_platform.h&gt;<br>
&gt; @@ -55,6 +56,7 @@<br>
&gt;=C2=A0 #define PAB_INTP_AMBA_MISC_ENB=C2=A0 =C2=A0 =C2=A0 =C2=A00x0b0c<=
br>
&gt;=C2=A0 #define PAB_INTP_AMBA_MISC_STAT=C2=A0 =C2=A0 =C2=A0 0x0b1c<br>
&gt;=C2=A0 #define=C2=A0 PAB_INTP_INTX_MASK=C2=A0 0x1e0<br>
&gt; +#define=C2=A0 PAB_INTP_MSI_MASK=C2=A0 =C2=A00x8<br>
&gt;<br>
&gt;=C2=A0 #define PAB_AXI_AMAP_CTRL(win)=C2=A0 =C2=A0 =C2=A0 =C2=A0PAB_REG=
_ADDR_16(0x0ba0, win)<br>
&gt;=C2=A0 #define=C2=A0 WIN_ENABLE_SHIFT=C2=A0 =C2=A0 0<br>
&gt; @@ -85,8 +87,19 @@<br>
&gt;<br>
&gt;=C2=A0 /* supported number of interrupts */<br>
&gt;=C2=A0 #define PCI_NUM_INTX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
&gt; +#define PCI_NUM_MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br>
&gt;=C2=A0 #define PAB_INTA_POS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05<br>
&gt;<br>
&gt; +/* MSI registers */<br>
&gt; +#define MSI_BASE_LO_OFFSET=C2=A0 =C2=A00x04<br>
&gt; +#define MSI_BASE_HI_OFFSET=C2=A0 =C2=A00x08<br>
&gt; +#define MSI_SIZE_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x0c<br>
&gt; +#define MSI_ENABLE_OFFSET=C2=A0 =C2=A0 0x14<br>
&gt; +#define MSI_STATUS_OFFSET=C2=A0 =C2=A0 0x18<br>
&gt; +#define MSI_DATA_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x20<br>
&gt; +#define MSI_ADDR_L_OFFSET=C2=A0 =C2=A0 0x24<br>
&gt; +#define MSI_ADDR_H_OFFSET=C2=A0 =C2=A0 0x28<br>
&gt; +<br>
&gt;=C2=A0 /* outbound and inbound window definitions */<br>
&gt;=C2=A0 #define WIN_NUM_0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt;=C2=A0 #define WIN_NUM_1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt; @@ -105,11 +118,22 @@<br>
&gt;=C2=A0 #define UINT64_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(u64)=
(~((u64)0))<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt; +struct mobiveil_msi {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* MSI information */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mutex lock;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* protect bitmap variable */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct irq_domain *msi_domain;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct irq_domain *dev_domain;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phys_addr_t msi_pages_phys;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int *msi_pages;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int num_of_vectors;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DECLARE_BITMAP(msi_irq_in_use, PCI_NUM_MSI);<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 struct mobiveil_pcie {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device *pdev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head resources;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *config_axi_slave_base;=C2=A0 =
=C2=A0 /* endpoint config base */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *csr_axi_slave_base;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* root port config base */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *apb_csr_base;=C2=A0 =C2=A0 =C2=A0/*=
 MSI register base */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct irq_domain *intx_domain;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int apio_wins;<br>
&gt; @@ -118,6 +142,7 @@ struct mobiveil_pcie {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ib_wins_configured; /*=C2=A0 configured =
inbound windows */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *ob_io_res;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char root_bus_nr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mobiveil_msi msi;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 static inline void csr_writel(struct mobiveil_pcie *pcie, const =
u32 value,<br>
&gt; @@ -202,11 +227,18 @@ static void mobiveil_pcie_isr(struct irq_desc *d=
esc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct irq_chip *chip =3D irq_desc_get_chip(=
desc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mobiveil_pcie *pcie =3D irq_desc_get_=
handler_data(<wbr>desc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pcie-&gt;pdev-&g=
t;dev;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0u32 intr_status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mobiveil_msi *msi =3D &amp;pcie-&gt;msi;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 msi_data, msi_addr_lo, msi_addr_hi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 intr_status, msi_status;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long shifted_status;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 bit, virq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val, mask;<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * The core provides a single interrupt for both =
INTx/MSI messages.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * So we&#39;ll read both INTx and MSI status<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chained_irq_enter(chip, desc);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* read INTx status */<br>
&gt; @@ -241,6 +273,41 @@ static void mobiveil_pcie_isr(struct irq_desc *de=
sc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while ((shifte=
d_status &gt;&gt;=C2=A0 PAB_INTA_POS) !=3D 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* read extra MSI status register */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msi_status =3D readl(pcie-&gt;apb_csr_base + MSI_=
STATUS_OFFSET);<br>
<br>
</div></div>You are using the non-relaxed accessors here, while the rest of=
 the<br>
driver used the _relaxed version. Why is that so?<br>
<span class=3D"gmail-"><br></span></blockquote><div><font color=3D"#073763"=
 face=3D"verdana, sans-serif">i<div class=3D"gmail_default" style=3D"font-f=
amily:verdana,sans-serif;color:rgb(7,55,99);display:inline">=E2=80=8Bt was =
a slip, I will correct it to use relaxed order.</div></font></div><div><fon=
t color=3D"#073763" face=3D"verdana, sans-serif"><div class=3D"gmail_defaul=
t" style=3D"font-family:verdana,sans-serif;color:rgb(7,55,99);display:inlin=
e">=E2=80=8B</div></font></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><span class=3D"gmail-">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* handle MSI interrupts */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((intr_status &amp; PAB_INTP_MSI_MASK) || (msi=
_status &amp; 1)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0msi_data =3D readl(pcie-&gt;apb_csr_base + MSI_DATA_OFFSET);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * MSI_STATUS_OFFSET gets updated to zero once we have<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * popped not only the data but also address from MSI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * hardware FIFO.so keeping these following two dummy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * reads.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0msi_addr_lo =3D readl(pcie-&gt;apb_csr_base +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MSI_ADDR_L_O=
FFSET);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0msi_addr_hi =3D readl(pcie-&gt;apb_csr_base +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MSI_ADDR_H_O=
FFSET);<br>
<br>
</span>Is that really valid? Don&#39;t you have to issue a 64bit access?<br=
></blockquote><div><div class=3D"gmail_default" style=3D"font-family:verdan=
a,sans-serif;color:rgb(7,55,99);display:inline">Seems like its valid, becau=
se its just a pair of DWORD =E2=80=8B</div>=C2=A0<div class=3D"gmail_defaul=
t" style=3D"font-family:verdana,sans-serif;color:rgb(7,55,99);display:inlin=
e">=E2=80=8Baccesses to config register space to read MSI data captured ins=
ide bridge hardware FIFO.</div></div><div><div class=3D"gmail_default" styl=
e=3D"font-family:verdana,sans-serif;color:rgb(7,55,99);display:inline">is t=
here any reason you think its invalid?</div></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_dbg(dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;MSI registers, data: %08x, addr: %=
08x:%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msi_data, msi_addr_hi, msi_addr_lo);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (msi_data) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virq =3D irq_find_mapping(msi-&gt;dev_<w=
br>domain,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msi_data);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (virq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0generic_hand=
le_irq(virq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0} else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err_ratelimited(dev, &quot;MSI data =
null\n&quot;);<br>
<br>
</span>Braces on both sides of the else statement.<br>
<br>
Also, why is msi_data=3D=3D0 not valid? You can definitely allocate it from=
<br>
your bitmap, and I&#39;m expecting that there is a strong correlation<br>
between what you read from MSI_DATA_OFFSET and the payload that the<br>
<div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:=
rgb(7,55,99);display:inline">=E2=80=8B=E2=80=8B</div>endpoint writes.<br>
<div><div class=3D"gmail-h5"><br></div></div></blockquote><div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:rgb(7,55,9=
9)">=E2=80=8B=E2=80=8BAgreed msi_=E2=80=8Bdata=3D=3D0 should also be valid.=
 will be fixed.=E2=80=8B</div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div><div class=3D"gmail-h5">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0msi_status =3D readl(pcie-&gt;apb_csr_base +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MSI_STATUS_O=
FFSET);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (msi_status &=
amp; 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0csr_writel(pcie, intr_status, PAB_INTP_AMBA_=
MISC_STAT);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chained_irq_exit(chip, desc);<br>
&gt;=C2=A0 }<br>
&gt; @@ -274,6 +341,12 @@ static int mobiveil_pcie_parse_dt(struct mobiveil=
_pcie *pcie)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(pcie-&gt;csr_axi_slave_<wbr>base)=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(p=
cie-&gt;csr_axi_slave_<wbr>base);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* map MSI config resource */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(<wbr>pdev, I=
ORESOURCE_MEM, &quot;apb_csr&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pcie-&gt;apb_csr_base =3D devm_pci_remap_cfg_reso=
urce(<wbr>dev, res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(pcie-&gt;apb_csr_base))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(pcie-&=
gt;apb_csr_base);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* read the number of windows requested */<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pcie-&gt;apio_wins &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read=
_u32(node, &quot;apio-wins&quot;, &amp;pcie-&gt;apio_wins)) {<br>
&gt; @@ -430,6 +503,27 @@ static int mobiveil_bringup_link(struct mobiveil_=
pcie *pcie)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static void mobiveil_pcie_enable_msi(<wbr>struct mobiveil_pcie *pcie)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phys_addr_t msg_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mobiveil_msi *msi =3D &amp;pcie-&gt;msi;<b=
r>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pcie-&gt;msi.num_of_vectors =3D PCI_NUM_MSI;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msi-&gt;msi_pages =3D (void *)__get_free_pages(GF=
P_DMA, 0);<br>
<br>
</div></div>That old trick again... Do you really need to carve out a RAM p=
age for<br>
this? Can&#39;t you use just some dummy physical address instead? The base<=
br>
address of your PCIe RC, for example.<br></blockquote><div><div class=3D"gm=
ail_default" style=3D"font-family:verdana,sans-serif;color:rgb(7,55,99);dis=
play:inline">=E2=80=8BDue to the current hardware bug=E2=80=8B</div>=C2=A0<=
div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:r=
gb(7,55,99);display:inline">=E2=80=8Bwe do need a real RAM location to writ=
e this MSI data into, as we cant use any dummy address for now.</div></div>=
<div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;c=
olor:rgb(7,55,99);display:inline">=E2=80=8B</div></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0msg_addr =3D virt_to_phys((void *)msi-&gt;msi_pag=
es);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msi-&gt;msi_pages_phys =3D (phys_addr_t)msg_addr;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(lower_32_bits(<wbr>msg_addr),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcie-&gt;apb_csr_base=
 + MSI_BASE_LO_OFFSET);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(upper_32_bits(<wbr>msg_addr),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcie-&gt;apb_csr_base=
 + MSI_BASE_HI_OFFSET);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(4096, pcie-&gt;apb_csr_base + MSI_=
SIZE_OFFSET);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcie-&gt;apb_csr_base=
 + MSI_ENABLE_OFFSET);<br>
<br>
</span>nit: No need to break all these writes, each of them can fit on a si=
ngle<br>
line.<br>
<span class=3D"gmail-"><br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static int mobiveil_host_init(struct mobiveil_pcie *pcie)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 value;<br>
&gt; @@ -465,7 +559,8 @@ static int mobiveil_host_init(struct mobiveil_pcie=
 *pcie)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; PEX_=
PIO_ENABLE_SHIFT),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PAB_CTRL);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0csr_writel(pcie, PAB_INTP_INTX_MASK, PAB_INTP_AMB=
A_MISC_ENB);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0csr_writel(pcie, (PAB_INTP_INTX_MASK | PAB_INTP_M=
SI_MASK),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PAB_INTP_AMBA_MISC_EN=
B);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* program PIO Enable Bit to 1 and Config Wi=
ndow Enable Bit to 1 in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * PAB_AXI_PIO_CTRL Register<br>
&gt; @@ -503,6 +598,10 @@ static int mobiveil_host_init(struct mobiveil_pci=
e *pcie)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* setup MSI hardware registers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ENABLED(CONFIG_PCI_MSI))<br>
<br>
</span>Your driver already depends on <div class=3D"gmail_default" style=3D=
"font-family:verdana,sans-serif;color:rgb(7,55,99);display:inline">=E2=80=
=8B=E2=80=8B</div>PCI_MSI_IRQ_DOMAIN, which depends on<br>
PCI_MSI. So this IS_ENABLED() is pointless.<br>
<div><div class=3D"gmail-h5"><div class=3D"gmail_default" style=3D"font-fam=
ily:verdana,sans-serif;color:rgb(7,55,99)"></div></div></div></blockquote><=
div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:r=
gb(7,55,99)">=E2=80=8Bas Lorenzo=E2=80=8B pointed out on the other thread, =
I will take out=C2=A0=E2=80=8BPCI_MSI_IRQ_DOMAIN dependency.=C2=A0</div><di=
v class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:rgb=
(7,55,99)">So looks like better to follow other tested drivers and continue=
 to keep it no ?</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v><div class=3D"gmail-h5"><div class=3D"gmail_default" style=3D"font-family=
:verdana,sans-serif;color:rgb(7,55,99)"><br></div><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mobiveil_pcie_enable_=
msi(pcie)<wbr>;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; @@ -520,6 +619,118 @@ static int mobiveil_pcie_intx_map(struct irq_dom=
ain *domain, unsigned int irq,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.map =3D mobiveil_pcie_intx_map,<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +static struct irq_chip mobiveil_msi_irq_chip =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.name =3D &quot;Mobiveil PCIe MSI&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.irq_mask =3D pci_msi_mask_irq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.irq_unmask =3D pci_msi_unmask_irq,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct msi_domain_info mobiveil_msi_domain_info =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.flags=C2=A0 =3D (MSI_FLAG_USE_DEF_DOM_OPS | MSI_=
FLAG_USE_DEF_CHIP_OPS |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MSI_FL=
AG_PCI_MSIX),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.chip=C2=A0 =C2=A0=3D &amp;mobiveil_msi_irq_chip,=
<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void mobiveil_compose_msi_msg(<wbr>struct irq_data *data, stru=
ct msi_msg *msg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mobiveil_pcie *pcie =3D irq_data_get_irq_c=
hip_data(<wbr>data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phys_addr_t addr =3D virt_to_phys((void *)pcie-&g=
t;msi.msi_pages +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(data-&gt;hwirq * sizeof(int)));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msg-&gt;address_lo =3D lower_32_bits(addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msg-&gt;address_hi =3D upper_32_bits(addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msg-&gt;data =3D data-&gt;hwirq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;pcie-&gt;pdev-&gt;dev, &quot;msi#%d =
address_hi %#x address_lo %#x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(int)data-&gt;hwirq, =
msg-&gt;address_hi, msg-&gt;address_lo);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int mobiveil_msi_set_affinity(<wbr>struct irq_data *irq_data,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct cpumask =
*mask, bool force)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct irq_chip mobiveil_msi_bottom_irq_chip =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;Mobiveil MSI&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.irq_compose_msi_msg=C2=A0 =C2=A0 =3D mobiveil_co=
mpose_msi_msg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.irq_set_affinity=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D m=
obiveil_msi_set_affinity,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int mobiveil_irq_msi_domain_alloc(<wbr>struct irq_domain *doma=
in,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int virq, un=
signed int nr_irqs, void *args)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mobiveil_pcie *pcie =3D domain-&gt;host_da=
ta;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mobiveil_msi *msi =3D &amp;pcie-&gt;msi;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long bit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WARN_ON(nr_irqs !=3D 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;msi-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bit =3D find_first_zero_bit(msi-&gt;msi_<wbr>irq_=
in_use, msi-&gt;num_of_vectors);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (bit &gt;=3D msi-&gt;num_of_vectors) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;msi=
-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSPC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0set_bit(bit, msi-&gt;msi_irq_in_use);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;msi-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0irq_domain_set_info(domain, virq, bit, &amp;mobiv=
eil_msi_bottom_irq_chip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0domain-&gt;host_data, handle_simple_irq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0NULL, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void mobiveil_irq_msi_domain_free(<wbr>struct irq_domain *doma=
in,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int virq, un=
signed int nr_irqs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct irq_data *d =3D irq_domain_get_irq_data(<w=
br>domain, virq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mobiveil_pcie *pcie =3D irq_data_get_irq_c=
hip_data(d);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mobiveil_msi *msi =3D &amp;pcie-&gt;msi;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;msi-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!test_bit(d-&gt;hwirq, msi-&gt;msi_irq_in_use=
)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pcie-&gt=
;pdev-&gt;dev, &quot;trying to free unused MSI#%lu\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0d-&gt;hwirq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__clear_bit(d-&gt;hwi=
rq, msi-&gt;msi_irq_in_use);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;msi-&gt;lock);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct irq_domain_ops msi_domain_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.alloc=C2=A0 =3D mobiveil_irq_msi_domain_alloc,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0.free=C2=A0 =C2=A0=3D mobiveil_irq_msi_domain_fre=
e,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int mobiveil_allocate_msi_domains(<wbr>struct mobiveil_pcie *p=
cie)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pcie-&gt;pdev-&gt;dev=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct fwnode_handle *fwnode =3D of_node_to_fwnod=
e(dev-&gt;of_<wbr>node);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mobiveil_msi *msi =3D &amp;pcie-&gt;msi;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_init(&amp;pcie-&gt;msi.lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msi-&gt;dev_domain =3D irq_domain_add_linear(NULL=
, msi-&gt;num_of_vectors,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;msi_domain_ops, pcie);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!msi-&gt;dev_domain) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to create IRQ domain\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msi-&gt;msi_domain =3D pci_msi_create_irq_domain(=
<wbr>fwnode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mobiveil_msi_domain_info, msi-&gt;d=
ev_domain);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!msi-&gt;msi_domain) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to create MSI domain\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_domain_remove(msi=
-&gt;dev_<wbr>domain);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static int mobiveil_pcie_init_irq_domain(<wbr>struct mobiveil_pc=
ie *pcie)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pcie-&gt;pdev-&g=
t;dev;<br>
&gt; @@ -535,6 +746,13 @@ static int mobiveil_pcie_init_irq_domain(<wbr>str=
uct mobiveil_pcie *pcie)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +#ifdef CONFIG_PCI_MSI<br>
<br>
</div></div>Useless #ifdef<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* setup MSI */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mobiveil_allocate_msi_domains(<wbr>pcie);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;<br>
<br>
</span>Now, there is something that I find a bit annoying: This code looks =
very<br>
similar to drivers/pci/host/pcie-altera-<wbr>msi.c, to the extent that I<br=
>
suspect this is the same IP.<div class=3D"gmail_default" style=3D"font-fami=
ly:verdana,sans-serif;color:rgb(7,55,99);display:inline">=E2=80=8B</div>=C2=
=A0</blockquote><div><div class=3D"gmail_default" style=3D"font-family:verd=
ana,sans-serif;color:rgb(7,55,99);display:inline">=E2=80=8BIts a different =
IP.</div></div><div><div class=3D"gmail_default" style=3D"font-family:verda=
na,sans-serif;color:rgb(7,55,99);display:inline">=E2=80=8B</div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
I suggest you investigate whether you can reuse the existing code<br>
instead of adding yet another MSI driver to the kernel.<br>
<br></blockquote><div><div class=3D"gmail_default" style=3D"font-family:ver=
dana,sans-serif;color:rgb(7,55,99);display:inline">=E2=80=8BYes, Since the =
hardware architecture is similar so they do look similar.</div></div><div><=
div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:r=
gb(7,55,99);display:inline">=C2=A0=E2=80=8B</div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Thanks,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 M.<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
Jazz is not dead. It just smells funny...<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra"><div =
class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:rgb(7=
,55,99)">=E2=80=8BThanks,</div><div class=3D"gmail_default" style=3D"font-f=
amily:verdana,sans-serif;color:rgb(7,55,99)">Subrahmanya=E2=80=8B</div><br>=
</div></div>

--f403045f4dd6f603440560e9efd8--
