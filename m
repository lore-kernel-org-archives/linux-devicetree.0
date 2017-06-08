Return-Path: <SRS0=TKzW=5N=broadcom.com=al.cooper@kernel.org>
MIME-Version: 1.0
In-Reply-To: <e26f0de1-b73c-3e6b-9149-7581d2e4559b@ti.com>
References: <1496426512-10590-1-git-send-email-alcooperx@gmail.com>
 <1496426512-10590-4-git-send-email-alcooperx@gmail.com> <e26f0de1-b73c-3e6b-9149-7581d2e4559b@ti.com>
From: Al Cooper <al.cooper@broadcom.com>
Date: Thu, 8 Jun 2017 18:31:42 -0400
Message-ID: <CAGh=XABApaNP7rC0bR5Stxq0uhWMXxR8E4stFQEmzosu7Fee=Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] phy: usb: phy-brcm-usb: Add Broadcom STB USB phy driver
Content-Type: multipart/alternative; boundary="94eb2c0bab66cf332305517a6a9d"
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c0bab66cf332305517a6a9d
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 7, 2017 at 9:24 AM, 'Kishon Vijay Abraham I' via
BCM-KERNEL-FEEDBACK-LIST,PDL <bcm-kernel-feedback-list.pdl@broadcom.com>
wrote:
>
> hi,
>
> On Friday 02 June 2017 11:31 PM, Al Cooper wrote:
> > Add a new USB Phy driver for Broadcom STB SoCs. This driver
> > supports Broadcom STB ARM and MIPS SoCs. This driver in
> > combination with the Broadcom STB ohci, ehci and xhci
> > drivers will enable USB1.1, USB2.0 and USB3.0 support.
> > This Phy driver also supports the Broadcom UDC gadget
> > driver.
> >
> > Signed-off-by: Al Cooper <alcooperx@gmail.com>
> > ---
> >  MAINTAINERS                     |    7 +
> >  drivers/phy/Makefile            |    4 +
> >  drivers/phy/phy-brcm-usb-init.c | 1111 ++++++++++++++++++++++++++++++
+++++++++
> >  drivers/phy/phy-brcm-usb-init.h |  110 ++++
> >  drivers/phy/phy-brcm-usb.c      |  487 +++++++++++++++++
> >  5 files changed, 1719 insertions(+)
> >  create mode 100644 drivers/phy/phy-brcm-usb-init.c
> >  create mode 100644 drivers/phy/phy-brcm-usb-init.h
> >  create mode 100644 drivers/phy/phy-brcm-usb.c
>
> please rebase to linux-phy -next. Directory structure has changed a bit.

OK

>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f7d568b..6a1a049 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2774,6 +2774,13 @@ L:     linux-pm@vger.kernel.org
>>  S:   Maintained
>>  F:   drivers/cpufreq/bmips-cpufreq.c
>>
>> +BROADCOM BRCMSTB USB2 and USB3 PHY DRIVER
>> +M:   Al Cooper <alcooperx@gmail.com>
>> +L:   linux-kernel@vger.kernel.org
>> +L:   bcm-kernel-feedback-list@broadcom.com
>> +S:   Maintained
>> +F:   drivers/phy/phy-brcm-usb*
>> +
>>  BROADCOM TG3 GIGABIT ETHERNET DRIVER
>>  M:   Siva Reddy Kallam <siva.kallam@broadcom.com>
>>  M:   Prashant Sreedharan <prashant@broadcom.com>
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index f8047b4..2fb446a 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -64,3 +64,7 @@ obj-$(CONFIG_PHY_CYGNUS_PCIE)               +=
phy-bcm-cygnus-pcie.o
>>  obj-$(CONFIG_ARCH_TEGRA) += tegra/
>>  obj-$(CONFIG_PHY_NS2_PCIE)           += phy-bcm-ns2-pcie.o
>>  obj-$(CONFIG_PHY_MESON8B_USB2)               += phy-meson8b-usb2.o
>> +obj-$(CONFIG_BRCM_USB_PHY)           += phy-brcm-usb-dvr.o
>
>No Kconfig? How is this driver selected.

The driver is selected in the Kconfig for the Broadcom XHCI, EHCI and OHCI
USB drivers, but I'll also add the selection to the Kconfig in the phy
directory.

>> +#define   USB_CTRL_PLL_CTL_PLL_SUSPEND_EN_MASK               0x08000000
>> +#define   USB_CTRL_PLL_CTL_PLL_RESETB_MASK           0x40000000
>> +#define   USB_CTRL_PLL_CTL_PLL_IDDQ_PWRDN_MASK               0x80000000
/* option */
>> +#define USB_CTRL_EBRIDGE             0x0c
>> +#define   USB_CTRL_EBRIDGE_ESTOP_SCB_REQ_MASK                0x00020000
/* option */
>> +#define USB_CTRL_MDIO                        0x14
>> +#define USB_CTRL_MDIO2                       0x18
>
>if this is connected to mdio, then it should be modelled as mdio_driver.
See
>other broadcom phy drivers which use mdio.

Most of the control is done through a set of direct memory mapped
registers. These registers do contain an MDIO interface used for a small
portion of the setup.
Since this is primarily a direct memory mapped device it was created as a
platform driver on the platform bus.

>> +static inline u32 brcmusb_readl(void __iomem *addr)
>> +{
>> +     /*
>> +      * MIPS endianness is configured by boot strap, which also
reverses all
>> +      * bus endianness (i.e., big-endian CPU + big endian bus ==> native
>> +      * endian I/O).
>> +      *
>> +      * Other architectures (e.g., ARM) either do not support big
endian, or
>> +      * else leave I/O in little endian mode.
>> +      */
>> +     if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(__BIG_ENDIAN))
>
>Shouldn't this be handled in some arch specific code/headers (MIPS headers
>here) because this is not going to be specific to this phy driver?

This is unique to the Broadcom based MIPS chips, where some peripheral
blocks automatically handle the endian swapping in hardware based on the
CPUs endian mode.

>> +static u32 usb_mdio_read(void __iomem *ctrl_base, u32 reg, int mode)
>> +{
>> +     u32 data;
>> +
>> +     data = (reg << 16) | mode;
>> +     brcmusb_writel(data, USB_CTRL_REG(ctrl_base, MDIO));
>> +     data |= (1 << 24);
>> +     brcmusb_writel(data, USB_CTRL_REG(ctrl_base, MDIO));
>> +     data &= ~(1 << 24);
>> +     udelay(10);
>> +     brcmusb_writel(data, USB_CTRL_REG(ctrl_base, MDIO));
>> +     udelay(10);
>
>How did you get at this delay (and all delays below)? Perhaps a comment
will help.

I got the delays from the hardware team and I will comment them.

>> +
>> +     return brcmusb_readl(USB_CTRL_REG(ctrl_base, MDIO2)) & 0xffff;
>> +}
>> +
>> +static void usb_mdio_write(void __iomem *ctrl_base, u32 reg,
>> +                     u32 val, int mode)
>
>rename the function to begin with brcmusb_* here and below.

OK

>> +static DEVICE_ATTR_RO(device_mode);
>
>I think it would be easy to review if you can split the patch. First the
core
>driver and then all this sysfs. It would be better if you could fragment it
>further.

OK

>> +     priv->ini.family_id = brcmstb_get_family_id();
>> +     priv->ini.product_id = brcmstb_get_product_id();
>
>Where are these functions defined?

In patch 1 of 3 of this set.

>> +     if (of_property_read_u32(dn, "brcm,ipp", &priv->ini.ipp))
>> +             of_property_read_u32(dn, "ipp", &priv->ini.ipp);
>
>Why do you have to invoke of_property_read_u32 twice here?
>> +     if (of_property_read_u32(dn, "brcm,ioc", &priv->ini.ioc))
>> +             of_property_read_u32(dn, "ioc", &priv->ini.ioc);
>
>same here..

We have older versions of the device tree node passed in by the boot loader
that have "ipp" and "ioc" instead of "brcm,ipp" and "brcm,ioc"

>> +     if (priv->has_eohci) {
>> +             gphy = devm_phy_create(dev, NULL, &brcm_usb_phy_ops);
>> +             if (IS_ERR(gphy)) {
>> +                     dev_err(dev, "failed to create EHCI/OHCI PHY\n");
>> +                     return PTR_ERR(gphy);
>> +             }
>> +             priv->phys[BRCM_USB_PHY_2_0].phy = gphy;
>> +             priv->phys[BRCM_USB_PHY_2_0].id = BRCM_USB_PHY_2_0;
>> +             phy_set_drvdata(gphy, &priv->phys[BRCM_USB_PHY_2_0]);
>> +     }
>> +     if (priv->has_xhci) {
>> +             gphy = devm_phy_create(dev, NULL, &brcm_usb_phy_ops);
>> +             if (IS_ERR(gphy)) {
>> +                     dev_err(dev, "failed to create XHCI PHY\n");
>> +                     return PTR_ERR(gphy);
>> +             }
>
>devm_phy_create() can be moved outside the if conditions?

These are possibly 2 different phys.

>> +             priv->phys[BRCM_USB_PHY_3_0].phy = gphy;
>> +             priv->phys[BRCM_USB_PHY_3_0].id = BRCM_USB_PHY_3_0;
>> +             phy_set_drvdata(gphy, &priv->phys[BRCM_USB_PHY_3_0]);
>> +     }
>> +     mutex_init(&priv->mutex);
>> +     phy_provider = devm_of_phy_provider_register(dev,
>> +                     brcm_usb_phy_xlate);
>> +     if (IS_ERR(phy_provider))
>> +             return PTR_ERR(phy_provider);
>
>phy_provider_register can be done at the end of probe.

Agreed.

>> +#ifdef CONFIG_PM_SLEEP
>> +static int brcm_usb_phy_suspend(struct device *dev)
>> +{
>> +     struct brcm_usb_phy_data *priv = dev_get_drvdata(dev);
>> +
>> +     if (priv->init_count) {
>> +             clk_disable(priv->usb_20_clk);
>> +             clk_disable(priv->usb_30_clk);
>> +     }
>> +     return 0;
>
>How do you make sure phy is suspended after it's consumer? We shouldn't be
>suspending phy when the consumer is using it.

The suspend/resume order is based on the device-tree node order and we make
sure that the phy dt node comes before the USB nodes.
Doing it this way also allow me to use some of the generic platform drivers
for XHCI, EHCI and OHCI which don't do phy calls on suspend and resume.

>Thanks

Thanks

--94eb2c0bab66cf332305517a6a9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Jun 7, 2017 at 9:24 AM, &#39;Kishon Vijay Abraham =
I&#39; via BCM-KERNEL-FEEDBACK-LIST,PDL &lt;<a href=3D"mailto:bcm-kernel-fe=
edback-list.pdl@broadcom.com" target=3D"_blank">bcm-kernel-feedback-list.pd=
l@<wbr>broadcom.com</a>&gt; wrote:<br><font color=3D"#741b47">&gt;<br>&gt; =
hi,<br>&gt;<br>&gt; On Friday 02 June 2017 11:31 PM, Al Cooper wrote:<br>&g=
t; &gt; Add a new USB Phy driver for Broadcom STB SoCs. This driver<br>&gt;=
 &gt; supports Broadcom STB ARM and MIPS SoCs. This driver in<br>&gt; &gt; =
combination with the Broadcom STB ohci, ehci and xhci<br>&gt; &gt; drivers =
will enable USB1.1, USB2.0 and USB3.0 support.<br>&gt; &gt; This Phy driver=
 also supports the Broadcom UDC gadget<br>&gt; &gt; driver.<br>&gt; &gt;<br=
>&gt; &gt; Signed-off-by: Al Cooper &lt;<a href=3D"mailto:alcooperx@gmail.c=
om" target=3D"_blank">alcooperx@gmail.com</a>&gt;<br>&gt; &gt; ---<br>&gt; =
&gt; =C2=A0MAINTAINERS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A07 +<br>&gt; &gt; =C2=A0drivers/phy/Makefil=
e =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +<br>&gt; &gt; =
=C2=A0drivers/phy/phy-brcm-usb-<wbr>init.c | 1111 +++++++++++++++++++++++++=
+++++<wbr>+++++++++<br>&gt; &gt; =C2=A0drivers/phy/phy-brcm-usb-<wbr>init.h=
 | =C2=A0110 ++++<br>&gt; &gt; =C2=A0drivers/phy/phy-brcm-usb.c =C2=A0 =C2=
=A0 =C2=A0| =C2=A0487 +++++++++++++++++<br>&gt; &gt; =C2=A05 files changed,=
 1719 insertions(+)<br>&gt; &gt; =C2=A0create mode 100644 drivers/phy/phy-b=
rcm-usb-init.<wbr>c<br>&gt; &gt; =C2=A0create mode 100644 drivers/phy/phy-b=
rcm-usb-init.<wbr>h<br>&gt; &gt; =C2=A0create mode 100644 drivers/phy/phy-b=
rcm-usb.c<br>&gt;<br>&gt; please rebase to linux-phy -next. Directory struc=
ture has changed a bit.</font><div><br></div><div>OK</div><div><br></div><d=
iv><div style=3D"font-size:12.8px"><div class=3D"m_-8009602092183844995gmai=
l-im"><font color=3D"#741b47">&gt;&gt;<br>&gt;&gt; diff --git a/MAINTAINERS=
 b/MAINTAINERS<br>&gt;&gt; index f7d568b..6a1a049 100644<br>&gt;&gt; --- a/=
MAINTAINERS<br>&gt;&gt; +++ b/MAINTAINERS<br>&gt;&gt; @@ -2774,6 +2774,13 @=
@ L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-pm@vger.kernel.org" target=
=3D"_blank">linux-pm@vger.kernel.org</a><br>&gt;&gt;=C2=A0 S:=C2=A0 =C2=A0M=
aintained<br>&gt;&gt;=C2=A0 F:=C2=A0 =C2=A0drivers/cpufreq/bmips-<wbr>cpufr=
eq.c<br>&gt;&gt;<br>&gt;&gt; +BROADCOM BRCMSTB USB2 and USB3 PHY DRIVER<br>=
&gt;&gt; +M:=C2=A0 =C2=A0Al Cooper &lt;<a href=3D"mailto:alcooperx@gmail.co=
m" target=3D"_blank">alcooperx@gmail.com</a>&gt;<br>&gt;&gt; +L:=C2=A0 =C2=
=A0<a href=3D"mailto:linux-kernel@vger.kernel.org" target=3D"_blank">linux-=
kernel@vger.kernel.org</a><br>&gt;&gt; +L:=C2=A0 =C2=A0<a href=3D"mailto:bc=
m-kernel-feedback-list@broadcom.com" target=3D"_blank">bcm-kernel-feedback-=
list@broa<wbr>dcom.com</a><br>&gt;&gt; +S:=C2=A0 =C2=A0Maintained<br>&gt;&g=
t; +F:=C2=A0 =C2=A0drivers/phy/phy-brcm-usb*<br>&gt;&gt; +<br>&gt;&gt;=C2=
=A0 BROADCOM TG3 GIGABIT ETHERNET DRIVER<br>&gt;&gt;=C2=A0 M:=C2=A0 =C2=A0S=
iva Reddy Kallam &lt;<a href=3D"mailto:siva.kallam@broadcom.com" target=3D"=
_blank">siva.kallam@broadcom.com</a>&gt;<br>&gt;&gt;=C2=A0 M:=C2=A0 =C2=A0P=
rashant Sreedharan &lt;<a href=3D"mailto:prashant@broadcom.com" target=3D"_=
blank">prashant@broadcom.com</a>&gt;<br>&gt;&gt; diff --git a/drivers/phy/M=
akefile b/drivers/phy/Makefile<br>&gt;&gt; index f8047b4..2fb446a 100644<br=
>&gt;&gt; --- a/drivers/phy/Makefile<br>&gt;&gt; +++ b/drivers/phy/Makefile=
<br>&gt;&gt; @@ -64,3 +64,7 @@ obj-$(CONFIG_PHY_CYGNUS_PCIE)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D phy-bcm-cygnus-pcie.o<br>&gt;=
&gt;=C2=A0 obj-$(CONFIG_ARCH_TEGRA) +=3D tegra/<br>&gt;&gt;=C2=A0 obj-$(CON=
FIG_PHY_NS2_PCIE)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D phy-bcm-ns2-=
pcie.o<br>&gt;&gt;=C2=A0 obj-$(CONFIG_PHY_MESON8B_USB2)<wbr>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D phy-meson8b-usb2.o<br>&gt;&gt=
; +obj-$(CONFIG_BRCM_USB_PHY)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D =
phy-brcm-usb-dvr.o<br>&gt;</font></div></div><span style=3D"font-size:12.8p=
x"><font color=3D"#741b47">&gt;No Kconfig? How is this driver selected.</fo=
nt></span></div><div><span style=3D"font-size:12.8px"><br></span></div><div=
><span style=3D"font-size:12.8px">The driver is selected in the Kconfig for=
 the Broadcom XHCI, EHCI and OHCI USB drivers, but I&#39;ll also add the se=
lection to the Kconfig in the phy directory.</span></div><div><span style=
=3D"font-size:12.8px"><br></span></div><div><div style=3D"font-size:12.8px"=
><div class=3D"m_-8009602092183844995gmail-im"><font color=3D"#741b47">&gt;=
&gt; +#define=C2=A0 =C2=A0USB_CTRL_PLL_CTL_PLL_SUSPEND_<wbr>EN_MASK=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x08000000<br>&gt;&gt; +#de=
fine=C2=A0 =C2=A0USB_CTRL_PLL_CTL_PLL_RESETB_M<wbr>ASK=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x40000000<br>&gt;&gt; +#define=C2=A0 =C2=A0USB_CTRL_PL=
L_CTL_PLL_IDDQ_PWR<wbr>DN_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x80000000 /* option */<br>&gt;&gt; +#define USB_CTRL_EBRIDGE=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0c<br>&gt;&gt; +#define=C2=
=A0 =C2=A0USB_CTRL_EBRIDGE_ESTOP_SCB_RE<wbr>Q_MASK=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00020000 /* option */<br>&gt;&gt; +#defin=
e USB_CTRL_MDIO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x14<br>&gt;&gt; +#define USB_CTRL_MDIO2=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
18<br>&gt;</font></div></div><font color=3D"#741b47"><span style=3D"font-si=
ze:12.8px">&gt;if this is connected to mdio, then it should be modelled as =
mdio_driver. See</span><br style=3D"font-size:12.8px"><span style=3D"font-s=
ize:12.8px">&gt;other broadcom phy drivers which use mdio.</span></font><sp=
an style=3D"font-size:12.8px"><br></span><br></div><div>Most of the control=
 is done through a set of direct memory mapped registers. These registers d=
o contain an MDIO interface used for a small portion of the setup.</div><di=
v>Since this is primarily a direct memory mapped device it was created as a=
 platform driver on the platform bus.</div><div><br></div><div><div style=
=3D"font-size:12.8px"><div class=3D"m_-8009602092183844995gmail-im"><font c=
olor=3D"#741b47">&gt;&gt; +static inline u32 brcmusb_readl(void __iomem *ad=
dr)<br>&gt;&gt; +{<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0 * MIPS endianness is configured by boot strap, which also rev=
erses all<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 * bus endianness (i.e., big-end=
ian CPU + big endian bus =3D=3D&gt; native<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=
=A0 * endian I/O).<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0 * Other architectures (e.g., ARM) either do not support big e=
ndian, or<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 * else leave I/O in little endi=
an mode.<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>&gt;&gt; +=C2=A0 =C2=A0 =
=C2=A0if (IS_ENABLED(CONFIG_MIPS) &amp;&amp; IS_ENABLED(__BIG_ENDIAN))<br>&=
gt;</font></div></div><font color=3D"#741b47"><span style=3D"font-size:12.8=
px">&gt;Shouldn&#39;t this be handled in some arch specific code/headers (M=
IPS headers</span><br style=3D"font-size:12.8px"><span style=3D"font-size:1=
2.8px">&gt;here) because this is not going to be specific to this phy drive=
r?</span></font><br></div><div><br></div><div>This is unique to the Broadco=
m based MIPS chips, where some peripheral blocks automatically handle the e=
ndian swapping in hardware based on the CPUs endian mode.</div><div><br></d=
iv><div><div style=3D"font-size:12.8px"><div class=3D"m_-800960209218384499=
5gmail-im"><font color=3D"#741b47">&gt;&gt; +static u32 usb_mdio_read(void =
__iomem *ctrl_base, u32 reg, int mode)<br>&gt;&gt; +{<br>&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0u32 data;<br>&gt;&gt; +<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0data =
=3D (reg &lt;&lt; 16) | mode;<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0brcmusb_writ=
el(data, USB_CTRL_REG(ctrl_base, MDIO));<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0d=
ata |=3D (1 &lt;&lt; 24);<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0brcmusb_writel(d=
ata, USB_CTRL_REG(ctrl_base, MDIO));<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0data =
&amp;=3D ~(1 &lt;&lt; 24);<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0udelay(10);<br>=
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0brcmusb_writel(data, USB_CTRL_REG(ctrl_base, =
MDIO));<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0udelay(10);<br>&gt;</font></div></=
div><span style=3D"font-size:12.8px"><font color=3D"#741b47">&gt;How did yo=
u get at this delay (and all delays below)? Perhaps a comment will help.</f=
ont></span></div><div><br></div><div>I got the delays from the hardware tea=
m and I will comment them.</div><div><br><font color=3D"#741b47"><span clas=
s=3D"m_-8009602092183844995gmail-im" style=3D"font-size:12.8px">&gt;&gt; +<=
br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return brcmusb_readl(USB_CTRL_REG(ctr<wbr>=
l_base, MDIO2)) &amp; 0xffff;<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +sta=
tic void usb_mdio_write(void __iomem *ctrl_base, u32 reg,<br>&gt;&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u3=
2 val, int mode)<br>&gt;<br></span><span style=3D"font-size:12.8px">&gt;ren=
ame the function to begin with brcmusb_* here and below.</span></font><br><=
/div><div><span style=3D"font-size:12.8px"><br></span></div><div><span styl=
e=3D"font-size:12.8px">OK</span></div><div><span style=3D"font-size:12.8px"=
><br></span></div><div><div style=3D"font-size:12.8px"><div class=3D"m_-800=
9602092183844995gmail-im"><font color=3D"#741b47">&gt;&gt; +static DEVICE_A=
TTR_RO(device_mode);<br>&gt;</font></div></div><font color=3D"#741b47"><spa=
n style=3D"font-size:12.8px">&gt;I think it would be easy to review if you =
can split the patch. First the core</span><br style=3D"font-size:12.8px"><s=
pan style=3D"font-size:12.8px">&gt;driver and then all this sysfs. It would=
 be better if you could fragment it</span><br style=3D"font-size:12.8px"><s=
pan style=3D"font-size:12.8px">&gt;further.</span></font><br style=3D"font-=
size:12.8px"><div style=3D"font-size:12.8px"><div class=3D"m_-8009602092183=
844995gmail-adm"><div id=3D"m_-8009602092183844995gmail-q_15c82cff47efb24c_=
15" class=3D"m_-8009602092183844995gmail-ajR m_-8009602092183844995gmail-h4=
"></div></div></div></div><div><span style=3D"font-size:12.8px"><br></span>=
</div><div><span style=3D"font-size:12.8px">OK</span></div><div><span style=
=3D"font-size:12.8px"><br></span></div><div><div style=3D"font-size:12.8px"=
><div class=3D"m_-8009602092183844995gmail-im"><font color=3D"#741b47">&gt;=
&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;ini.family_id =3D brcmstb_get_family_id(=
);<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0priv-&gt;ini.product_id =3D brcmstb_get=
_product_id();<br>&gt;</font></div></div><span style=3D"font-size:12.8px"><=
font color=3D"#741b47">&gt;Where are these functions defined?</font></span>=
<span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-=
size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">In patc=
h 1 of 3 of this set.</span></div><div><span style=3D"font-size:12.8px"><br=
></span></div><div><div style=3D"font-size:12.8px"><div class=3D"m_-8009602=
092183844995gmail-im"><font color=3D"#741b47">&gt;&gt; +=C2=A0 =C2=A0 =C2=
=A0if (of_property_read_u32(dn, &quot;brcm,ipp&quot;, &amp;priv-&gt;ini.ipp=
))<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_property=
_read_u32(dn, &quot;ipp&quot;, &amp;priv-&gt;ini.ipp);<br>&gt;</font></div>=
</div><font color=3D"#741b47"><span style=3D"font-size:12.8px">&gt;Why do y=
ou have to invoke of_property_read_u32 twice here?</span><br style=3D"font-=
size:12.8px"><span class=3D"m_-8009602092183844995gmail-im" style=3D"font-s=
ize:12.8px">&gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (of_property_read_u32(dn, &quo=
t;brcm,ioc&quot;, &amp;priv-&gt;ini.ioc))<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u32(dn, &quot;ioc&quot;, &amp;=
priv-&gt;ini.ioc);<br>&gt;<br></span><span style=3D"font-size:12.8px">&gt;s=
ame here..</span></font><br style=3D"font-size:12.8px"><div style=3D"font-s=
ize:12.8px"><div class=3D"m_-8009602092183844995gmail-adm"><div id=3D"m_-80=
09602092183844995gmail-q_15c82cff47efb24c_21" class=3D"m_-80096020921838449=
95gmail-ajR m_-8009602092183844995gmail-h4"></div></div></div></div><div><s=
pan style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-si=
ze:12.8px">We have older versions of the device tree node passed in by the =
boot loader that have &quot;ipp&quot; and &quot;ioc&quot; instead of &quot;=
brcm,ipp&quot; and &quot;brcm,ioc&quot;</span></div><div><span style=3D"fon=
t-size:12.8px"><br></span></div><div><div style=3D"font-size:12.8px"><div c=
lass=3D"m_-8009602092183844995gmail-im"><font color=3D"#741b47">&gt;&gt; +=
=C2=A0 =C2=A0 =C2=A0if (priv-&gt;has_eohci) {<br>&gt;&gt; +=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gphy =3D devm_phy_create(dev, NULL, &amp;=
brcm_usb_phy_ops);<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (IS_ERR(gphy)) {<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;failed to creat=
e EHCI/OHCI PHY\n&quot;);<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(gphy);<br>&gt;&gt; =
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;phys[BRCM_USB_PHY_2_0].<wbr>=
phy =3D gphy;<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
priv-&gt;phys[BRCM_USB_PHY_2_0].<wbr>id =3D BRCM_USB_PHY_2_0;<br>&gt;&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy_set_drvdata(gphy, &amp;=
priv-&gt;phys[BRCM_USB_PHY_2_0])<wbr>;<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<b=
r>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (priv-&gt;has_xhci) {<br>&gt;&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gphy =3D devm_phy_create(dev, =
NULL, &amp;brcm_usb_phy_ops);<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (IS_ERR(gphy)) {<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fail=
ed to create XHCI PHY\n&quot;);<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(gphy);<br>&g=
t;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;</font></d=
iv></div><span style=3D"font-size:12.8px"><font color=3D"#741b47">&gt;devm_=
phy_create() can be moved outside the if conditions?</font></span></div><di=
v><br></div><div>These are possibly 2 different phys.</div><div><br style=
=3D"font-size:12.8px"><font color=3D"#741b47"><span class=3D"m_-80096020921=
83844995gmail-im" style=3D"font-size:12.8px">&gt;&gt; +=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;phys[BRCM_USB_PHY_3_0].<wbr>phy =3D gp=
hy;<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;p=
hys[BRCM_USB_PHY_3_0].<wbr>id =3D BRCM_USB_PHY_3_0;<br>&gt;&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy_set_drvdata(gphy, &amp;priv-&gt;p=
hys[BRCM_USB_PHY_3_0])<wbr>;<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt;=
 +=C2=A0 =C2=A0 =C2=A0mutex_init(&amp;priv-&gt;mutex);<br>&gt;&gt; +=C2=A0 =
=C2=A0 =C2=A0phy_provider =3D devm_of_phy_provider_register(<wbr>dev,<br>&g=
t;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0brcm_usb_phy_xlate);<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(=
phy_provider))<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return PTR_ERR(phy_provider);<br>&gt;<br></span><span style=3D"font-size=
:12.8px">&gt;phy_provider_register can be done at the end of probe.</span><=
/font><span style=3D"font-size:12.8px"><br></span></div><div><span style=3D=
"font-size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">A=
greed.</span></div><div><span style=3D"font-size:12.8px"><br></span></div><=
div><div style=3D"font-size:12.8px"><div class=3D"m_-8009602092183844995gma=
il-im"><font color=3D"#741b47">&gt;&gt; +#ifdef CONFIG_PM_SLEEP<br>&gt;&gt;=
 +static int brcm_usb_phy_suspend(struct device *dev)<br>&gt;&gt; +{<br>&gt=
;&gt; +=C2=A0 =C2=A0 =C2=A0struct brcm_usb_phy_data *priv =3D dev_get_drvda=
ta(dev);<br>&gt;&gt; +<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (priv-&gt;init_c=
ount) {<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_di=
sable(priv-&gt;usb_20_clk)<wbr>;<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0clk_disable(priv-&gt;usb_30_clk)<wbr>;<br>&gt;&gt; +=C2=
=A0 =C2=A0 =C2=A0}<br>&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>&gt;</font=
></div></div><font color=3D"#741b47"><span style=3D"font-size:12.8px">&gt;H=
ow do you make sure phy is suspended after it&#39;s consumer? We shouldn&#3=
9;t be</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px=
">&gt;suspending phy when the consumer is using it.</span></font><span styl=
e=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-size:12.8p=
x"><br></span></div><div><span style=3D"font-size:12.8px">The suspend/resum=
e order is based on the device-tree node order and we make sure that the ph=
y dt node comes before the USB nodes.</span></div><div><span style=3D"font-=
size:12.8px">Doing it this way also allow me to use some of the generic pla=
tform drivers for XHCI, EHCI and OHCI which don&#39;t do phy calls on suspe=
nd and resume.</span></div><div><span style=3D"font-size:12.8px"><font colo=
r=3D"#741b47"><br></font></span></div><div><font color=3D"#741b47"><span st=
yle=3D"font-size:12.8px">&gt;</span><span style=3D"font-size:12.8px">Thanks=
</span></font></div><div><br></div><div>Thanks</div></div>

--94eb2c0bab66cf332305517a6a9d--
