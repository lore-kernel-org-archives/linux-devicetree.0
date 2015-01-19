Return-Path: <gabriel.fernandez@linaro.org>
MIME-Version: 1.0
In-Reply-To: <8467440.C7CR1EqfOe@wuerfel>
References: <1418812486-12394-1-git-send-email-gabriel.fernandez@linaro.org>
	<1418812486-12394-4-git-send-email-gabriel.fernandez@linaro.org>
	<8467440.C7CR1EqfOe@wuerfel>
Date: Mon, 19 Jan 2015 13:37:33 +0100
Message-ID: <CAG374jDmUyEX0_iu4wG8LjM6YGMjsB-3PjnyZy_0Se=nLcn16g@mail.gmail.com>
Subject: Re: [PATCH 3/5] PCI: st: Provide support for the sti PCIe controller
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Content-Type: multipart/alternative; boundary=001a113d668027ae7f050d009615
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Mohit Kumar <mohit.kumar@st.com>, Jingoo Han <jg1.han@samsung.com>, Grant Likely <grant.likely@linaro.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <treding@nvidia.com>, Minghuan Lian <Minghuan.Lian@freescale.com>, Magnus Damm <damm@opensource.se>, Will Deacon <will.deacon@arm.com>, Tanmay Inamdar <tinamdar@apm.com>, Murali Karicheri <m-karicheri2@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Pratyush Anand <pratyush.anand@st.com>, Sachin Kamat <sachin.kamat@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Liviu Dudau <Liviu.Dudau@arm.com>, Srikanth Thokala <sthokal@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>, linux-pci@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--001a113d668027ae7f050d009615
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On 17 December 2014 at 23:14, Arnd Bergmann <arnd@arndb.de> wrote:

> On Wednesday 17 December 2014 11:34:44 Gabriel FERNANDEZ wrote:
> > sti pcie is built around a Synopsis Designware PCIe IP.
> >
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> > ---
> >  drivers/pci/host/Kconfig  |   5 +
> >  drivers/pci/host/Makefile |   1 +
> >  drivers/pci/host/pci-st.c | 713
> ++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 719 insertions(+)
> >  create mode 100644 drivers/pci/host/pci-st.c
> >
> > diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
> > index c4b6568..999d2b9 100644
> > --- a/drivers/pci/host/Kconfig
> > +++ b/drivers/pci/host/Kconfig
> > @@ -102,4 +102,9 @@ config PCI_LAYERSCAPE
> >       help
> >         Say Y here if you want PCIe controller support on Layerscape
> SoCs.
> >
> > +config PCI_ST
> > +     bool "ST STiH41x PCIe controller"
> > +     depends on ARCH_STI
> > +     select PCIE_DW
>
> I'd use 'depends on ARCH_STI || (ARM && COMPILE_TEST)' to enable
> building this on other platforms for test purposes.
>
> =E2=80=8Bok
=E2=80=8B


> > +
> > +#define to_st_pcie(x)        container_of(x, struct st_pcie, pp)
> > +
> > +/**
> > + * struct st_pcie_ops - SOC dependent data
> > + * @init: reference to controller power & reset init routine
> > + * @enable_ltssm: reference to controller link enable routine
> > + * @disable_ltssm:  reference to controller link disable routine
> > + * @phy_auto: flag when phy automatically configured
> > + */
> > +struct st_pcie_ops {
> > +     int (*init)(struct pcie_port *pp);
> > +     int (*enable_ltssm)(struct pcie_port *pp);
> > +     int (*disable_ltssm)(struct pcie_port *pp);
> > +     bool phy_auto;
> > +};
>
> It would be better not to invent another level of indirection. Try
> turning this around so you have a driver that binds to the specific
> SoC compatible string for the PCIe port while calling into a common
> library module for things that are shared.
>
=E2=80=8Bok, i will fix it.=E2=80=8B



>
> > +/*
> > + * On ARM platforms, we actually get a bus error returned when the PCI=
e
> IP
> > + * returns a UR or CRS instead of an OK.
> > + */
> > +static int st_pcie_abort_
> =E2=80=8B=E2=80=8B
> handler(unsigned long addr, unsigned int fsr,
> > +                              struct pt_regs *regs)
> > +{
> > +     return 0;
> > +}
>
> You should check that it's actually PCI that caused the abort. Don't
> just ignore a hard error condition.
>
> Usually there are registers in the PCI core that let you identify what
> happened.
>

=E2=80=8B
We return 0 because abort handler is not activated during boot.

=E2=80=8B


>
> > +static int
> =E2=80=8B=E2=80=8B
> st_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *bus,
> > +                              unsigned int devfn, int where, int size,
> > +                              u32 *val)
> > +{
> > +     u32 data;
> > +     u32 bdf;
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +     int is_root_bus =3D pci_is_root_bus(bus);
> > +     int retry_count =3D 0;
> > +     int ret;
> > +     void __iomem *addr;
> > +
> > +     /*
> > +      * Prerequisite
> > +      * PCI express devices will respond to all config type 0 cycles,
> since
> > +      * they are point to point links. Thus to avoid probing for
> multiple
> > +      * devices on the root, dw-pcie already check for us if it is on
> the
> > +      * root bus / other slots. Also, dw-pcie checks for the link bein=
g
> up
> > +      * as we will hang if we issue a config request and the link is
> down.
> > +      * A switch will reject requests for slots it knows do not exist.
> > +      */
> > +     bdf =3D bdf_num(bus->number, devfn, is_root_bus);
> > +     addr =3D pcie->config_area + config_addr(where,
> > +                     bus->parent->number =3D=3D pp->root_bus_nr);
> > +retry:
> > +     /* Set the config packet devfn */
> > +     writel_relaxed(bdf, pp->dbi_base + FUNC0_BDF_NUM);
> > +     readl_relaxed(pp->dbi_base + FUNC0_BDF_NUM);
> > +
> > +     ret =3D dw_pcie_cfg_read(addr, where, size, &data);
> > +
> > +     /*
> > +      * This is intended to help with when we are probing the bus. The
> > +      * problem is that the wrapper logic doesn't have any way to
> > +      * interrogate if the configuration request failed or not.
> > +      * On the ARM we actually get a real bus error.
> > +      *
> > +      * Unfortunately this means it is impossible to tell the differen=
ce
> > +      * between when a device doesn't exist (the switch will return a =
UR
> > +      * completion) or the device does exist but isn't yet ready to
> accept
> > +      * configuration requests (the device will return a CRS completio=
n)
> > +      *
> > +      * The result of this is that we will miss devices when probing.
> > +      *
> > +      * So if we are trying to read the dev/vendor id on devfn 0 and w=
e
> > +      * appear to get zero back, then we retry the request.  We know
> that
> > +      * zero can never be a valid device/vendor id. The specification
> says
> > +      * we must retry for up to a second before we decide the device i=
s
> > +      * dead. If we are still dead then we assume there is nothing
> there and
> > +      * return ~0
> > +      *
> > +      * The downside of this is that we incur a delay of 1s for every
> pci
> > +      * express link that doesn't have a device connected.
> > +      */
> > +     if (((where & ~3) =3D=3D 0) && devfn =3D=3D 0 && (data =3D=3D 0 |=
| data =3D=3D
> ~0)) {
> > +             if (retry_count++ < 1000) {
> > +                     mdelay(1);
> > +                     goto retry;
> > +             } else {
> > +                     *val =3D ~0;
> > +                     return PCIBIOS_DEVICE_NOT_FOUND;
> > +             }
> > +     }
> > +
> > +     *val =3D data;
> > +     return ret;
> > +}
>
> A busy-loop is extremely nasty. If this is only during the initial bus
> scan, could you use an msleep instead?
>
> =E2=80=8Byes it's during the initial bus scan.
But we can't use msleep because we are under raw_spin_lock_irqsave()
see PCI_OP_READ() macro in drivers/pci/access.c
=E2=80=8B


> Also, it sounds like the error you get is actually the fault that you
> are catching above. If this is correct, then use the fault handler to
> communicate this to the probe function.
>

=E2=80=8BSame as above the handler is not activated during the boot and ini=
tial bus
scan.=E2=80=8B



>
> > +
> > +static void st_pcie_board_reset(struct pcie_port *pp)
> > +{
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +
> > +     if (!gpio_is_valid(pcie->reset_gpio))
> > +             return;
> > +
> > +     if (gpio_direction_output(pcie->reset_gpio, 0)) {
> > +             dev_err(pp->dev, "Cannot set PERST# (gpio %u) to output\n=
",
> > +                     pcie->reset_gpio);
> > +             return;
> > +     }
> > +
> > +     /* From PCIe spec */
> > +     usleep_range(1000, 2000);
> > +     gpio_direction_output(pcie->reset_gpio, 1);
> > +
> > +     /*
> > +      * PCIe specification states that you should not issue any config
> > +      * requests until 100ms after asserting reset, so we enforce that
> here
> > +      */
> > +     usleep_range(100000, 150000);
> > +}
>
> This seems hardly performance critical, just use msleep(2) and
> msleep(100) instead of the usleep_range().
>

=E2=80=8Bok i will fix it.=E2=80=8B



>
> > +static void st_msi_init_one(struct pcie_port *pp)
> > +{
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +
> > +     /*
> > +      * Set the magic address the hardware responds to. This has to be
> in
> > +      * the range the PCI controller can write to.
> > +      */
> > +     dw_pcie_msi_init(pp);
> > +
> > +     if ((virt_to_phys((void *)pp->msi_data) < pcie->lmi->start) ||
> > +         (virt_to_phys((void *)pp->msi_data) > pcie->lmi->end))
> > +             dev_err(pp->dev, "MSI addr miss-configured\n");
> > +}
>
> Why do you call virt_to_phys() here? Isn't
> =E2=80=8B=E2=80=8B
> msi_data a physical address?
>
=E2=80=8B?

=E2=80=8B
msi_data is a virtual address, it's obtained through a   __get_free_pages()
function in dw_pcie_msi_init() procedure.
=E2=80=8B=E2=80=8B


> > +static int __init st_pcie_probe(struct platform_device *pdev)
>
> I'd suggest removing the __init here, as discussed in the review for
> the qualcomm driver.
>
> =E2=80=8Bok
=E2=80=8B


>         Arnd
>

=E2=80=8BBR

Gabriel.=E2=80=8B

--001a113d668027ae7f050d009615
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:&#39;cou=
rier new&#39;,monospace">Hi Arnd,</div><div class=3D"gmail_default" style=
=3D"font-family:&#39;courier new&#39;,monospace"><br></div><div class=3D"gm=
ail_default" style=3D"font-family:&#39;courier new&#39;,monospace"><span st=
yle=3D"font-family:arial,sans-serif">On 17 December 2014 at 23:14, Arnd Ber=
gmann </span><span dir=3D"ltr" style=3D"font-family:arial,sans-serif">&lt;<=
a href=3D"mailto:arnd@arndb.de" target=3D"_blank">arnd@arndb.de</a>&gt;</sp=
an><span style=3D"font-family:arial,sans-serif"> wrote:</span><br></div><di=
v class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span>O=
n Wednesday 17 December 2014 11:34:44 Gabriel FERNANDEZ wrote:<br>
&gt; sti pcie is built around a Synopsis Designware PCIe IP.<br>
&gt;<br>
&gt; Signed-off-by: Fabrice Gasnier &lt;<a href=3D"mailto:fabrice.gasnier@s=
t.com" target=3D"_blank">fabrice.gasnier@st.com</a>&gt;<br>
&gt; Signed-off-by: Gabriel Fernandez &lt;<a href=3D"mailto:gabriel.fernand=
ez@linaro.org" target=3D"_blank">gabriel.fernandez@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/pci/host/Kconfig=C2=A0 |=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 drivers/pci/host/Makefile |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/pci/host/pci-st.c | 713 ++++++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 3 files changed, 719 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/pci/host/pci-st.c<br>
&gt;<br>
&gt; diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig<br>
&gt; index c4b6568..999d2b9 100644<br>
&gt; --- a/drivers/pci/host/Kconfig<br>
&gt; +++ b/drivers/pci/host/Kconfig<br>
&gt; @@ -102,4 +102,9 @@ config PCI_LAYERSCAPE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here if you want PCIe controlle=
r support on Layerscape SoCs.<br>
&gt;<br>
&gt; +config PCI_ST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ST STiH41x PCIe controller&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_STI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select PCIE_DW<br>
<br>
</span>I&#39;d use &#39;depends on ARCH_STI || (ARM &amp;&amp; COMPILE_TEST=
)&#39; to enable<br>
building this on other platforms for test purposes.<br>
<span><br></span></blockquote><div><div class=3D"gmail_default" style=3D"fo=
nt-family:&#39;courier new&#39;,monospace;display:inline"><span style=3D"fo=
nt-family:arial,helvetica,sans-serif">=E2=80=8Bok</span><br>=E2=80=8B</div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex"><span>
&gt; +<br>
&gt; +#define to_st_pcie(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 container_of(x, stru=
ct st_pcie, pp)<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * struct st_pcie_ops - SOC dependent data<br>
&gt; + * @init: reference to controller power &amp; reset init routine<br>
&gt; + * @enable_ltssm: reference to controller link enable routine<br>
&gt; + * @disable_ltssm:=C2=A0 reference to controller link disable routine=
<br>
&gt; + * @phy_auto: flag when phy automatically configured<br>
&gt; + */<br>
&gt; +struct st_pcie_ops {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*init)(struct pcie_port *pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*enable_ltssm)(struct pcie_port *pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*disable_ltssm)(struct pcie_port *pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool phy_auto;<br>
&gt; +};<br>
<br>
</span>It would be better not to invent another level of indirection. Try<b=
r>
turning this around so you have a driver that binds to the specific<br>
SoC compatible string for the PCIe port while calling into a common<br>
library module for things that are shared.<br></blockquote><div><div class=
=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;,monospace;dis=
play:inline">=E2=80=8Bok, i will fix it.=E2=80=8B</div>=C2=A0</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex">
<span><br>
&gt; +/*<br>
&gt; + * On ARM platforms, we actually get a bus error returned when the PC=
Ie IP<br>
&gt; + * returns a UR or CRS instead of an OK.<br>
&gt; + */<br>
&gt; +static int st_pcie_abort_<div class=3D"gmail_default" style=3D"font-f=
amily:&#39;courier new&#39;,monospace;display:inline">=E2=80=8B=E2=80=8B</d=
iv>handler(unsigned long addr, unsigned int fsr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pt_regs *regs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
<br>
</span>You should check that it&#39;s actually PCI that caused the abort. D=
on&#39;t<br>
just ignore a hard error condition.<br>
<br>
Usually there are registers in the PCI core that let you identify what<br>
happened.<br></blockquote><div>=C2=A0</div><div><div class=3D"gmail_default=
" style=3D"font-family:&#39;courier new&#39;,monospace">=E2=80=8B</div><div=
 class=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;,monospa=
ce">We return 0 because abort handler is not activated during boot.<br></di=
v></div><div class=3D"gmail_default" style=3D"font-family:&#39;courier new&=
#39;,monospace"><br></div><div><div class=3D"gmail_default" style=3D"font-f=
amily:&#39;courier new&#39;,monospace;display:inline">=E2=80=8B</div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex">
<div><div><br>
&gt; +static int <div class=3D"gmail_default" style=3D"font-family:&#39;cou=
rier new&#39;,monospace;display:inline">=E2=80=8B=E2=80=8B</div>st_pcie_rd_=
other_conf(struct pcie_port *pp, struct pci_bus *bus,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int devfn, int where, int size=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 bdf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int is_root_bus =3D pci_is_root_bus(bus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retry_count =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *addr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Prerequisite<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * PCI express devices will respond to all config=
 type 0 cycles, since<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * they are point to point links. Thus to avoid p=
robing for multiple<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * devices on the root, dw-pcie already check for=
 us if it is on the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * root bus / other slots. Also, dw-pcie checks f=
or the link being up<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * as we will hang if we issue a config request a=
nd the link is down.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * A switch will reject requests for slots it kno=
ws do not exist.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bdf =3D bdf_num(bus-&gt;number, devfn, is_root_bu=
s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0addr =3D pcie-&gt;config_area + config_addr(where=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bus-&gt;parent-&gt;number =3D=3D pp-&gt;root_bus_nr);<br>
&gt; +retry:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Set the config packet devfn */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(bdf, pp-&gt;dbi_base + FUNC0_BDF_N=
UM);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0readl_relaxed(pp-&gt;dbi_base + FUNC0_BDF_NUM);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dw_pcie_cfg_read(addr, where, size, &amp;=
data);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * This is intended to help with when we are prob=
ing the bus. The<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * problem is that the wrapper logic doesn&#39;t =
have any way to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * interrogate if the configuration request faile=
d or not.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * On the ARM we actually get a real bus error.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Unfortunately this means it is impossible to t=
ell the difference<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * between when a device doesn&#39;t exist (the s=
witch will return a UR<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * completion) or the device does exist but isn&#=
39;t yet ready to accept<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * configuration requests (the device will return=
 a CRS completion)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * The result of this is that we will miss device=
s when probing.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * So if we are trying to read the dev/vendor id =
on devfn 0 and we<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * appear to get zero back, then we retry the req=
uest.=C2=A0 We know that<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * zero can never be a valid device/vendor id. Th=
e specification says<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * we must retry for up to a second before we dec=
ide the device is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * dead. If we are still dead then we assume ther=
e is nothing there and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * return ~0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * The downside of this is that we incur a delay =
of 1s for every pci<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * express link that doesn&#39;t have a device co=
nnected.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (((where &amp; ~3) =3D=3D 0) &amp;&amp; devfn =
=3D=3D 0 &amp;&amp; (data =3D=3D 0 || data =3D=3D ~0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retry_count++ &lt=
; 1000) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mdelay(1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto retry;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*val =3D ~0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return PCIBIOS_DEVICE_NOT_FOUND;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*val =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
<br>
</div></div>A busy-loop is extremely nasty. If this is only during the init=
ial bus<br>
scan, could you use an msleep instead?<br>
<br></blockquote><div><div class=3D"gmail_default" style=3D"font-family:&#3=
9;courier new&#39;,monospace;display:inline">=E2=80=8Byes it&#39;s during t=
he initial bus scan.</div></div><div><div class=3D"gmail_default" style=3D"=
font-family:&#39;courier new&#39;,monospace;display:inline">But we can&#39;=
t use msleep because we are under raw_spin_lock_irqsave()=C2=A0</div></div>=
<div><div class=3D"gmail_default" style=3D"font-family:&#39;courier new&#39=
;,monospace;display:inline">see=C2=A0PCI_OP_READ() macro in drivers/pci/acc=
ess.c</div></div><div><div class=3D"gmail_default" style=3D"font-family:&#3=
9;courier new&#39;,monospace;display:inline">=E2=80=8B</div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padd=
ing-left:1ex">
Also, it sounds like the error you get is actually the fault that you<br>
are catching above. If this is correct, then use the fault handler to<br>
communicate this to the probe function.<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;,mo=
nospace">=E2=80=8BSame as above the handler is not activated during the boo=
t and initial bus scan.=E2=80=8B</div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-lef=
t:1ex">
<span><br>
&gt; +<br>
&gt; +static void st_pcie_board_reset(struct pcie_port *pp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!gpio_is_valid(pcie-&gt;reset_gpio))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (gpio_direction_output(pcie-&gt;reset_gpio, 0)=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pp-&gt;dev, &=
quot;Cannot set PERST# (gpio %u) to output\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pcie-&gt;reset_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* From PCIe spec */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(1000, 2000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpio_direction_output(pcie-&gt;reset_gpio, 1);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * PCIe specification states that you should not =
issue any config<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * requests until 100ms after asserting reset, so=
 we enforce that here<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(100000, 150000);<br>
&gt; +}<br>
<br>
</span>This seems hardly performance critical, just use msleep(2) and<br>
msleep(100) instead of the usleep_range().<br></blockquote><div><div class=
=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;,monospace;dis=
play:inline"><br></div></div><div><div class=3D"gmail_default" style=3D"fon=
t-family:&#39;courier new&#39;,monospace;display:inline">=E2=80=8Bok i will=
 fix it.=E2=80=8B</div>=C2=A0</div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<span><br>
&gt; +static void st_msi_init_one(struct pcie_port *pp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Set the magic address the hardware responds to=
. This has to be in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * the range the PCI controller can write to.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dw_pcie_msi_init(pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((virt_to_phys((void *)pp-&gt;msi_data) &lt; p=
cie-&gt;lmi-&gt;start) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(virt_to_phys((void *)pp-&gt;msi_da=
ta) &gt; pcie-&gt;lmi-&gt;end))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pp-&gt;dev, &=
quot;MSI addr miss-configured\n&quot;);<br>
&gt; +}<br>
<br>
</span>Why do you call virt_to_phys() here? Isn&#39;t <div class=3D"gmail_d=
efault" style=3D"font-family:&#39;courier new&#39;,monospace;display:inline=
">=E2=80=8B=E2=80=8B</div>msi_data a physical address?<br></blockquote><div=
><div class=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;,mo=
nospace;display:inline">=E2=80=8B?</div></div><div><div class=3D"gmail_defa=
ult" style=3D"font-family:&#39;courier new&#39;,monospace;display:inline"><=
br></div></div><div><div class=3D"gmail_default" style=3D"display:inline"><=
div class=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;,mono=
space;display:inline">=E2=80=8B</div>msi_data is a virtual address, it&#39;=
s obtained=C2=A0through a=C2=A0=C2=A0=C2=A0__get_free_pages() function in=
=C2=A0dw_pcie_msi_init() procedure.<br></div></div><div><span style=3D"font=
-family:&#39;courier new&#39;,monospace">=E2=80=8B=E2=80=8B</span><br></div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex">
<span><br>
&gt; +static int __init st_pcie_probe(struct platform_device *pdev)<br>
<br>
</span>I&#39;d suggest removing the __init here, as discussed in the review=
 for<br>
the qualcomm driver.<br>
<span><font color=3D"#888888"><br></font></span></blockquote><div><div clas=
s=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;,monospace;di=
splay:inline">=E2=80=8Bok</div></div><div><div class=3D"gmail_default" styl=
e=3D"font-family:&#39;courier new&#39;,monospace;display:inline">=E2=80=8B<=
/div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><span><font color=3D"#888888">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnd<br></font></span></blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-family:&#39;courier new&=
#39;,monospace;display:inline">=E2=80=8BBR</div></div><div><div class=3D"gm=
ail_default" style=3D"font-family:&#39;courier new&#39;,monospace;display:i=
nline"><br></div></div><div><div class=3D"gmail_default" style=3D"font-fami=
ly:&#39;courier new&#39;,monospace;display:inline">Gabriel.=E2=80=8B</div>=
=C2=A0</div></div></div></div>

--001a113d668027ae7f050d009615--
