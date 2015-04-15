From: Robert Baldyga <r.baldyga@samsung.com>
Subject: Re: [PATCH v2] usb: chipidea: Use extcon framework for VBUS and ID
 detect
Date: Wed, 15 Apr 2015 16:11:19 +0200
Message-ID: <552E7187.3030005@samsung.com>
References: <1429104915-11079-1-git-send-email-ivan.ivanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1429104915-11079-1-git-send-email-ivan.ivanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Peter Chen <Peter.Chen@freescale.com>
Cc: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ivan,

On 04/15/2015 03:35 PM, Ivan T. Ivanov wrote:
> On recent Qualcomm platforms VBUS and ID lines are not routed to
> USB PHY LINK controller. Use extcon framework to receive connect
> and disconnect ID and VBUS notification.
> 
> Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
> ---
> 
> Changes since v0 [1], as per Peter Chen suggestions:
> 
> * Moved external connector parsing code to ci_get_platdata()
> * Moved external connector related variables to struct ci_hdrc_platform_data
> * Rename ci_host_notifier() to ci_id_notifier()
> * Fixed device bindings description
> * Use select EXTCON framework, instead of depends on.
> 
> [1] https://lkml.org/lkml/2015/4/9/116
> 
>  .../devicetree/bindings/usb/ci-hdrc-qcom.txt       |  9 +++
>  drivers/usb/chipidea/Kconfig                       |  1 +
>  drivers/usb/chipidea/core.c                        | 87 ++++++++++++++++++++++
>  drivers/usb/chipidea/otg.c                         | 26 ++++++-
>  include/linux/usb/chipidea.h                       | 17 +++++
>  5 files changed, 139 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-qcom.txt
> index f2899b5..c635aca 100644
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
> +                the external connector devices is not required, empty <0>
> +                phandle should be specified.

Do you expect to have "USB" and "USB-HOST" notifiers supplied by two
different extcon drivers? It looks strange. I don't think so that we
ever will need to deal with such weird configuration.

> +
>  Examples:
>  	gadget@f9a55000 {
>  		compatible = "qcom,ci-hdrc";
> @@ -14,4 +22,5 @@ Examples:
>  		dr_mode = "peripheral";
>  		interrupts = <0 134 0>;
>  		usb-phy = <&usbphy0>;
> +		extcon = <0>, <&usb_id>;
>  	};
> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
> index 5ce3f1d..5619b8c 100644
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
> index 74fea4f..e1d495d 100644
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
> @@ -557,9 +558,39 @@ static irqreturn_t ci_irq(int irq, void *data)
>  	return ret;
>  }
> 
> +static int ci_vbus_notifier(struct notifier_block *nb, unsigned long event,
> +			 void *ptr)
> +{
> +	struct ci_hdrc_cable *vbus = container_of(nb, struct ci_hdrc_cable, nb);
> +
> +	if (event)
> +		vbus->state = true;
> +	else
> +		vbus->state = false;
> +
> +	return NOTIFY_DONE;
> +}

Actually it's not true that "USB" cable state is equal to VBUS state.
"USB" and "USB-HOST" are mutually exclusive, and when you have ID=0,
which means "USB-HOST" is connected, "USB cable will be seen as
disconnected even when VBUS=1.

We are currently discussing how to pass VBUS state to USB OTG drivers.
You can find discussion here:
http://www.spinics.net/lists/linux-usb/msg123895.html

Best regards,
Robert Baldyga

> +
> +static int ci_id_notifier(struct notifier_block *nb, unsigned long event,
> +		       void *ptr)
> +{
> +	struct ci_hdrc_cable *id = container_of(nb, struct ci_hdrc_cable, nb);
> +
> +	if (event)
> +		id->state = false;
> +	else
> +		id->state = true;
> +
> +	return NOTIFY_DONE;
> +}
> +
>  static int ci_get_platdata(struct device *dev,
>  		struct ci_hdrc_platform_data *platdata)
>  {
> +	struct extcon_dev *ext_vbus, *ext_id;
> +	struct ci_hdrc_cable *cable;
> +	int ret;
> +
>  	if (!platdata->phy_mode)
>  		platdata->phy_mode = of_usb_get_phy_mode(dev->of_node);
> 
> @@ -591,6 +622,53 @@ static int ci_get_platdata(struct device *dev,
>  	if (of_usb_get_maximum_speed(dev->of_node) == USB_SPEED_FULL)
>  		platdata->flags |= CI_HDRC_FORCE_FULLSPEED;
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
> +	if (!IS_ERR(ext_vbus)) {
> +		cable = &platdata->vbus_extcon;
> +		cable->nb.notifier_call = ci_vbus_notifier;
> +		ret = extcon_register_interest(&cable->conn, ext_vbus->name,
> +					       "USB", &cable->nb);
> +		if (ret < 0) {
> +			dev_err(dev, "register VBUS failed\n");
> +			return ret;
> +		}
> +
> +		ret = extcon_get_cable_state(ext_vbus, "USB");
> +		if (ret)
> +			cable->state = true;
> +		else
> +			cable->state = false;
> +	}
> +
> +	if (!IS_ERR(ext_id)) {
> +		cable = &platdata->id_extcon;
> +		cable->nb.notifier_call = ci_id_notifier;
> +		ret = extcon_register_interest(&cable->conn, ext_id->name,
> +					       "USB-HOST", &cable->nb);
> +		if (ret < 0) {
> +			dev_err(dev, "register ID failed\n");
> +			return ret;
> +		}
> +
> +		ret = extcon_get_cable_state(ext_id, "USB-HOST");
> +		if (ret)
> +			cable->state = false;
> +		else
> +			cable->state = true;
> +	}
> +
>  	return 0;
>  }
> 
> @@ -845,6 +923,7 @@ deinit_phy:
>  static int ci_hdrc_remove(struct platform_device *pdev)
>  {
>  	struct ci_hdrc *ci = platform_get_drvdata(pdev);
> +	struct extcon_specific_cable_nb *cable_nb;
> 
>  	if (ci->supports_runtime_pm) {
>  		pm_runtime_get_sync(&pdev->dev);
> @@ -852,6 +931,14 @@ static int ci_hdrc_remove(struct platform_device *pdev)
>  		pm_runtime_put_noidle(&pdev->dev);
>  	}
> 
> +	cable_nb = &ci->platdata->id_extcon.conn;
> +	if (cable_nb->edev)
> +		extcon_unregister_interest(cable_nb);
> +
> +	cable_nb = &ci->platdata->vbus_extcon.conn;
> +	if (cable_nb->edev)
> +		extcon_unregister_interest(cable_nb);
> +
>  	dbg_remove_files(ci);
>  	ci_role_destroy(ci);
>  	ci_hdrc_enter_lpm(ci, true);
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index ad6c87a..34dd196 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -30,7 +30,31 @@
>   */
>  u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
>  {
> -	return hw_read(ci, OP_OTGSC, mask);
> +	struct ci_hdrc_cable *cable;
> +	u32 val = hw_read(ci, OP_OTGSC, mask);
> +
> +	/*
> +	 * If using extcon framework for VBUS and/or ID signal
> +	 * detection overwrite OTGSC resiter value
> +	 */
> +	cable = &ci->platdata->vbus_extcon;
> +	if ((mask & OTGSC_BSV) && cable->conn.edev) {
> +		if (cable->state)
> +			val |= OTGSC_BSV;
> +		else
> +			val &= ~OTGSC_BSV;
> +	}
> +
> +	cable = &ci->platdata->id_extcon;
> +	if ((mask & OTGSC_ID) && cable->conn.edev) {
> +		if (cable->state)
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
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index ab94f78..0eedaf6 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -5,8 +5,21 @@
>  #ifndef __LINUX_USB_CHIPIDEA_H
>  #define __LINUX_USB_CHIPIDEA_H
> 
> +#include <linux/extcon.h>
>  #include <linux/usb/otg.h>
> 
> +/**
> + * struct ci_hdrc_cable - structure for external connector cable state tracking
> + * @state: current state of the line
> + * @nb: hold event notification callback
> + * @conn: used for notification registration
> + */
> +struct ci_hdrc_cable {
> +	bool				state;
> +	struct notifier_block		nb;
> +	struct extcon_specific_cable_nb conn;
> +};
> +
>  struct ci_hdrc;
>  struct ci_hdrc_platform_data {
>  	const char	*name;
> @@ -35,6 +48,10 @@ struct ci_hdrc_platform_data {
>  	void	(*notify_event) (struct ci_hdrc *ci, unsigned event);
>  	struct regulator	*reg_vbus;
>  	bool			tpl_support;
> +
> +	/* VBUS and ID signal state tracking, using extcon framework */
> +	struct ci_hdrc_cable		vbus_extcon;
> +	struct ci_hdrc_cable		id_extcon;
>  };
> 
>  /* Default offset of capability registers */
> --
> 1.9.1
