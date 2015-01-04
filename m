Return-Path: <sneeker.yeh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20141229161433.GE29379@saruman>
References: <1418695828-605-1-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
	<1418695828-605-3-git-send-email-Sneeker.Yeh@tw.fujitsu.com>
	<20141222155936.GB12815@saruman>
	<CAJ1gpc0uniw3F3O9nxTLHp9M2boxrOACYDB=fgruhLOLdqg9yA@mail.gmail.com>
	<20141229161433.GE29379@saruman>
Date: Sun, 4 Jan 2015 21:16:01 +0800
Message-ID: <CAJ1gpc1yRmuxQVttC5NnKF8PKLeH5PPDkuXU-fwGNcQKRj50Ww@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: dwc3: add Fujitsu Specific Glue layer
From: Sneeker Yeh <sneeker.yeh@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c152041cf58e050bd360fc
To: Felipe Balbi <balbi@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Grant Likely <grant.likely@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Arnd Bergmann <arnd@arndb.de>, Paul Bolle <pebolle@tiscali.nl>, Hans de Goede <hdegoede@redhat.com>, Thomas Pugliese <thomas.pugliese@gmail.com>, David Mosberger <davidm@egauge.net>, Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, Andy Green <andy.green@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Sneeker Yeh <Sneeker.Yeh@tw.fujitsu.com>
List-ID: <devicetree@vger.kernel.org>

--001a11c152041cf58e050bd360fc
Content-Type: text/plain; charset=UTF-8

HI Balbi,

Thanks for your suggestion,

2014-12-30 0:14 GMT+08:00 Felipe Balbi <balbi@ti.com>:

> Hi,
>
> On Mon, Dec 29, 2014 at 01:52:04AM +0800, Sneeker Yeh wrote:
> > Hi,
> >
> > 2014-12-22 23:59 GMT+08:00 Felipe Balbi <balbi@ti.com>:
> >
> > > Hi,
> > >
> > > On Tue, Dec 16, 2014 at 10:10:27AM +0800, Sneeker Yeh wrote:
> > > > This patch adds support for Synopsis DesignWare USB3 IP Core found
> > > > on Fujitsu Socs.
> > > >
> > > > Signed-off-by: Sneeker Yeh <Sneeker.Yeh@tw.fujitsu.com>
> > > > ---
> > > >  .../devicetree/bindings/usb/fujitsu-dwc3.txt       |   25 +++
> > > >  drivers/usb/dwc3/Kconfig                           |   11 ++
> > > >  drivers/usb/dwc3/Makefile                          |    1 +
> > > >  drivers/usb/dwc3/dwc3-mb86s70.c                    |  194
> > > ++++++++++++++++++++
> > > >  4 files changed, 231 insertions(+)
> > > >  create mode 100644
> > > Documentation/devicetree/bindings/usb/fujitsu-dwc3.txt
> > > >  create mode 100644 drivers/usb/dwc3/dwc3-mb86s70.c
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/usb/fujitsu-dwc3.txt
> > > b/Documentation/devicetree/bindings/usb/fujitsu-dwc3.txt
> > > > new file mode 100644
> > > > index 0000000..df77f91
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/usb/fujitsu-dwc3.txt
> > > > @@ -0,0 +1,25 @@
> > > > +FUJITSU GLUE COMPONENTS
> > > > +
> > > > +MB86S7x DWC3 GLUE
> > > > + - compatible : Should be "fujitsu,mb86s70-dwc3"
> > > > + - clocks: from common clock binding, handle to usb clock.
> > > > + - clock-names: from common clock binding.
> > > > + - #address-cells, #size-cells : Must be present if the device has
> > > sub-nodes
> > > > + - ranges: the child address space are mapped 1:1 onto the parent
> > > address space
> > > > + - #stream-id-cells : handle to use "arm,mmu-400" ARM IOMMU driver
> > > > +
> > > > +Sub-nodes:
> > > > +The dwc3 core should be added as subnode to MB86S7x dwc3 glue.
> > > > +- dwc3 :
> > > > +   The binding details of dwc3 can be found in:
> > > > +   Documentation/devicetree/bindings/usb/dwc3.txt
> > > > +
> > > > +usb3host: mb86s70_usb3host {
> > > > +     compatible = "fujitsu,mb86s70-dwc3";
> > > > +     clocks = <&clk_alw_1_1>;
> > > > +     clock-names = "bus_clk";
> > > > +     #address-cells = <2>;
> > > > +     #size-cells = <1>;
> > > > +     ranges;
> > > > +     #stream-id-cells = <0>;
> > > > +};
> > > > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > > > index 58b5b2c..3390d42 100644
> > > > --- a/drivers/usb/dwc3/Kconfig
> > > > +++ b/drivers/usb/dwc3/Kconfig
> > > > @@ -61,6 +61,17 @@ config USB_DWC3_EXYNOS
> > > >         Recent Exynos5 SoCs ship with one DesignWare Core USB3 IP
> inside,
> > > >         say 'Y' or 'M' if you have one such device.
> > > >
> > > > +config USB_DWC3_MB86S70
> > > > +     tristate "MB86S70 Designware USB3 Platform code"
> > > > +     default USB_DWC3
> > > > +     help
> > > > +       MB86S7X SOC ship with DesignWare Core USB3 IP inside,
> > > > +       this implementation also integrated Fujitsu USB PHY inside
> > > > +       this Core USB3 IP.
> > > > +
> > > > +       say 'Y' or 'M' if you have one such device.
> > > > +
> > > > +
> > > >  config USB_DWC3_PCI
> > > >       tristate "PCIe-based Platforms"
> > > >       depends on PCI
> > > > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > > > index bb34fbc..05d1de2 100644
> > > > --- a/drivers/usb/dwc3/Makefile
> > > > +++ b/drivers/usb/dwc3/Makefile
> > > > @@ -38,3 +38,4 @@ obj-$(CONFIG_USB_DWC3_PCI)          += dwc3-pci.o
> > > >  obj-$(CONFIG_USB_DWC3_KEYSTONE)              += dwc3-keystone.o
> > > >  obj-$(CONFIG_USB_DWC3_QCOM)          += dwc3-qcom.o
> > > >  obj-$(CONFIG_USB_DWC3_ST)            += dwc3-st.o
> > > > +obj-$(CONFIG_USB_DWC3_MB86S70)               += dwc3-mb86s70.o
> > > > diff --git a/drivers/usb/dwc3/dwc3-mb86s70.c
> > > b/drivers/usb/dwc3/dwc3-mb86s70.c
> > > > new file mode 100644
> > > > index 0000000..241c5bd
> > > > --- /dev/null
> > > > +++ b/drivers/usb/dwc3/dwc3-mb86s70.c
> > > > @@ -0,0 +1,194 @@
> > > > +/**
> > > > + * dwc3-mb86s70.c - Fujitsu mb86s70 DWC3 Specific Glue layer
> > > > + *
> > > > + * Copyright (c) 2013 - 2014 FUJITSU SEMICONDUCTOR LIMITED
> > > > + *           http://jp.fujitsu.com/group/fsl
> > > > + *
> > > > + * Author: Alice Chan <Alice.Chan@tw.fujitsu.com>
> > > > + * based on dwc3-exynos.c
> > > > + *
> > > > + * This program is free software; you can redistribute it and/or
> modify
> > > > + * it under the terms of the GNU General Public License as
> published by
> > > > + * the Free Software Foundation; either version 2 of the License, or
> > > > + * (at your option) any later version.
> > > > + */
> > > > +
> > > > +#include <linux/module.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/of_platform.h>
> > > > +#include <linux/pm_runtime.h>
> > > > +#include <linux/clk.h>
> > > > +
> > > > +struct dwc3_mb86s70 {
> > > > +     struct device   *dev;
> > > > +     struct clk              **clk_table;
> > >
> > > please align these.
> >
> >
> > okay.
> >
> >
> > >
> >
> >
> > > > +};
> > > > +
> > > > +/* return 0 means successful */
> > >
> > > this comment is unnecessary :-)
> > >
> >
> > okay
> >
> >
> > >
> > > > +static int dwc3_mb86s70_clk_control(struct device *dev, bool on)
> > > > +{
> > > > +     int ret, i;
> > > > +     struct clk *clk;
> > > > +
> > > > +     if (!on)
> > > > +             goto clock_off;
> > > > +
> > > > +     for (i = 0;; i++) {
> > > > +             clk = of_clk_get(dev->of_node, i);
> > >
> > > you could count the number of properties first, then allocate clk_table
> > > to the exact size.
> > >
> >
> > okay, thanks.
> >
> >
> > >
> > > > +             if (IS_ERR(clk))
> > > > +                     break;
> > > > +
> > > > +             ret = clk_prepare_enable(clk);
> > > > +             if (ret) {
> > > > +                     dev_err(dev, "failed to enable clock[%d]\n",
> i);
> > > > +                     goto clock_off;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +
> > > > +clock_off:
> > > > +     for (i = 0;; i++) {
> > > > +             clk = of_clk_get(dev->of_node, i);
> > > > +             if (IS_ERR(clk))
> > > > +                     break;
> > > > +
> > > > +             clk_disable_unprepare(clk);
> > > > +     }
> > > > +
> > > > +     return on;
> > > > +}
> > > > +
> > > > +static int dwc3_mb86s70_remove_child(struct device *dev, void
> *unused)
> > > > +{
> > > > +     struct platform_device *pdev = to_platform_device(dev);
> > > > +
> > > > +     of_device_unregister(pdev);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static u64 dwc3_mb86s70_dma_mask = DMA_BIT_MASK(32);
> > >
> > > why ? Use dma_coerce_mask_and_coherent().
> > >
> >
> > okay.
> >
> >
> > >
> > > > +
> > > > +static int dwc3_mb86s70_probe(struct platform_device *pdev)
> > > > +{
> > > > +     struct dwc3_mb86s70     *mb86s70;
> > > > +     struct device           *dev = &pdev->dev;
> > > > +     struct device_node      *node = dev->of_node;
> > > > +     int                     ret;
> > > > +
> > > > +     mb86s70 = devm_kzalloc(dev, sizeof(*mb86s70), GFP_KERNEL);
> > > > +     if (!mb86s70) {
> > > > +             ret = -ENOMEM;
> > > > +             goto err;
> > > > +     }
> > > > +
> > > > +     dev->dma_mask = &dwc3_mb86s70_dma_mask;
> > > > +
> > > > +     platform_set_drvdata(pdev, mb86s70);
> > > > +
> > > > +     mb86s70->dev = dev;
> > > > +
> > > > +     /* resume driver for clock, power */
> > > > +     pm_runtime_enable(&pdev->dev);
> > > > +     ret = pm_runtime_get_sync(&pdev->dev);
> > >
> > > here's a slightly better way (add error checking where necessary):
> > >
> > >         dwc3_mb86s70_clk_control(dev, true);
> > >         pm_runtime_set_active(dev);
> > >         pm_runtime_enable(dev);
> > >         pm_runtime_get(dev);
> > >
> > >
> > okay, thanks,
> > these seems much better and more correct.
> >
> >
> >
> > >
> > > > +     if (ret < 0) {
> > > > +             dev_err(&pdev->dev, "get_sync failed with err %d\n",
> ret);
> > > > +             goto err;
> > >
> > > if get_sync() fails, you still need to call pm_runtime_put_sync(); In
> > > this case, you also need to call pm_runtime_disable();
> > >
> >
> > okay, thanks.
> >
> >
> > >
> > > > +     }
> > > > +
> > > > +     if (node) {
> > > > +             ret = of_platform_populate(node, NULL, NULL, dev);
> > > > +             if (!ret)
> > > > +                     return 0;
> > > > +             dev_err(dev, "failed to add dwc3 core\n");
> > > > +     }
> > > > +     dev_err(dev, "no device node, failed to add dwc3 core\n");
> > > > +     ret = -ENODEV;
> > > > +
> > > > +err:
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int dwc3_mb86s70_remove(struct platform_device *pdev)
> > > > +{
> > > > +     device_for_each_child(&pdev->dev, NULL,
> dwc3_mb86s70_remove_child);
> > > > +
> > > > +     pm_runtime_put_sync(&pdev->dev);
> > > > +     pm_runtime_disable(&pdev->dev);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static const struct of_device_id mb86s70_dwc3_match[] = {
> > > > +     { .compatible = "fujitsu,mb86s70-dwc3" },
> > > > +     {},
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, mb86s70_dwc3_match);
> > > > +
> > > > +#ifdef CONFIG_PM
> > > > +#ifdef CONFIG_PM_RUNTIME
> > > > +static int dwc3_mb86s70_runtime_suspend(struct device *dev)
> > > > +{
> > > > +     dwc3_mb86s70_clk_control(dev, false);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int  dwc3_mb86s70_runtime_resume(struct device *dev)
> > > > +{
> > > > +     dwc3_mb86s70_clk_control(dev, true);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +#endif /* CONFIG_PM_RUNTIME */
> > > > +static int dwc3_mb86s70_suspend(struct device *dev)
> > > > +{
> > > > +     if (pm_runtime_status_suspended(dev))
> > > > +             return 0;
> > > > +
> > > > +     return dwc3_mb86s70_runtime_suspend(dev);
> > >
> > > ok, this is a bit confusing and, in fact, wrong. You're not dealing
> with
> > > wakeups (which are mandatory on runtime_pm and option on system sleep).
> > >
> > > It's okay to have a common function called by both runtime_pm and
> > > system_sleep methods, but calling your runtime_pm handler is a bit odd.
> > >
> >
> > hm, sorry I might confuse people here.
> > I'll change this to what you suggested.
> >
> >
> > >
> > > last but not least, I need to see results of this running on top of
> > > v3.19-rc1. Are you using both host and peripheral modes or only one
> mode
> > > for now ?
> > >
> >
> > The dwc3 IP we adapted is host-only, and we run this platform glue driver
> > in v3.19-rc1 for now.
> > bellow log is about suspend and resume successfully, and dwc3 still
> works.
> >
> > root@linaro-nano:~# echo mem > /sys/power/state
> > [   56.713281] mb86s70-dwc3 mb86s70_usb3host1.5: dwc3_mb86s70_suspend()
> is
> > started.
> > [   56.720721] mb86s70-dwc3 mb86s70_usb3host1.5:
> > dwc3_mb86s70_runtime_suspend() is started.
> > [   56.729419] mb86s70-dwc3 mb86s70_usb3host1.5:
> > dwc3_mb86s70_runtime_suspend() is ended.
> > [   56.737363] mb86s70-dwc3 mb86s70_usb3host1.5: dwc3_mb86s70_suspend()
> is
> > ended.
> > [   56.744604] mb86s70-dwc3 mb86s70_usb3host0.4: dwc3_mb86s70_suspend()
> is
> > started.
> > [   56.752022] mb86s70-dwc3 mb86s70_usb3host0.4:
> > dwc3_mb86s70_runtime_suspend() is started.
> > [   56.760700] mb86s70-dwc3 mb86s70_usb3host0.4:
> > dwc3_mb86s70_runtime_suspend() is ended.
> > [   56.768639] mb86s70-dwc3 mb86s70_usb3host0.4: dwc3_mb86s70_suspend()
> is
> > ended.
> > [   57.107139] SUSPEND
> >
> > [   74.564963] mmc0: execute_tuning --
> > [   74.877776] mb86s70-dwc3 mb86s70_usb3host0.4: dwc3_mb86s70_resume() is
> > started.
> > [   74.885126] mb86s70-dwc3 mb86s70_usb3host0.4:
> > dwc3_mb86s70_runtime_resume() is started.
> > [   74.893749] mb86s70-dwc3 mb86s70_usb3host0.4:
> > dwc3_mb86s70_runtime_resume() is ended.
> > [   74.901606] mb86s70-dwc3 mb86s70_usb3host0.4: dwc3_mb86s70_resume() is
> > ended.
> > [   74.908766] mb86s70-dwc3 mb86s70_usb3host1.5: dwc3_mb86s70_resume() is
> > started.
> > [   74.916086] mb86s70-dwc3 mb86s70_usb3host1.5:
> > dwc3_mb86s70_runtime_resume() is started.
> > [   74.924660] mb86s70-dwc3 mb86s70_usb3host1.5:
> > dwc3_mb86s70_runtime_resume() is ended.
> > [   74.932513] mb86s70-dwc3 mb86s70_usb3host1.5: dwc3_mb86s70_resume() is
> > ended.
> > root@linaro-nano:~#
> >
> > But I realize something might confuse people, and even is wrong, through
> > your comment.
> > So I guess I should align these to a more clear form like dwc3-exynos.c :
> >
> > static int dwc3_exynos_suspend(struct device *dev)
> > {
> > struct dwc3_exynos *exynos = dev_get_drvdata(dev);
> >
> > clk_disable(exynos->clk);
> >
> > return 0;
> > }
> >
> > static int dwc3_exynos_resume(struct device *dev)
> > {
> > struct dwc3_exynos *exynos = dev_get_drvdata(dev);
> >
> > clk_enable(exynos->clk);
> >
> > /* runtime set active to reflect active state. */
> > pm_runtime_disable(dev);
> > pm_runtime_set_active(dev);
> > pm_runtime_enable(dev);
> >
> > return 0;
> > }
> >
> > Would it been better than how I do suspend/resume here?
>
> sure, that would be better :-)
>
> > however recently I got some thought inspired by Arnd and the commit
> > 5f872175c867a839e2feeecfa59e3db38c88b561
>
> where is that commit ?
>
> $ git show 5f872175c867a839e2feeecfa59e3db38c88b561
> fatal: bad object 5f872175c867a839e2feeecfa59e3db38c88b561
>
> I have here linus and linux-next just fetched before trying to git show.
>

sorry, it should be this one:
a4aeb2117571292f4e002c54b3f91e138722bf7a


>
> > For imitating that in my experiment recently, i only need to add clock
> > on/off in dwc3 core.
>
> Let's wait a little bit more before doing that. We have a ton of users
> which don't have controllable clocks and, frankly speaking, if we hide
> all clock control on glue layer (which is a parent device of core) it
> will still work just fine because of the ordering of children vs parent
> that device core gives you for free :-)
>

hm, I see.


>
> > Then dwc3 core won't be always created via sub node in platform glue
> node,
> > and vendors like us can just drop platform glue which don't have any
> > specific platform code to wrap dwc3 core, and just directly use dwc3 core
> > via device tree.
>
> If your core is really just xhci, why don't just use xhci-plat.c
>

I've tried using xhci-plat.c, but our controller won't work today in
3.19-rc1.
Seems I still need the dwc3 initialization code.


> directly ? You don't need dwc3 at all. In any case, I refrain from
> allowing people to use dwc3.ko directly because that has bitten me in
> the past with MUSB, so sorry but I'll always force people to use the
> glue layer as that helps me keep dwc3 clean of platform-specific
> details.
>
> > Of course here dwc3 core won't process clock if he got null one, so this
> > won't affect other vendor's platform which only pass clock phandle to
> their
> > dwc3 platform glue driver.
>
> right
>
> > Just wondering if it's better to write a platform glue only did clock
> > on/off, or to do the same improvement people ever did for
> > ehci-platform driver and just drop this platform glue driver?
>
> I'll always the sour taste in my mouth due to MUSB. The thing is a
> complete mess of platform-specific hacks all over the place.
>
>
Super thanks for sharing this, for me it's quite an honor to know that
story behond.
and I'll take these suggestion here to revise our platform glue layer.

Much appreciate,
Sneeker


> > Hope I didn't reply too late, or make any impolite move here,
>
> merge window just closed, we've got time.
>
> > Super thanks for every comment you made here.
>
> hey, no problem.
>
> --
> balbi
>

--001a11c152041cf58e050bd360fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>HI Balbi,<br><br></div>Thanks for your suggestion, <b=
r><div><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2014-=
12-30 0:14 GMT+08:00 Felipe Balbi <span dir=3D"ltr">&lt;<a href=3D"mailto:b=
albi@ti.com" target=3D"_blank">balbi@ti.com</a>&gt;</span>:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hi,<br>
<div><div class=3D"h5"><br>
On Mon, Dec 29, 2014 at 01:52:04AM +0800, Sneeker Yeh wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; 2014-12-22 23:59 GMT+08:00 Felipe Balbi &lt;<a href=3D"mailto:balbi@ti=
.com">balbi@ti.com</a>&gt;:<br>
&gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Dec 16, 2014 at 10:10:27AM +0800, Sneeker Yeh wrote:<br>
&gt; &gt; &gt; This patch adds support for Synopsis DesignWare USB3 IP Core=
 found<br>
&gt; &gt; &gt; on Fujitsu Socs.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Sneeker Yeh &lt;<a href=3D"mailto:Sneeker.Yeh=
@tw.fujitsu.com">Sneeker.Yeh@tw.fujitsu.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../devicetree/bindings/usb/fujitsu-dwc3.txt=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A025 +++<br>
&gt; &gt; &gt;=C2=A0 drivers/usb/dwc3/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A011 ++<br>
&gt; &gt; &gt;=C2=A0 drivers/usb/dwc3/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 1 +<br>
&gt; &gt; &gt;=C2=A0 drivers/usb/dwc3/dwc3-mb86s70.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 194<br>
&gt; &gt; ++++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 4 files changed, 231 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; Documentation/devicetree/bindings/usb/fujitsu-dwc3.txt<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 drivers/usb/dwc3/dwc3-mb86s70.c<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/Documentation/devicetree/bindings/usb/fujitsu-d=
wc3.txt<br>
&gt; &gt; b/Documentation/devicetree/bindings/usb/fujitsu-dwc3.txt<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..df77f91<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/Documentation/devicetree/bindings/usb/fujitsu-dwc3.txt=
<br>
&gt; &gt; &gt; @@ -0,0 +1,25 @@<br>
&gt; &gt; &gt; +FUJITSU GLUE COMPONENTS<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +MB86S7x DWC3 GLUE<br>
&gt; &gt; &gt; + - compatible : Should be &quot;fujitsu,mb86s70-dwc3&quot;<=
br>
&gt; &gt; &gt; + - clocks: from common clock binding, handle to usb clock.<=
br>
&gt; &gt; &gt; + - clock-names: from common clock binding.<br>
&gt; &gt; &gt; + - #address-cells, #size-cells : Must be present if the dev=
ice has<br>
&gt; &gt; sub-nodes<br>
&gt; &gt; &gt; + - ranges: the child address space are mapped 1:1 onto the =
parent<br>
&gt; &gt; address space<br>
&gt; &gt; &gt; + - #stream-id-cells : handle to use &quot;arm,mmu-400&quot;=
 ARM IOMMU driver<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Sub-nodes:<br>
&gt; &gt; &gt; +The dwc3 core should be added as subnode to MB86S7x dwc3 gl=
ue.<br>
&gt; &gt; &gt; +- dwc3 :<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0The binding details of dwc3 can be found in:<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0Documentation/devicetree/bindings/usb/dwc3.txt=
<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +usb3host: mb86s70_usb3host {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;fujitsu,mb86s70-dw=
c3&quot;;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;clk_alw_1_1&gt;;<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0clock-names =3D &quot;bus_clk&quot;;<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;2&gt;;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;1&gt;;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ranges;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0#stream-id-cells =3D &lt;0&gt;;<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kco=
nfig<br>
&gt; &gt; &gt; index 58b5b2c..3390d42 100644<br>
&gt; &gt; &gt; --- a/drivers/usb/dwc3/Kconfig<br>
&gt; &gt; &gt; +++ b/drivers/usb/dwc3/Kconfig<br>
&gt; &gt; &gt; @@ -61,6 +61,17 @@ config USB_DWC3_EXYNOS<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Recent Exynos5 SoCs ship wi=
th one DesignWare Core USB3 IP inside,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0say &#39;Y&#39; or &#39;M&#=
39; if you have one such device.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +config USB_DWC3_MB86S70<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;MB86S70 Designware USB3 =
Platform code&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0default USB_DWC3<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MB86S7X SOC ship with DesignWare=
 Core USB3 IP inside,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0this implementation also integra=
ted Fujitsu USB PHY inside<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0this Core USB3 IP.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0say &#39;Y&#39; or &#39;M&#39; i=
f you have one such device.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt;=C2=A0 config USB_DWC3_PCI<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;PCIe-based Platform=
s&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on PCI<br>
&gt; &gt; &gt; diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Ma=
kefile<br>
&gt; &gt; &gt; index bb34fbc..05d1de2 100644<br>
&gt; &gt; &gt; --- a/drivers/usb/dwc3/Makefile<br>
&gt; &gt; &gt; +++ b/drivers/usb/dwc3/Makefile<br>
&gt; &gt; &gt; @@ -38,3 +38,4 @@ obj-$(CONFIG_USB_DWC3_PCI)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 +=3D dwc3-pci.o<br>
&gt; &gt; &gt;=C2=A0 obj-$(CONFIG_USB_DWC3_KEYSTONE)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D dwc3-keystone.o<br>
&gt; &gt; &gt;=C2=A0 obj-$(CONFIG_USB_DWC3_QCOM)=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 +=3D dwc3-qcom.o<br>
&gt; &gt; &gt;=C2=A0 obj-$(CONFIG_USB_DWC3_ST)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 +=3D dwc3-st.o<br>
&gt; &gt; &gt; +obj-$(CONFIG_USB_DWC3_MB86S70)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D dwc3-mb86s70.o<br>
&gt; &gt; &gt; diff --git a/drivers/usb/dwc3/dwc3-mb86s70.c<br>
&gt; &gt; b/drivers/usb/dwc3/dwc3-mb86s70.c<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..241c5bd<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/drivers/usb/dwc3/dwc3-mb86s70.c<br>
&gt; &gt; &gt; @@ -0,0 +1,194 @@<br>
&gt; &gt; &gt; +/**<br>
&gt; &gt; &gt; + * dwc3-mb86s70.c - Fujitsu mb86s70 DWC3 Specific Glue laye=
r<br>
&gt; &gt; &gt; + *<br>
&gt; &gt; &gt; + * Copyright (c) 2013 - 2014 FUJITSU SEMICONDUCTOR LIMITED<=
br>
&gt; &gt; &gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http:=
//jp.fujitsu.com/group/fsl" target=3D"_blank">http://jp.fujitsu.com/group/f=
sl</a><br>
&gt; &gt; &gt; + *<br>
&gt; &gt; &gt; + * Author: Alice Chan &lt;<a href=3D"mailto:Alice.Chan@tw.f=
ujitsu.com">Alice.Chan@tw.fujitsu.com</a>&gt;<br>
&gt; &gt; &gt; + * based on dwc3-exynos.c<br>
&gt; &gt; &gt; + *<br>
&gt; &gt; &gt; + * This program is free software; you can redistribute it a=
nd/or modify<br>
&gt; &gt; &gt; + * it under the terms of the GNU General Public License as =
published by<br>
&gt; &gt; &gt; + * the Free Software Foundation; either version 2 of the Li=
cense, or<br>
&gt; &gt; &gt; + * (at your option) any later version.<br>
&gt; &gt; &gt; + */<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#include &lt;linux/module.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/slab.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/dma-mapping.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/interrupt.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/of.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/of_platform.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/pm_runtime.h&gt;<br>
&gt; &gt; &gt; +#include &lt;linux/clk.h&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +struct dwc3_mb86s70 {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct device=C2=A0 =C2=A0*dev;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct clk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 **clk_table;<br>
&gt; &gt;<br>
&gt; &gt; please align these.<br>
&gt;<br>
&gt;<br>
&gt; okay.<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +/* return 0 means successful */<br>
&gt; &gt;<br>
&gt; &gt; this comment is unnecessary :-)<br>
&gt; &gt;<br>
&gt;<br>
&gt; okay<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; +static int dwc3_mb86s70_clk_control(struct device *dev, boo=
l on)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ret, i;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct clk *clk;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!on)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto clock_=
off;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0;; i++) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D of_=
clk_get(dev-&gt;of_node, i);<br>
&gt; &gt;<br>
&gt; &gt; you could count the number of properties first, then allocate clk=
_table<br>
&gt; &gt; to the exact size.<br>
&gt; &gt;<br>
&gt;<br>
&gt; okay, thanks.<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(=
clk))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk=
_prepare_enable(clk);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dev_err(dev, &quot;failed to enable clock[%d]\n&quot;, i);=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto clock_off;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +clock_off:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0;; i++) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk =3D of_=
clk_get(dev-&gt;of_node, i);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(=
clk))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable=
_unprepare(clk);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return on;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int dwc3_mb86s70_remove_child(struct device *dev, vo=
id *unused)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_pla=
tform_device(dev);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0of_device_unregister(pdev);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static u64 dwc3_mb86s70_dma_mask =3D DMA_BIT_MASK(32);<br>
&gt; &gt;<br>
&gt; &gt; why ? Use dma_coerce_mask_and_coherent().<br>
&gt; &gt;<br>
&gt;<br>
&gt; okay.<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int dwc3_mb86s70_probe(struct platform_device *pdev)=
<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct dwc3_mb86s70=C2=A0 =C2=A0 =C2=A0=
*mb86s70;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct device=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*dev =3D &amp;pdev-&gt;dev;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct device_node=C2=A0 =C2=A0 =C2=A0 =
*node =3D dev-&gt;of_node;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0mb86s70 =3D devm_kzalloc(dev, sizeof(*m=
b86s70), GFP_KERNEL);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!mb86s70) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EN=
OMEM;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0dev-&gt;dma_mask =3D &amp;dwc3_mb86s70_=
dma_mask;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, mb86s70);<br=
>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0mb86s70-&gt;dev =3D dev;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* resume driver for clock, power */<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_enable(&amp;pdev-&gt;dev);<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ret =3D pm_runtime_get_sync(&amp;pdev-&=
gt;dev);<br>
&gt; &gt;<br>
&gt; &gt; here&#39;s a slightly better way (add error checking where necess=
ary):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dwc3_mb86s70_clk_control(dev, tr=
ue);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_set_active(dev);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_enable(dev);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_get(dev);<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; okay, thanks,<br>
&gt; these seems much better and more correct.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&am=
p;pdev-&gt;dev, &quot;get_sync failed with err %d\n&quot;, ret);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<b=
r>
&gt; &gt;<br>
&gt; &gt; if get_sync() fails, you still need to call pm_runtime_put_sync()=
; In<br>
&gt; &gt; this case, you also need to call pm_runtime_disable();<br>
&gt; &gt;<br>
&gt;<br>
&gt; okay, thanks.<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (node) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_=
platform_populate(node, NULL, NULL, dev);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ret)<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev=
, &quot;failed to add dwc3 core\n&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;no device node, fail=
ed to add dwc3 core\n&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0ret =3D -ENODEV;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +err:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int dwc3_mb86s70_remove(struct platform_device *pdev=
)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0device_for_each_child(&amp;pdev-&gt;dev=
, NULL, dwc3_mb86s70_remove_child);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_put_sync(&amp;pdev-&gt;dev);=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0pm_runtime_disable(&amp;pdev-&gt;dev);<=
br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static const struct of_device_id mb86s70_dwc3_match[] =3D {=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;fujitsu,mb86s70=
-dwc3&quot; },<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0{},<br>
&gt; &gt; &gt; +};<br>
&gt; &gt; &gt; +MODULE_DEVICE_TABLE(of, mb86s70_dwc3_match);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#ifdef CONFIG_PM<br>
&gt; &gt; &gt; +#ifdef CONFIG_PM_RUNTIME<br>
&gt; &gt; &gt; +static int dwc3_mb86s70_runtime_suspend(struct device *dev)=
<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0dwc3_mb86s70_clk_control(dev, false);<b=
r>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +static int=C2=A0 dwc3_mb86s70_runtime_resume(struct device =
*dev)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0dwc3_mb86s70_clk_control(dev, true);<br=
>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +#endif /* CONFIG_PM_RUNTIME */<br>
&gt; &gt; &gt; +static int dwc3_mb86s70_suspend(struct device *dev)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (pm_runtime_status_suspended(dev))<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<b=
r>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0return dwc3_mb86s70_runtime_suspend(dev=
);<br>
&gt; &gt;<br>
&gt; &gt; ok, this is a bit confusing and, in fact, wrong. You&#39;re not d=
ealing with<br>
&gt; &gt; wakeups (which are mandatory on runtime_pm and option on system s=
leep).<br>
&gt; &gt;<br>
&gt; &gt; It&#39;s okay to have a common function called by both runtime_pm=
 and<br>
&gt; &gt; system_sleep methods, but calling your runtime_pm handler is a bi=
t odd.<br>
&gt; &gt;<br>
&gt;<br>
&gt; hm, sorry I might confuse people here.<br>
&gt; I&#39;ll change this to what you suggested.<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; last but not least, I need to see results of this running on top =
of<br>
&gt; &gt; v3.19-rc1. Are you using both host and peripheral modes or only o=
ne mode<br>
&gt; &gt; for now ?<br>
&gt; &gt;<br>
&gt;<br>
&gt; The dwc3 IP we adapted is host-only, and we run this platform glue dri=
ver<br>
&gt; in v3.19-rc1 for now.<br>
&gt; bellow log is about suspend and resume successfully, and dwc3 still wo=
rks.<br>
&gt;<br>
&gt; root@linaro-nano:~# echo mem &gt; /sys/power/state<br>
&gt; [=C2=A0 =C2=A056.713281] mb86s70-dwc3 mb86s70_usb3host1.5: dwc3_mb86s7=
0_suspend() is<br>
&gt; started.<br>
&gt; [=C2=A0 =C2=A056.720721] mb86s70-dwc3 mb86s70_usb3host1.5:<br>
&gt; dwc3_mb86s70_runtime_suspend() is started.<br>
&gt; [=C2=A0 =C2=A056.729419] mb86s70-dwc3 mb86s70_usb3host1.5:<br>
&gt; dwc3_mb86s70_runtime_suspend() is ended.<br>
&gt; [=C2=A0 =C2=A056.737363] mb86s70-dwc3 mb86s70_usb3host1.5: dwc3_mb86s7=
0_suspend() is<br>
&gt; ended.<br>
&gt; [=C2=A0 =C2=A056.744604] mb86s70-dwc3 mb86s70_usb3host0.4: dwc3_mb86s7=
0_suspend() is<br>
&gt; started.<br>
&gt; [=C2=A0 =C2=A056.752022] mb86s70-dwc3 mb86s70_usb3host0.4:<br>
&gt; dwc3_mb86s70_runtime_suspend() is started.<br>
&gt; [=C2=A0 =C2=A056.760700] mb86s70-dwc3 mb86s70_usb3host0.4:<br>
&gt; dwc3_mb86s70_runtime_suspend() is ended.<br>
&gt; [=C2=A0 =C2=A056.768639] mb86s70-dwc3 mb86s70_usb3host0.4: dwc3_mb86s7=
0_suspend() is<br>
&gt; ended.<br>
&gt; [=C2=A0 =C2=A057.107139] SUSPEND<br>
&gt;<br>
&gt; [=C2=A0 =C2=A074.564963] mmc0: execute_tuning --<br>
&gt; [=C2=A0 =C2=A074.877776] mb86s70-dwc3 mb86s70_usb3host0.4: dwc3_mb86s7=
0_resume() is<br>
&gt; started.<br>
&gt; [=C2=A0 =C2=A074.885126] mb86s70-dwc3 mb86s70_usb3host0.4:<br>
&gt; dwc3_mb86s70_runtime_resume() is started.<br>
&gt; [=C2=A0 =C2=A074.893749] mb86s70-dwc3 mb86s70_usb3host0.4:<br>
&gt; dwc3_mb86s70_runtime_resume() is ended.<br>
&gt; [=C2=A0 =C2=A074.901606] mb86s70-dwc3 mb86s70_usb3host0.4: dwc3_mb86s7=
0_resume() is<br>
&gt; ended.<br>
&gt; [=C2=A0 =C2=A074.908766] mb86s70-dwc3 mb86s70_usb3host1.5: dwc3_mb86s7=
0_resume() is<br>
&gt; started.<br>
&gt; [=C2=A0 =C2=A074.916086] mb86s70-dwc3 mb86s70_usb3host1.5:<br>
&gt; dwc3_mb86s70_runtime_resume() is started.<br>
&gt; [=C2=A0 =C2=A074.924660] mb86s70-dwc3 mb86s70_usb3host1.5:<br>
&gt; dwc3_mb86s70_runtime_resume() is ended.<br>
&gt; [=C2=A0 =C2=A074.932513] mb86s70-dwc3 mb86s70_usb3host1.5: dwc3_mb86s7=
0_resume() is<br>
&gt; ended.<br>
&gt; root@linaro-nano:~#<br>
&gt;<br>
&gt; But I realize something might confuse people, and even is wrong, throu=
gh<br>
&gt; your comment.<br>
&gt; So I guess I should align these to a more clear form like dwc3-exynos.=
c :<br>
&gt;<br>
&gt; static int dwc3_exynos_suspend(struct device *dev)<br>
&gt; {<br>
&gt; struct dwc3_exynos *exynos =3D dev_get_drvdata(dev);<br>
&gt;<br>
&gt; clk_disable(exynos-&gt;clk);<br>
&gt;<br>
&gt; return 0;<br>
&gt; }<br>
&gt;<br>
&gt; static int dwc3_exynos_resume(struct device *dev)<br>
&gt; {<br>
&gt; struct dwc3_exynos *exynos =3D dev_get_drvdata(dev);<br>
&gt;<br>
&gt; clk_enable(exynos-&gt;clk);<br>
&gt;<br>
&gt; /* runtime set active to reflect active state. */<br>
&gt; pm_runtime_disable(dev);<br>
&gt; pm_runtime_set_active(dev);<br>
&gt; pm_runtime_enable(dev);<br>
&gt;<br>
&gt; return 0;<br>
&gt; }<br>
&gt;<br>
&gt; Would it been better than how I do suspend/resume here?<br>
<br>
</div></div>sure, that would be better :-)<br>
<span class=3D""><br>
&gt; however recently I got some thought inspired by Arnd and the commit<br=
>
&gt; 5f872175c867a839e2feeecfa59e3db38c88b561<br>
<br>
</span>where is that commit ?<br>
<br>
$ git show 5f872175c867a839e2feeecfa59e3db38c88b561<br>
fatal: bad object 5f872175c867a839e2feeecfa59e3db38c88b561<br>
<br>
I have here linus and linux-next just fetched before trying to git show.<br=
></blockquote><div><br></div><div>sorry, it should be this one:<br>a4aeb211=
7571292f4e002c54b3f91e138722bf7a<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<span class=3D""><br>
&gt; For imitating that in my experiment recently, i only need to add clock=
<br>
&gt; on/off in dwc3 core.<br>
<br>
</span>Let&#39;s wait a little bit more before doing that. We have a ton of=
 users<br>
which don&#39;t have controllable clocks and, frankly speaking, if we hide<=
br>
all clock control on glue layer (which is a parent device of core) it<br>
will still work just fine because of the ordering of children vs parent<br>
that device core gives you for free :-)<br></blockquote><div><br></div><div=
>hm, I see.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<span class=3D""><br>
&gt; Then dwc3 core won&#39;t be always created via sub node in platform gl=
ue node,<br>
&gt; and vendors like us can just drop platform glue which don&#39;t have a=
ny<br>
&gt; specific platform code to wrap dwc3 core, and just directly use dwc3 c=
ore<br>
&gt; via device tree.<br>
<br>
</span>If your core is really just xhci, why don&#39;t just use xhci-plat.c=
<br></blockquote><div><br></div><div>I&#39;ve tried using xhci-plat.c, but =
our controller won&#39;t work today in 3.19-rc1.<br></div><div>Seems I stil=
l need the dwc3 initialization code.<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
directly ? You don&#39;t need dwc3 at all. In any case, I refrain from<br>
allowing people to use dwc3.ko directly because that has bitten me in<br>
the past with MUSB, so sorry but I&#39;ll always force people to use the<br=
>
glue layer as that helps me keep dwc3 clean of platform-specific<br>
details.<br>
<span class=3D""><br>
&gt; Of course here dwc3 core won&#39;t process clock if he got null one, s=
o this<br>
&gt; won&#39;t affect other vendor&#39;s platform which only pass clock pha=
ndle to their<br>
&gt; dwc3 platform glue driver.<br>
<br>
</span>right<br>
<span class=3D""><br>
&gt; Just wondering if it&#39;s better to write a platform glue only did cl=
ock<br>
&gt; on/off, or to do the same improvement people ever did for<br>
&gt; ehci-platform driver and just drop this platform glue driver?<br>
<br>
</span>I&#39;ll always the sour taste in my mouth due to MUSB. The thing is=
 a<br>
complete mess of platform-specific hacks all over the place.<br>
<span class=3D""><br></span></blockquote><div><br></div><div>Super thanks f=
or sharing this, for me it&#39;s quite an honor to know that story behond.<=
br></div><div>and I&#39;ll take these suggestion here to revise our platfor=
m glue layer.<br><br></div><div>Much appreciate,<br>Sneeker<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"">
&gt; Hope I didn&#39;t reply too late, or make any impolite move here,<br>
<br>
</span>merge window just closed, we&#39;ve got time.<br>
<span class=3D""><br>
&gt; Super thanks for every comment you made here.<br>
<br>
</span>hey, no problem.<br>
<span class=3D""><font color=3D"#888888"><br>
--<br>
balbi<br>
</font></span></blockquote></div><br></div></div></div></div>

--001a11c152041cf58e050bd360fc--
