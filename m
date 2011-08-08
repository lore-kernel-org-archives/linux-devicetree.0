From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] USB: isp1362: Add devicetree support
Date: Mon, 8 Aug 2011 12:37:49 -0600
Message-ID: <CACxGe6vL+Lv6f1vK9nNgiU7jXRp0AAAsWFOU8NjiMFcfy=h4Kg@mail.gmail.com>
References: <1312292961-18309-1-git-send-email-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1312292961-18309-1-git-send-email-tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 2, 2011 at 7:49 AM, Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org> wr=
ote:
> Signed-off-by: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
> ---

No commit text?

> =A0.../devicetree/bindings/usb/isp1362-hcd.txt =A0 =A0 =A0 =A0| =A0 2=
3 +++++
> =A0drivers/usb/host/isp1362-hcd.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 93 +++++++++++++++++++-
> =A02 files changed, 113 insertions(+), 3 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/usb/isp1362-h=
cd.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/isp1362-hcd.txt b/=
Documentation/devicetree/bindings/usb/isp1362-hcd.txt
> new file mode 100644
> index 0000000..9641a82
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/isp1362-hcd.txt

Woo! Documentation!

> @@ -0,0 +1,23 @@
> +NXP ISP1362 USB host controller
> +
> +Required properties :
> + - compatible : should be "nxp,usb-isp1362"
> + - reg : offset and length of the register set for the device
> + - interrupts : interrupt number
> +
> +Optional properties :
> + - nxp,sel15Kres: boolean; Enable internal pulldown resistors on dow=
nstream
> + =A0 ports.
> + - nxp,clknotstop: boolean; Clock cannot be stopped
> + - nxp,oc_enable: boolean; Enable on-chip overcurrent protection

'-' is preferred to '_' on property names.

> + - nxp,int_act_high: boolean; INT output polarity high
> + - nxp,int_edge_triggered: boolean; INT edge triggered

Typically interupt polarity/sense is encoded in the flags of the
interrupt specifier.

> + - nxp,dreq_act_high: boolean; DREQ output polarity high
> + - nxp,dack_act_high: boolean; DACK input polarity high
> + - nxp,remote_wakeup_connected: boolean; chip can be resumed via H_W=
AKEUP pin
> + - nxp,no_power_switching: boolean; Switch or not to switch (keep al=
ways
> + =A0 powered)
> + - nxp,power_switching_mode: boolean; Ganged port power switching (0=
) or
> + =A0 individual port power switching (1)
> + - nxp,potpg: Power on to power good time (duration the host control=
ler has to
> + =A0 wait before accessing a power-on-port of the root hub) in units=
 of 2 msecs.

The documentation is a little unclear.  I assume you mean that each of
the boolean options defaults to false, and becomes true if the named
property is present.  Is that correct?  You may want to do some
wordsmithing here.  The nxp,power_switching_mode property appears to
expect an integer instead of being a boolean based on the presense of
a property

> diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp136=
2-hcd.c
> index 9c37dad..dbf6f16 100644
> --- a/drivers/usb/host/isp1362-hcd.c
> +++ b/drivers/usb/host/isp1362-hcd.c
> @@ -78,6 +78,7 @@
> =A0#include <linux/usb/isp1362.h>
> =A0#include <linux/usb/hcd.h>
> =A0#include <linux/platform_device.h>
> +#include <linux/of.h>
> =A0#include <linux/pm.h>
> =A0#include <linux/io.h>
> =A0#include <linux/bitmap.h>
> @@ -2678,13 +2679,62 @@ static int __devexit isp1362_remove(struct pl=
atform_device *pdev)
> =A0 =A0 =A0 =A0usb_put_hcd(hcd);
> =A0 =A0 =A0 =A0DBG(0, "%s: Done\n", __func__);
>
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* If we had no platform_data, we allocated the board=
 struct
> + =A0 =A0 =A0 =A0* dynamically and filled it from device tree.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (!pdev->dev.platform_data)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(isp1362_hcd->board);

If the driver used devm_kzalloc(), it wouldn't have to free the data on=
 exit.

> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +
> +/*
> + * Translate device tree nodes to platform data.
> + */
> +static int isp1362_get_devtree_pdata(struct platform_device *pdev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0struct isp1362_platform_data *pdata)
> +{
> + =A0 =A0 =A0 struct device_node *node =3D pdev->dev.of_node;
> + =A0 =A0 =A0 const __be32 *reg;
> + =A0 =A0 =A0 int len;
> +
> + =A0 =A0 =A0 if (!node)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> +
> + =A0 =A0 =A0 pdata->sel15Kres =3D !!of_get_property(node, "nxp,sel15=
Kres", NULL);
> + =A0 =A0 =A0 pdata->clknotstop =3D !!of_get_property(node, "nxp,clkn=
otstop", NULL);
> + =A0 =A0 =A0 pdata->oc_enable =3D !!of_get_property(node, "nxp,oc_en=
able", NULL);
> + =A0 =A0 =A0 pdata->int_act_high =3D !!of_get_property(node, "nxp,in=
t_act_high", NULL);
> + =A0 =A0 =A0 pdata->int_edge_triggered =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 !!of_get_property(node, "nxp,int_edge_t=
riggered", NULL);
> + =A0 =A0 =A0 pdata->remote_wakeup_connected =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 !!of_get_property(node, "nxp,remote_wak=
eup_connected", NULL);
> + =A0 =A0 =A0 pdata->no_power_switching =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 !!of_get_property(node, "nxp,no_power_s=
witching", NULL);
> + =A0 =A0 =A0 pdata->power_switching_mode =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 !!of_get_property(node, "nxp,power_swit=
ching_mode", NULL);
> + =A0 =A0 =A0 reg =3D of_get_property(node, "nxp,potpg", &len);
> + =A0 =A0 =A0 if (reg && len =3D=3D sizeof(__be32))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->potpg =3D be32_to_cpup(reg);

of_property_read_u32() will help here.

> +
> =A0 =A0 =A0 =A0return 0;
> =A0}
> +#else
> +static int isp1362_get_devtree_pdata(struct platform_device *pdev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0struct isp1362_platform_data *pdata)
> +{
> + =A0 =A0 =A0 return -ENODEV;
> +}
> +#endif /* CONFIG_OF */
>
> =A0static int __devinit isp1362_probe(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct usb_hcd *hcd;
> =A0 =A0 =A0 =A0struct isp1362_hcd *isp1362_hcd;
> + =A0 =A0 =A0 struct isp1362_platform_data *pdata;
> =A0 =A0 =A0 =A0struct resource *addr, *data;
> =A0 =A0 =A0 =A0void __iomem *addr_reg;
> =A0 =A0 =A0 =A0void __iomem *data_reg;
> @@ -2755,12 +2805,31 @@ static int __devinit isp1362_probe(struct pla=
tform_device *pdev)
> =A0 =A0 =A0 =A0INIT_LIST_HEAD(&isp1362_hcd->periodic);
> =A0 =A0 =A0 =A0INIT_LIST_HEAD(&isp1362_hcd->isoc);
> =A0 =A0 =A0 =A0INIT_LIST_HEAD(&isp1362_hcd->remove_list);
> - =A0 =A0 =A0 isp1362_hcd->board =3D pdev->dev.platform_data;
> +
> + =A0 =A0 =A0 pdata =3D pdev->dev.platform_data;
> +
> + =A0 =A0 =A0 /* If no platform data is available, try to get it from=
 device tree */
> + =A0 =A0 =A0 if (!pdata) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata =3D kzalloc(sizeof(struct isp1362=
_platform_data), GFP_KERNEL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pdata) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err6;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D isp1362_get_devtree_pdata(pd=
ev, pdata);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (retval) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(pdata);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err6;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }

The kzalloc could be rolled into isp1362_get_devtree_pdata() to
simplify the impact on the probe hook.

> +
> + =A0 =A0 =A0 isp1362_hcd->board =3D pdata;
> +
> =A0#if USE_PLATFORM_DELAY
> =A0 =A0 =A0 =A0if (!isp1362_hcd->board->delay) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(hcd->self.controller, "No plat=
form delay function given\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0retval =3D -ENODEV;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err6;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err7;
> =A0 =A0 =A0 =A0}
> =A0#endif
>
> @@ -2775,13 +2844,20 @@ static int __devinit isp1362_probe(struct pla=
tform_device *pdev)
>
> =A0 =A0 =A0 =A0retval =3D usb_add_hcd(hcd, irq, irq_flags | IRQF_DISA=
BLED | IRQF_SHARED);
> =A0 =A0 =A0 =A0if (retval !=3D 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err6;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err7;
> =A0 =A0 =A0 =A0pr_info("%s, irq %d\n", hcd->product_desc, irq);
>
> =A0 =A0 =A0 =A0create_debug_file(isp1362_hcd);
>
> =A0 =A0 =A0 =A0return 0;
>
> +err7:
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* If we have no platform_data, we allocated the boar=
d struct
> + =A0 =A0 =A0 =A0* dynamically.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (!pdev->dev.platform_data)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(isp1362_hcd->board);

This also would disappear when using devm_kzalloc()

> =A0err6:
> =A0 =A0 =A0 =A0DBG(0, "%s: Freeing dev %p\n", __func__, isp1362_hcd);
> =A0 =A0 =A0 =A0usb_put_hcd(hcd);
> @@ -2852,6 +2928,16 @@ static int isp1362_resume(struct platform_devi=
ce *pdev)
> =A0#define =A0 =A0 =A0 =A0isp1362_resume =A0NULL
> =A0#endif
>
> +#ifdef CONFIG_OF
> +static struct of_device_id isp1362_match[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "nxp,usb-isp1362", },
> + =A0 =A0 =A0 {}
> +};
> +MODULE_DEVICE_TABLE(of, isp1362_match);
> +#else
> +#define isp1362_match NULL
> +#endif /* CONFIG_OF */
> +
> =A0static struct platform_driver isp1362_driver =3D {
> =A0 =A0 =A0 =A0.probe =3D isp1362_probe,
> =A0 =A0 =A0 =A0.remove =3D __devexit_p(isp1362_remove),
> @@ -2861,6 +2947,7 @@ static struct platform_driver isp1362_driver =3D=
 {
> =A0 =A0 =A0 =A0.driver =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D (char *)hcd_name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D isp1362_match,
> =A0 =A0 =A0 =A0},
> =A0};
>
> --
> 1.7.5.4
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
