Return-Path: <jingoohan1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1446111638-197070-6-git-send-email-wangzhou1@hisilicon.com>
References: <1446111638-197070-1-git-send-email-wangzhou1@hisilicon.com>
	<1446111638-197070-6-git-send-email-wangzhou1@hisilicon.com>
Date: Fri, 30 Oct 2015 10:18:08 +0900
Message-ID: <CAPOBaE5UkNJ_tCfQr-zK8fDR7XrUw-UWRgV6qsSpbz67XHE5-A@mail.gmail.com>
Subject: Re: [PATCH v13 5/6] PCI: designware: Add ARM64 support
From: Han Jingoo <jingoohan1@gmail.com>
Content-Type: multipart/alternative; boundary=94eb2c06d3624c431a052348335d
To: Zhou Wang <wangzhou1@hisilicon.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, "pratyush.anand@gmail.com" <pratyush.anand@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>, "thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>, "gabriele.paoloni@huawei.com" <gabriele.paoloni@huawei.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "james.morse@arm.com" <james.morse@arm.com>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "robh@kernel.org" <robh@kernel.org>, "gabriel.fernandez@linaro.org" <gabriel.fernandez@linaro.org>, "Minghuan.Lian@freescale.com" <Minghuan.Lian@freescale.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "zhangjukuo@huawei.com" <zhangjukuo@huawei.com>, "qiuzhenfa@hisilicon.com" <qiuzhenfa@hisilicon.com>, "liudongdong3@huawei.com" <liudongdong3@huawei.com>, "qiujiang@huawei.com" <qiujiang@huawei.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "liguozhu@hisilicon.com" <liguozhu@hisilicon.com>, Han Jingoo <jingoohan1@gmail.com>
List-ID: <devicetree@vger.kernel.org>

--94eb2c06d3624c431a052348335d
Content-Type: text/plain; charset=UTF-8

Sorry for being late.
It looks good.

Acked-by: Jingoo Han <jingoohan1@gmail.com>

2015. 10. 29. Thursday, Zhou Wang<wangzhou1@hisilicon.com> wrote:

> This patch tries to unify ARM32 and ARM64 PCIe in designware driver. Delete
> function dw_pcie_setup, dw_pcie_scan_bus, dw_pcie_map_irq and struct
> hw_pci,
> move related operations to dw_pcie_host_init.
>
> As dw_pcie_setup is removed, we also remove io_base_tmp which was
> introduced
> in "PCI: designware: Remove *_mod_base".
>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com <javascript:;>>
> Signed-off-by: Gabriele Paoloni <gabriele.paoloni@huawei.com
> <javascript:;>>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de <javascript:;>>
> Tested-by: James Morse <james.morse@arm.com <javascript:;>>
> Tested-by: Gabriel Fernandez <gabriel.fernandez@st.com <javascript:;>>
> Tested-by: Minghuan Lian <Minghuan.Lian@freescale.com <javascript:;>>
> Acked-by: Pratyush Anand <pratyush.anand@gmail.com <javascript:;>>
> ---
>  drivers/pci/host/pcie-designware.c | 128
> +++++++++++--------------------------
>  drivers/pci/host/pcie-designware.h |   1 -
>  2 files changed, 38 insertions(+), 91 deletions(-)
>
> diff --git a/drivers/pci/host/pcie-designware.c
> b/drivers/pci/host/pcie-designware.c
> index 089b6cf..1a6d3e1 100644
> --- a/drivers/pci/host/pcie-designware.c
> +++ b/drivers/pci/host/pcie-designware.c
> @@ -69,16 +69,7 @@
>  #define PCIE_ATU_FUNC(x)               (((x) & 0x7) << 16)
>  #define PCIE_ATU_UPPER_TARGET          0x91C
>
> -static struct hw_pci dw_pci;
> -
> -static unsigned long global_io_offset;
> -
> -static inline struct pcie_port *sys_to_pcie(struct pci_sys_data *sys)
> -{
> -       BUG_ON(!sys->private_data);
> -
> -       return sys->private_data;
> -}
> +static struct pci_ops dw_pcie_ops;
>
>  int dw_pcie_cfg_read(void __iomem *addr, int where, int size, u32 *val)
>  {
> @@ -255,7 +246,7 @@ static void dw_pcie_msi_set_irq(struct pcie_port *pp,
> int irq)
>  static int assign_irq(int no_irqs, struct msi_desc *desc, int *pos)
>  {
>         int irq, pos0, i;
> -       struct pcie_port *pp = sys_to_pcie(msi_desc_to_pci_sysdata(desc));
> +       struct pcie_port *pp = (struct pcie_port *)
> msi_desc_to_pci_sysdata(desc);
>
>         pos0 = bitmap_find_free_region(pp->msi_irq_in_use, MAX_MSI_IRQS,
>                                        order_base_2(no_irqs));
> @@ -298,7 +289,7 @@ static int dw_msi_setup_irq(struct msi_controller
> *chip, struct pci_dev *pdev,
>  {
>         int irq, pos;
>         struct msi_msg msg;
> -       struct pcie_port *pp = sys_to_pcie(pdev->bus->sysdata);
> +       struct pcie_port *pp = pdev->bus->sysdata;
>
>         if (desc->msi_attrib.is_msix)
>                 return -EINVAL;
> @@ -327,7 +318,7 @@ static void dw_msi_teardown_irq(struct msi_controller
> *chip, unsigned int irq)
>  {
>         struct irq_data *data = irq_get_irq_data(irq);
>         struct msi_desc *msi = irq_data_get_msi_desc(data);
> -       struct pcie_port *pp = sys_to_pcie(msi_desc_to_pci_sysdata(msi));
> +       struct pcie_port *pp = (struct pcie_port *)
> msi_desc_to_pci_sysdata(msi);
>
>         clear_irq_range(pp, irq, 1, data->hwirq);
>  }
> @@ -362,6 +353,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
>  {
>         struct device_node *np = pp->dev->of_node;
>         struct platform_device *pdev = to_platform_device(pp->dev);
> +       struct pci_bus *bus, *child;
>         struct resource *cfg_res;
>         u32 val;
>         int i, ret;
> @@ -390,14 +382,13 @@ int dw_pcie_host_init(struct pcie_port *pp)
>                         pp->io->name = "I/O";
>                         pp->io_size = resource_size(pp->io);
>                         pp->io_bus_addr = pp->io->start - win->offset;
> -                       pp->io->start = max_t(resource_size_t,
> PCIBIOS_MIN_IO,
> -                                             pp->io_bus_addr +
> -                                             global_io_offset);
> -                       pp->io->end = min_t(resource_size_t,
> IO_SPACE_LIMIT,
> -                                           pp->io_bus_addr + pp->io_size +
> -                                           global_io_offset - 1);
> +                       ret = pci_remap_iospace(pp->io, pp->io_base);
> +                       if (ret) {
> +                               dev_warn(pp->dev, "error %d: failed to map
> resource %pR\n",
> +                                        ret, pp->io);
> +                               continue;
> +                       }
>                         pp->io_base = pp->io->start;
> -                       pp->io_base_tmp = pp->io->start;
>                         break;
>                 case IORESOURCE_MEM:
>                         pp->mem = win->res;
> @@ -490,15 +481,35 @@ int dw_pcie_host_init(struct pcie_port *pp)
>         val |= PORT_LOGIC_SPEED_CHANGE;
>         dw_pcie_wr_own_conf(pp, PCIE_LINK_WIDTH_SPEED_CONTROL, 4, val);
>
> -#ifdef CONFIG_PCI_MSI
> -       dw_pcie_msi_chip.dev = pp->dev;
> +       pp->root_bus_nr = pp->busn->start;
> +       if (IS_ENABLED(CONFIG_PCI_MSI)) {
> +               bus = pci_scan_root_bus_msi(pp->dev, pp->root_bus_nr,
> +                                           &dw_pcie_ops, pp, &res,
> +                                           &dw_pcie_msi_chip);
> +               dw_pcie_msi_chip.dev = pp->dev;
> +       } else
> +               bus = pci_scan_root_bus(pp->dev, pp->root_bus_nr,
> &dw_pcie_ops,
> +                                       pp, &res);
> +       if (!bus)
> +               return -ENOMEM;
> +
> +       if (pp->ops->scan_bus)
> +               pp->ops->scan_bus(pp);
> +
> +#ifdef CONFIG_ARM
> +       /* support old dtbs that incorrectly describe IRQs */
> +       pci_fixup_irqs(pci_common_swizzle, of_irq_parse_and_map_pci);
>  #endif
>
> -       dw_pci.nr_controllers = 1;
> -       dw_pci.private_data = (void **)&pp;
> +       if (!pci_has_flag(PCI_PROBE_ONLY)) {
> +               pci_bus_size_bridges(bus);
> +               pci_bus_assign_resources(bus);
>
> -       pci_common_init_dev(pp->dev, &dw_pci);
> +               list_for_each_entry(child, &bus->children, node)
> +                       pcie_bus_configure_settings(child);
> +       }
>
> +       pci_bus_add_devices(bus);
>         return 0;
>  }
>
> @@ -598,7 +609,7 @@ static int dw_pcie_valid_config(struct pcie_port *pp,
>  static int dw_pcie_rd_conf(struct pci_bus *bus, u32 devfn, int where,
>                         int size, u32 *val)
>  {
> -       struct pcie_port *pp = sys_to_pcie(bus->sysdata);
> +       struct pcie_port *pp = bus->sysdata;
>         int ret;
>
>         if (dw_pcie_valid_config(pp, bus, PCI_SLOT(devfn)) == 0) {
> @@ -622,7 +633,7 @@ static int dw_pcie_rd_conf(struct pci_bus *bus, u32
> devfn, int where,
>  static int dw_pcie_wr_conf(struct pci_bus *bus, u32 devfn,
>                         int where, int size, u32 val)
>  {
> -       struct pcie_port *pp = sys_to_pcie(bus->sysdata);
> +       struct pcie_port *pp = bus->sysdata;
>         int ret;
>
>         if (dw_pcie_valid_config(pp, bus, PCI_SLOT(devfn)) == 0)
> @@ -646,69 +657,6 @@ static struct pci_ops dw_pcie_ops = {
>         .write = dw_pcie_wr_conf,
>  };
>
> -static int dw_pcie_setup(int nr, struct pci_sys_data *sys)
> -{
> -       struct pcie_port *pp;
> -
> -       pp = sys_to_pcie(sys);
> -
> -       if (global_io_offset < SZ_1M && pp->io_size > 0) {
> -               sys->io_offset = global_io_offset - pp->io_bus_addr;
> -               pci_ioremap_io(global_io_offset, pp->io_base_tmp);
> -               global_io_offset += SZ_64K;
> -               pci_add_resource_offset(&sys->resources, pp->io,
> -                                       sys->io_offset);
> -       }
> -
> -       sys->mem_offset = pp->mem->start - pp->mem_bus_addr;
> -       pci_add_resource_offset(&sys->resources, pp->mem, sys->mem_offset);
> -       pci_add_resource(&sys->resources, pp->busn);
> -
> -       return 1;
> -}
> -
> -static struct pci_bus *dw_pcie_scan_bus(int nr, struct pci_sys_data *sys)
> -{
> -       struct pci_bus *bus;
> -       struct pcie_port *pp = sys_to_pcie(sys);
> -
> -       pp->root_bus_nr = sys->busnr;
> -
> -       if (IS_ENABLED(CONFIG_PCI_MSI))
> -               bus = pci_scan_root_bus_msi(pp->dev, sys->busnr,
> &dw_pcie_ops,
> -                                           sys, &sys->resources,
> -                                           &dw_pcie_msi_chip);
> -       else
> -               bus = pci_scan_root_bus(pp->dev, sys->busnr, &dw_pcie_ops,
> -                                       sys, &sys->resources);
> -
> -       if (!bus)
> -               return NULL;
> -
> -       if (bus && pp->ops->scan_bus)
> -               pp->ops->scan_bus(pp);
> -
> -       return bus;
> -}
> -
> -static int dw_pcie_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
> -{
> -       struct pcie_port *pp = sys_to_pcie(dev->bus->sysdata);
> -       int irq;
> -
> -       irq = of_irq_parse_and_map_pci(dev, slot, pin);
> -       if (!irq)
> -               irq = pp->irq;
> -
> -       return irq;
> -}
> -
> -static struct hw_pci dw_pci = {
> -       .setup          = dw_pcie_setup,
> -       .scan           = dw_pcie_scan_bus,
> -       .map_irq        = dw_pcie_map_irq,
> -};
> -
>  void dw_pcie_setup_rc(struct pcie_port *pp)
>  {
>         u32 val;
> diff --git a/drivers/pci/host/pcie-designware.h
> b/drivers/pci/host/pcie-designware.h
> index 91a36f6..264c969 100644
> --- a/drivers/pci/host/pcie-designware.h
> +++ b/drivers/pci/host/pcie-designware.h
> @@ -33,7 +33,6 @@ struct pcie_port {
>         void __iomem            *va_cfg1_base;
>         u32                     cfg1_size;
>         resource_size_t         io_base;
> -       resource_size_t         io_base_tmp;
>         phys_addr_t             io_bus_addr;
>         u32                     io_size;
>         u64                     mem_base;
> --
> 1.9.1
>
>

--94eb2c06d3624c431a052348335d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Sorry for being late.<div>It looks good.<br><div><br></div><div>Acked-by: J=
ingoo Han &lt;<a href=3D"mailto:jingoohan1@gmail.com">jingoohan1@gmail.com<=
/a>&gt;<br><br>2015. 10.=C2=A029.=C2=A0Thursday,=C2=A0Zhou Wang&lt;<a href=
=3D"mailto:wangzhou1@hisilicon.com">wangzhou1@hisilicon.com</a>&gt; wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">This patch tries to unify ARM32 and ARM64=
 PCIe in designware driver. Delete<br>
function dw_pcie_setup, dw_pcie_scan_bus, dw_pcie_map_irq and struct hw_pci=
,<br>
move related operations to dw_pcie_host_init.<br>
<br>
As dw_pcie_setup is removed, we also remove io_base_tmp which was introduce=
d<br>
in &quot;PCI: designware: Remove *_mod_base&quot;.<br>
<br>
Signed-off-by: Zhou Wang &lt;<a href=3D"javascript:;" onclick=3D"_e(event, =
&#39;cvml&#39;, &#39;wangzhou1@hisilicon.com&#39;)">wangzhou1@hisilicon.com=
</a>&gt;<br>
Signed-off-by: Gabriele Paoloni &lt;<a href=3D"javascript:;" onclick=3D"_e(=
event, &#39;cvml&#39;, &#39;gabriele.paoloni@huawei.com&#39;)">gabriele.pao=
loni@huawei.com</a>&gt;<br>
Signed-off-by: Arnd Bergmann &lt;<a href=3D"javascript:;" onclick=3D"_e(eve=
nt, &#39;cvml&#39;, &#39;arnd@arndb.de&#39;)">arnd@arndb.de</a>&gt;<br>
Tested-by: James Morse &lt;<a href=3D"javascript:;" onclick=3D"_e(event, &#=
39;cvml&#39;, &#39;james.morse@arm.com&#39;)">james.morse@arm.com</a>&gt;<b=
r>
Tested-by: Gabriel Fernandez &lt;<a href=3D"javascript:;" onclick=3D"_e(eve=
nt, &#39;cvml&#39;, &#39;gabriel.fernandez@st.com&#39;)">gabriel.fernandez@=
st.com</a>&gt;<br>
Tested-by: Minghuan Lian &lt;<a href=3D"javascript:;" onclick=3D"_e(event, =
&#39;cvml&#39;, &#39;Minghuan.Lian@freescale.com&#39;)">Minghuan.Lian@frees=
cale.com</a>&gt;<br>
Acked-by: Pratyush Anand &lt;<a href=3D"javascript:;" onclick=3D"_e(event, =
&#39;cvml&#39;, &#39;pratyush.anand@gmail.com&#39;)">pratyush.anand@gmail.c=
om</a>&gt;<br>
---<br>
=C2=A0drivers/pci/host/pcie-designware.c | 128 +++++++++++-----------------=
---------<br>
=C2=A0drivers/pci/host/pcie-designware.h |=C2=A0 =C2=A01 -<br>
=C2=A02 files changed, 38 insertions(+), 91 deletions(-)<br>
<br>
diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pcie-des=
ignware.c<br>
index 089b6cf..1a6d3e1 100644<br>
--- a/drivers/pci/host/pcie-designware.c<br>
+++ b/drivers/pci/host/pcie-designware.c<br>
@@ -69,16 +69,7 @@<br>
=C2=A0#define PCIE_ATU_FUNC(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(((x) &amp; 0x7) &lt;&lt; 16)<br>
=C2=A0#define PCIE_ATU_UPPER_TARGET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x91C=
<br>
<br>
-static struct hw_pci dw_pci;<br>
-<br>
-static unsigned long global_io_offset;<br>
-<br>
-static inline struct pcie_port *sys_to_pcie(struct pci_sys_data *sys)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0BUG_ON(!sys-&gt;private_data);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return sys-&gt;private_data;<br>
-}<br>
+static struct pci_ops dw_pcie_ops;<br>
<br>
=C2=A0int dw_pcie_cfg_read(void __iomem *addr, int where, int size, u32 *va=
l)<br>
=C2=A0{<br>
@@ -255,7 +246,7 @@ static void dw_pcie_msi_set_irq(struct pcie_port *pp, i=
nt irq)<br>
=C2=A0static int assign_irq(int no_irqs, struct msi_desc *desc, int *pos)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int irq, pos0, i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D sys_to_pcie(msi_desc_t=
o_pci_sysdata(desc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D (struct pcie_port *) m=
si_desc_to_pci_sysdata(desc);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pos0 =3D bitmap_find_free_region(pp-&gt;msi_irq=
_in_use, MAX_MSI_IRQS,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0order_bas=
e_2(no_irqs));<br>
@@ -298,7 +289,7 @@ static int dw_msi_setup_irq(struct msi_controller *chip=
, struct pci_dev *pdev,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int irq, pos;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct msi_msg msg;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D sys_to_pcie(pdev-&gt;b=
us-&gt;sysdata);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D pdev-&gt;bus-&gt;sysda=
ta;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (desc-&gt;msi_attrib.is_msix)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
@@ -327,7 +318,7 @@ static void dw_msi_teardown_irq(struct msi_controller *=
chip, unsigned int irq)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct irq_data *data =3D irq_get_irq_data(irq)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct msi_desc *msi =3D irq_data_get_msi_desc(=
data);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D sys_to_pcie(msi_desc_t=
o_pci_sysdata(msi));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D (struct pcie_port *) m=
si_desc_to_pci_sysdata(msi);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_irq_range(pp, irq, 1, data-&gt;hwirq);<br=
>
=C2=A0}<br>
@@ -362,6 +353,7 @@ int dw_pcie_host_init(struct pcie_port *pp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *np =3D pp-&gt;dev-&gt;of_no=
de;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct platform_device *pdev =3D to_platform_de=
vice(pp-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pci_bus *bus, *child;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct resource *cfg_res;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i, ret;<br>
@@ -390,14 +382,13 @@ int dw_pcie_host_init(struct pcie_port *pp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pp-&gt;io-&gt;name =3D &quot;I/O&quot;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pp-&gt;io_size =3D resource_size(pp-&gt;io);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pp-&gt;io_bus_addr =3D pp-&gt;io-&gt;start - win-&gt;offset;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pp-&gt;io-&gt;start =3D max_t(resource_size_t, PCIBIOS_MIN_IO,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pp-&gt;io_bus_addr +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0global_io_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pp-&gt;io-&gt;end =3D min_t(resource_size_t, IO_SPACE_LIMIT,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0pp-&gt;io_bus_addr + pp-&gt;io_size +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0global_io_offset - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D pci_remap_iospace(pp-&gt;io, pp-&gt;io_base);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(pp-&gt;dev, &quot;error %d: =
failed to map resource %pR\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret, pp-=
&gt;io);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pp-&gt;io_base =3D pp-&gt;io-&gt;start;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pp-&gt;io_base_tmp =3D pp-&gt;io-&gt;start;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case IORESOURCE_MEM=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pp-&gt;mem =3D win-&gt;res;<br>
@@ -490,15 +481,35 @@ int dw_pcie_host_init(struct pcie_port *pp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 val |=3D PORT_LOGIC_SPEED_CHANGE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dw_pcie_wr_own_conf(pp, PCIE_LINK_WIDTH_SPEED_C=
ONTROL, 4, val);<br>
<br>
-#ifdef CONFIG_PCI_MSI<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dw_pcie_msi_chip.dev =3D pp-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pp-&gt;root_bus_nr =3D pp-&gt;busn-&gt;start;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ENABLED(CONFIG_PCI_MSI)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus =3D pci_scan_ro=
ot_bus_msi(pp-&gt;dev, pp-&gt;root_bus_nr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;dw_pcie_ops, pp, &amp;res,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;dw_pcie_msi_chip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dw_pcie_msi_chip.de=
v =3D pp-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus =3D pci_scan_ro=
ot_bus(pp-&gt;dev, pp-&gt;root_bus_nr, &amp;dw_pcie_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pp, &amp;=
res);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bus)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pp-&gt;ops-&gt;scan_bus)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pp-&gt;ops-&gt;scan=
_bus(pp);<br>
+<br>
+#ifdef CONFIG_ARM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* support old dtbs that incorrectly describe I=
RQs */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_fixup_irqs(pci_common_swizzle, of_irq_parse=
_and_map_pci);<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dw_pci.nr_controllers =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dw_pci.private_data =3D (void **)&amp;pp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pci_has_flag(PCI_PROBE_ONLY)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_bus_size_bridge=
s(bus);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_bus_assign_reso=
urces(bus);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_common_init_dev(pp-&gt;dev, &amp;dw_pci);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry=
(child, &amp;bus-&gt;children, node)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pcie_bus_configure_settings(child);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_bus_add_devices(bus);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
@@ -598,7 +609,7 @@ static int dw_pcie_valid_config(struct pcie_port *pp,<b=
r>
=C2=A0static int dw_pcie_rd_conf(struct pci_bus *bus, u32 devfn, int where,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int size, u32 *val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D sys_to_pcie(bus-&gt;sy=
sdata);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D bus-&gt;sysdata;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dw_pcie_valid_config(pp, bus, PCI_SLOT(devf=
n)) =3D=3D 0) {<br>
@@ -622,7 +633,7 @@ static int dw_pcie_rd_conf(struct pci_bus *bus, u32 dev=
fn, int where,<br>
=C2=A0static int dw_pcie_wr_conf(struct pci_bus *bus, u32 devfn,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int where, int size, u32 val)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D sys_to_pcie(bus-&gt;sy=
sdata);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D bus-&gt;sysdata;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dw_pcie_valid_config(pp, bus, PCI_SLOT(devf=
n)) =3D=3D 0)<br>
@@ -646,69 +657,6 @@ static struct pci_ops dw_pcie_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .write =3D dw_pcie_wr_conf,<br>
=C2=A0};<br>
<br>
-static int dw_pcie_setup(int nr, struct pci_sys_data *sys)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pp =3D sys_to_pcie(sys);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (global_io_offset &lt; SZ_1M &amp;&amp; pp-&=
gt;io_size &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys-&gt;io_offset =
=3D global_io_offset - pp-&gt;io_bus_addr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_ioremap_io(glob=
al_io_offset, pp-&gt;io_base_tmp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0global_io_offset +=
=3D SZ_64K;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_add_resource_of=
fset(&amp;sys-&gt;resources, pp-&gt;io,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys-&gt;i=
o_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sys-&gt;mem_offset =3D pp-&gt;mem-&gt;start - p=
p-&gt;mem_bus_addr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_add_resource_offset(&amp;sys-&gt;resources,=
 pp-&gt;mem, sys-&gt;mem_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pci_add_resource(&amp;sys-&gt;resources, pp-&gt=
;busn);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-}<br>
-<br>
-static struct pci_bus *dw_pcie_scan_bus(int nr, struct pci_sys_data *sys)<=
br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pci_bus *bus;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D sys_to_pcie(sys);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pp-&gt;root_bus_nr =3D sys-&gt;busnr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ENABLED(CONFIG_PCI_MSI))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus =3D pci_scan_ro=
ot_bus_msi(pp-&gt;dev, sys-&gt;busnr, &amp;dw_pcie_ops,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0sys, &amp;sys-&gt;resources,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&amp;dw_pcie_msi_chip);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus =3D pci_scan_ro=
ot_bus(pp-&gt;dev, sys-&gt;busnr, &amp;dw_pcie_ops,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys, &amp=
;sys-&gt;resources);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bus)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bus &amp;&amp; pp-&gt;ops-&gt;scan_bus)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pp-&gt;ops-&gt;scan=
_bus(pp);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return bus;<br>
-}<br>
-<br>
-static int dw_pcie_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D sys_to_pcie(dev-&gt;bu=
s-&gt;sysdata);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D of_irq_parse_and_map_pci(dev, slot, pin=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!irq)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D pp-&gt;irq;=
<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return irq;<br>
-}<br>
-<br>
-static struct hw_pci dw_pci =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D dw=
_pcie_setup,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.scan=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D dw_pcie_scan_bus,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.map_irq=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D dw_pcie=
_map_irq,<br>
-};<br>
-<br>
=C2=A0void dw_pcie_setup_rc(struct pcie_port *pp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
diff --git a/drivers/pci/host/pcie-designware.h b/drivers/pci/host/pcie-des=
ignware.h<br>
index 91a36f6..264c969 100644<br>
--- a/drivers/pci/host/pcie-designware.h<br>
+++ b/drivers/pci/host/pcie-designware.h<br>
@@ -33,7 +33,6 @@ struct pcie_port {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *va_cfg1_base;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg1_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 resource_size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0io_base;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0resource_size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0io_base_tmp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 phys_addr_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0io_bus_addr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0io_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u64=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem_base;<br>
--<br>
1.9.1<br>
<br>
</blockquote></div></div>

--94eb2c06d3624c431a052348335d--
