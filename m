From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] usb: chipidea: Use extcon framework for VBUS and ID
 detection
Date: Mon, 13 Apr 2015 11:53:46 +0800
Message-ID: <20150413035345.GA1341@shlinux2>
References: <1428568418-22508-1-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1428568418-22508-1-git-send-email-ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 09, 2015 at 11:33:38AM +0300, Ivan T. Ivanov wrote:
> On recent Qualcomm platforms VBUS and ID lines are not routed to
> USB PHY LINK controller. Use extcon framework to receive connect
> and disconnect ID and VBUS notification.
> 
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> 
> Suggestions for better solution are welcome!
> 
>  .../devicetree/bindings/usb/ci-hdrc-qcom.txt       |  9 +++
>  drivers/usb/chipidea/Kconfig                       |  1 +
>  drivers/usb/chipidea/ci.h                          | 18 +++++
>  drivers/usb/chipidea/core.c                        | 77 ++++++++++++++++++++++
>  drivers/usb/chipidea/otg.c                         | 19 +++++-
>  5 files changed, 123 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
> index f2899b5..788da49 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
> @@ -7,6 +7,14 @@ Required properties:
>  - usb-phy:      phandle for the PHY device
>  - dr_mode:      Should be "peripheral"
> 
> +Optional properties:
> +- extcon:       phandles to external connector devices. First phandle
> +                should point to external connector, which provide "USB"
> +                cable events, the second should point to external connector
> +                device, which provide "USB-HOST" cable events. If one of
> +                the external connector devices is not required empty <0>
> +                phandle should be specified.

You mean if id connector is not needed, we write dts like below:
extcon = <&usb_vbus>, <0>;

If it is, you may miss ',' between "required" and "empty <0>".

> +
>  Examples:
>  	gadget@f9a55000 {
>  		compatible = "qcom,ci-hdrc";
> @@ -14,4 +22,5 @@ Examples:
>  		dr_mode = "peripheral";
>  		interrupts = <0 134 0>;
>  		usb-phy = <&usbphy0>;
> +		extcon = <&usb_vbus>, <&usb_id>;
>  	};
> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
> index 77b47d8..a67b67f 100644
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -1,6 +1,7 @@
>  config USB_CHIPIDEA
>  	tristate "ChipIdea Highspeed Dual Role Controller"
>  	depends on ((USB_EHCI_HCD && USB_GADGET) || (USB_EHCI_HCD && !USB_GADGET) || (!USB_EHCI_HCD && USB_GADGET)) && HAS_DMA
> +	depends on EXTCON

Would you use "select" instead of "depends on" since some
defconfigs may not enable extcon?

>  	help
>  	  Say Y here if your system has a dual role high speed USB
>  	  controller based on ChipIdea silicon IP. Currently, only the
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index 65913d4..04e7aee 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -13,6 +13,7 @@
>  #ifndef __DRIVERS_USB_CHIPIDEA_CI_H
>  #define __DRIVERS_USB_CHIPIDEA_CI_H
> 
> +#include <linux/extcon.h>
>  #include <linux/list.h>
>  #include <linux/irqreturn.h>
>  #include <linux/usb.h>
> @@ -132,6 +133,18 @@ struct hw_bank {
>  };
> 
>  /**
> + * struct ci_hdrc - structure for exteternal connector cable state tracking

%s/exteternal/external

> + * @state: current state of the line
> + * @nb: hold event notification callback
> + * @conn: used for notification registration
> + */
> +struct ci_cable {
> +	bool				state;
> +	struct notifier_block		nb;
> +	struct extcon_specific_cable_nb conn;
> +};
> +
> +/**
>   * struct ci_hdrc - chipidea device representation
>   * @dev: pointer to parent device
>   * @lock: access synchronization
> @@ -169,6 +182,8 @@ struct hw_bank {
>   * @b_sess_valid_event: indicates there is a vbus event, and handled
>   * at ci_otg_work
>   * @imx28_write_fix: Freescale imx28 needs swp instruction for writing
> + * @vbus: VBUS signal state trakining, using extcon framework
> + * @id: ID signal state trakining, using extcon framework

%s/trakining/tracking

>   */
>  struct ci_hdrc {
>  	struct device			*dev;
> @@ -211,6 +226,9 @@ struct ci_hdrc {
>  	bool				id_event;
>  	bool				b_sess_valid_event;
>  	bool				imx28_write_fix;
> +
> +	struct ci_cable			vbus;
> +	struct ci_cable			id;

I prefer using vbus_extcon and id_extcon
>  };
> 
>  static inline struct ci_role_driver *ci_role(struct ci_hdrc *ci)
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index a57dc88..0f805bd 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -47,6 +47,7 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/extcon.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/module.h>
> @@ -646,9 +647,36 @@ static void ci_get_otg_capable(struct ci_hdrc *ci)
>  		dev_dbg(ci->dev, "It is OTG capable controller\n");
>  }
> 
> +static int ci_vbus_notifier(struct notifier_block *nb, unsigned long event,
> +			 void *ptr)
> +{
> +	struct ci_cable *vbus = container_of(nb, struct ci_cable, nb);
> +
> +	if (event)
> +		vbus->state = true;
> +	else
> +		vbus->state = false;
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int ci_host_notifier(struct notifier_block *nb, unsigned long event,
> +		       void *ptr)

ci_id_notifier?

> +{
> +	struct ci_cable *id = container_of(nb, struct ci_cable, nb);
> +
> +	if (event)
> +		id->state = false;
> +	else
> +		id->state = true;
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static int ci_hdrc_probe(struct platform_device *pdev)
>  {
>  	struct device	*dev = &pdev->dev;
> +	struct extcon_dev *ext_vbus, *ext_id;
>  	struct ci_hdrc	*ci;
>  	struct resource	*res;
>  	void __iomem	*base;
> @@ -702,6 +730,51 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  			ci->usb_phy = NULL;
>  	}
> 
> +	ext_id = ERR_PTR(-ENODEV);
> +	ext_vbus = ERR_PTR(-ENODEV);
> +	if (of_property_read_bool(dev->parent->of_node, "extcon")) {
> +		/* Each one of them is not mandatory */
> +		ext_vbus = extcon_get_edev_by_phandle(dev->parent, 0);
> +		if (IS_ERR(ext_vbus) && PTR_ERR(ext_vbus) != -ENODEV)
> +			return PTR_ERR(ext_vbus);
> +
> +		ext_id = extcon_get_edev_by_phandle(dev->parent, 1);
> +		if (IS_ERR(ext_id) && PTR_ERR(ext_id) != -ENODEV)
> +			return PTR_ERR(ext_id);
> +	}

Would you move this code to ci_get_platdata which is used to get
platform stuffs from parent

> +
> +	if (!IS_ERR(ext_vbus)) {
> +		ci->vbus.nb.notifier_call = ci_vbus_notifier;
> +		ret = extcon_register_interest(&ci->vbus.conn, ext_vbus->name,
> +					       "USB", &ci->vbus.nb);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "register VBUS failed\n");
> +			return ret;
> +		}
> +
> +		ret = extcon_get_cable_state(ext_vbus, "USB");
> +		if (ret)
> +			ci->vbus.state = true;
> +		else
> +			ci->vbus.state = false;
> +	}
> +
> +	if (!IS_ERR(ext_id)) {
> +		ci->id.nb.notifier_call = ci_host_notifier;
> +		ret = extcon_register_interest(&ci->id.conn, ext_id->name,
> +					       "USB-HOST", &ci->id.nb);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "register ID failed\n");
> +			return ret;
> +		}
> +
> +		ret = extcon_get_cable_state(ext_id, "USB-HOST");
> +		if (ret)
> +			ci->id.state = false;
> +		else
> +			ci->id.state = true;
> +	}
> +
>  	ret = ci_usb_phy_init(ci);
>  	if (ret) {
>  		dev_err(dev, "unable to init phy: %d\n", ret);
> @@ -807,6 +880,10 @@ static int ci_hdrc_remove(struct platform_device *pdev)
>  {
>  	struct ci_hdrc *ci = platform_get_drvdata(pdev);
> 
> +	if (ci->id.conn.edev)
> +		extcon_unregister_interest(&ci->id.conn);
> +	if (ci->vbus.conn.edev)
> +		extcon_unregister_interest(&ci->vbus.conn);
>  	dbg_remove_files(ci);
>  	ci_role_destroy(ci);
>  	ci_hdrc_enter_lpm(ci, true);
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index a048b08..2e97c0d 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -30,7 +30,24 @@
>   */
>  u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
>  {
> -	return hw_read(ci, OP_OTGSC, mask);
> +	u32 val = hw_read(ci, OP_OTGSC, mask);
> +
> +	if ((mask & OTGSC_BSV) && ci->vbus.conn.edev) {

You may use "||" since you can't get vbus and id value from
cpu register (otgsc).

> +		if (ci->vbus.state)
> +			val |= OTGSC_BSV;
> +		else
> +			val &= ~OTGSC_BSV;
> +	}
> +
> +	if ((mask & OTGSC_ID) && ci->id.conn.edev) {
> +		if (ci->id.state)
> +			val |= OTGSC_ID;
> +		else
> +			val &= ~OTGSC_ID;
> +	}
> +
> +	val &= mask;
> +	return val;
>  }
> 
>  /**
> --
> 1.9.1
> 

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
