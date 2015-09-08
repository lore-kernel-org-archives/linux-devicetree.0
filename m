From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v4] usb: chipidea: Use extcon framework for VBUS and ID
 detect
Date: Tue, 8 Sep 2015 17:39:07 +0800
Message-ID: <20150908093906.GE7802@shlinux2>
References: <1441626325-20983-1-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441626325-20983-1-git-send-email-ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 07, 2015 at 02:45:25PM +0300, Ivan T. Ivanov wrote:
> On recent Qualcomm platforms VBUS and ID lines are not routed to
> USB PHY LINK controller. Use extcon framework to receive connect
> and disconnect ID and VBUS notification.
> 
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

I will queue it for next rc1, thanks.

Peter
> ---
> 
> Changes sice v3 [1]:
> 
> * Migrate to new extcon framework API
> * Address comments from Peter Chen.
> 
> Tested DRD role with "qcom,ci-hdrc" and "qcom,usb-8x16-phy" on DB410c
> 
> [1] https://lkml.org/lkml/2015/6/2/333
> 
>  .../devicetree/bindings/usb/ci-hdrc-usb2.txt       |   6 +
>  drivers/usb/chipidea/Kconfig                       |   1 +
>  drivers/usb/chipidea/core.c                        | 125 +++++++++++++++++++++
>  drivers/usb/chipidea/otg.c                         |  39 ++++++-
>  include/linux/usb/chipidea.h                       |  23 ++++
>  5 files changed, 193 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> index d71ef07bca5d..aea7d0af5fd6 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> @@ -45,6 +45,11 @@ Optional properties:
>    (4 bytes), This register represents the maximum length of a the burst
>    in 32-bit words while moving data from the USB bus to system memory,
>    changing this value takes effect only the SBUSCFG.AHBBRST is 0.
> +- extcon: phandles to external connector devices. First phandle should point to
> +  external connector, which provide "USB" cable events, the second should point
> +  to external connector device, which provide "USB-HOST" cable events. If one
> +  of the external connector devices is not required, empty <0> phandle should
> +  be specified.
> 
>  Example:
> 
> @@ -61,4 +66,5 @@ Example:
>  		ahb-burst-config = <0x0>;
>  		tx-burst-size-dword = <0x10>; /* 64 bytes */
>  		rx-burst-size-dword = <0x10>;
> +		extcon = <0>, <&usb_id>;
>  	};
> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
> index 5ce3f1d6a6ed..5619b8ca3bf3 100644
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -1,6 +1,7 @@
>  config USB_CHIPIDEA
>  	tristate "ChipIdea Highspeed Dual Role Controller"
>  	depends on ((USB_EHCI_HCD && USB_GADGET) || (USB_EHCI_HCD && !USB_GADGET) || (!USB_EHCI_HCD && USB_GADGET)) && HAS_DMA
> +	select EXTCON
>  	help
>  	  Say Y here if your system has a dual role high speed USB
>  	  controller based on ChipIdea silicon IP. Currently, only the
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 3feebf7f31f0..573c2876b263 100644
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
> @@ -602,9 +603,45 @@ static irqreturn_t ci_irq(int irq, void *data)
>  	return ret;
>  }
> 
> +static int ci_vbus_notifier(struct notifier_block *nb, unsigned long event,
> +			    void *ptr)
> +{
> +	struct ci_hdrc_cable *vbus = container_of(nb, struct ci_hdrc_cable, nb);
> +	struct ci_hdrc *ci = vbus->ci;
> +
> +	if (event)
> +		vbus->state = true;
> +	else
> +		vbus->state = false;
> +
> +	vbus->changed = true;
> +
> +	ci_irq(ci->irq, ci);
> +	return NOTIFY_DONE;
> +}
> +
> +static int ci_id_notifier(struct notifier_block *nb, unsigned long event,
> +			  void *ptr)
> +{
> +	struct ci_hdrc_cable *id = container_of(nb, struct ci_hdrc_cable, nb);
> +	struct ci_hdrc *ci = id->ci;
> +
> +	if (event)
> +		id->state = false;
> +	else
> +		id->state = true;
> +
> +	id->changed = true;
> +
> +	ci_irq(ci->irq, ci);
> +	return NOTIFY_DONE;
> +}
> +
>  static int ci_get_platdata(struct device *dev,
>  		struct ci_hdrc_platform_data *platdata)
>  {
> +	struct extcon_dev *ext_vbus, *ext_id;
> +	struct ci_hdrc_cable *cable;
>  	int ret;
> 
>  	if (!platdata->phy_mode)
> @@ -695,9 +732,91 @@ static int ci_get_platdata(struct device *dev,
>  		platdata->flags |= CI_HDRC_OVERRIDE_RX_BURST;
>  	}
> 
> +	ext_id = ERR_PTR(-ENODEV);
> +	ext_vbus = ERR_PTR(-ENODEV);
> +	if (of_property_read_bool(dev->of_node, "extcon")) {
> +		/* Each one of them is not mandatory */
> +		ext_vbus = extcon_get_edev_by_phandle(dev, 0);
> +		if (IS_ERR(ext_vbus) && PTR_ERR(ext_vbus) != -ENODEV)
> +			return PTR_ERR(ext_vbus);
> +
> +		ext_id = extcon_get_edev_by_phandle(dev, 1);
> +		if (IS_ERR(ext_id) && PTR_ERR(ext_id) != -ENODEV)
> +			return PTR_ERR(ext_id);
> +	}
> +
> +	cable = &platdata->vbus_extcon;
> +	cable->nb.notifier_call = ci_vbus_notifier;
> +	cable->edev = ext_vbus;
> +
> +	if (!IS_ERR(ext_vbus)) {
> +		ret = extcon_get_cable_state_(cable->edev, EXTCON_USB);
> +		if (ret)
> +			cable->state = true;
> +		else
> +			cable->state = false;
> +	}
> +
> +	cable = &platdata->id_extcon;
> +	cable->nb.notifier_call = ci_id_notifier;
> +	cable->edev = ext_id;
> +
> +	if (!IS_ERR(ext_id)) {
> +		ret = extcon_get_cable_state_(cable->edev, EXTCON_USB_HOST);
> +		if (ret)
> +			cable->state = false;
> +		else
> +			cable->state = true;
> +	}
>  	return 0;
>  }
> 
> +static int ci_extcon_register(struct ci_hdrc *ci)
> +{
> +	struct ci_hdrc_cable *id, *vbus;
> +	int ret;
> +
> +	id = &ci->platdata->id_extcon;
> +	id->ci = ci;
> +	if (!IS_ERR(id->edev)) {
> +		ret = extcon_register_notifier(id->edev, EXTCON_USB_HOST,
> +					       &id->nb);
> +		if (ret < 0) {
> +			dev_err(ci->dev, "register ID failed\n");
> +			return ret;
> +		}
> +	}
> +
> +	vbus = &ci->platdata->vbus_extcon;
> +	vbus->ci = ci;
> +	if (!IS_ERR(vbus->edev)) {
> +		ret = extcon_register_notifier(vbus->edev, EXTCON_USB,
> +					       &vbus->nb);
> +		if (ret < 0) {
> +			extcon_unregister_notifier(id->edev, EXTCON_USB_HOST,
> +						   &id->nb);
> +			dev_err(ci->dev, "register VBUS failed\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void ci_extcon_unregister(struct ci_hdrc *ci)
> +{
> +	struct ci_hdrc_cable *cable;
> +
> +	cable = &ci->platdata->id_extcon;
> +	if (!IS_ERR(cable->edev))
> +		extcon_unregister_notifier(cable->edev, EXTCON_USB_HOST,
> +					   &cable->nb);
> +
> +	cable = &ci->platdata->vbus_extcon;
> +	if (!IS_ERR(cable->edev))
> +		extcon_unregister_notifier(cable->edev, EXTCON_USB, &cable->nb);
> +}
> +
>  static DEFINE_IDA(ci_ida);
> 
>  struct platform_device *ci_hdrc_add_device(struct device *dev,
> @@ -921,6 +1040,10 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto stop;
> 
> +	ret = ci_extcon_register(ci);
> +	if (ret)
> +		goto stop;
> +
>  	if (ci->supports_runtime_pm) {
>  		pm_runtime_set_active(&pdev->dev);
>  		pm_runtime_enable(&pdev->dev);
> @@ -938,6 +1061,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  	if (!ret)
>  		return 0;
> 
> +	ci_extcon_unregister(ci);
>  stop:
>  	ci_role_destroy(ci);
>  deinit_phy:
> @@ -957,6 +1081,7 @@ static int ci_hdrc_remove(struct platform_device *pdev)
>  	}
> 
>  	dbg_remove_files(ci);
> +	ci_extcon_unregister(ci);
>  	ci_role_destroy(ci);
>  	ci_hdrc_enter_lpm(ci, true);
>  	ci_usb_phy_exit(ci);
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index ad6c87a4653c..ab4bd0c2d4ef 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -30,7 +30,44 @@
>   */
>  u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
>  {
> -	return hw_read(ci, OP_OTGSC, mask);
> +	struct ci_hdrc_cable *cable;
> +	u32 val = hw_read(ci, OP_OTGSC, mask);
> +
> +	/*
> +	 * If using extcon framework for VBUS and/or ID signal
> +	 * detection overwrite OTGSC register value
> +	 */
> +	cable = &ci->platdata->vbus_extcon;
> +	if (!IS_ERR(cable->edev)) {
> +		if (cable->changed)
> +			val |= OTGSC_BSVIS;
> +		else
> +			val &= ~OTGSC_BSVIS;
> +
> +		cable->changed = false;
> +
> +		if (cable->state)
> +			val |= OTGSC_BSV;
> +		else
> +			val &= ~OTGSC_BSV;
> +	}
> +
> +	cable = &ci->platdata->id_extcon;
> +	if (!IS_ERR(cable->edev)) {
> +		if (cable->changed)
> +			val |= OTGSC_IDIS;
> +		else
> +			val &= ~OTGSC_IDIS;
> +
> +		cable->changed = false;
> +
> +		if (cable->state)
> +			val |= OTGSC_ID;
> +		else
> +			val &= ~OTGSC_ID;
> +	}
> +
> +	return val;
>  }
> 
>  /**
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index a41833cd184c..c5cddc6901d0 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -5,9 +5,28 @@
>  #ifndef __LINUX_USB_CHIPIDEA_H
>  #define __LINUX_USB_CHIPIDEA_H
> 
> +#include <linux/extcon.h>
>  #include <linux/usb/otg.h>
> 
>  struct ci_hdrc;
> +
> +/**
> + * struct ci_hdrc_cable - structure for external connector cable state tracking
> + * @state: current state of the line
> + * @changed: set to true when extcon event happen
> + * @edev: device which generate events
> + * @ci: driver state of the chipidea device
> + * @nb: hold event notification callback
> + * @conn: used for notification registration
> + */
> +struct ci_hdrc_cable {
> +	bool				state;
> +	bool				changed;
> +	struct extcon_dev		*edev;
> +	struct ci_hdrc			*ci;
> +	struct notifier_block		nb;
> +};
> +
>  struct ci_hdrc_platform_data {
>  	const char	*name;
>  	/* offset of the capability registers */
> @@ -48,6 +67,10 @@ struct ci_hdrc_platform_data {
>  	u32			ahb_burst_config;
>  	u32			tx_burst_size;
>  	u32			rx_burst_size;
> +
> +	/* VBUS and ID signal state tracking, using extcon framework */
> +	struct ci_hdrc_cable		vbus_extcon;
> +	struct ci_hdrc_cable		id_extcon;
>  };
> 
>  /* Default offset of capability registers */
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
