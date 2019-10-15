From: Roger Quadros <rogerq@ti.com>
Subject: Re: [RFC][PATCH 3/3] usb: dwc3: Registering a role switch in the DRD
 code.
Date: Tue, 15 Oct 2019 11:25:23 +0300
Message-ID: <9e86bb7b-5dd2-760e-c324-fe1c1ee41868@ti.com>
References: <20191002231617.3670-1-john.stultz@linaro.org>
 <20191002231617.3670-4-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002231617.3670-4-john.stultz@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Yu Chen <chenyu56@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Li <lijun.kernel@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 03/10/2019 02:16, John Stultz wrote:
> From: Yu Chen <chenyu56@huawei.com>
> 
> The Type-C drivers use USB role switch API to inform the
> system about the negotiated data role, so registering a role
> switch in the DRD code in order to support platforms with
> USB Type-C connectors.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Yu Chen <chenyu56@huawei.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Jun Li <lijun.kernel@gmail.com>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/usb/dwc3/Kconfig |  1 +
>   drivers/usb/dwc3/core.h  |  6 ++++
>   drivers/usb/dwc3/drd.c   | 78 +++++++++++++++++++++++++++++++++++++++-
>   3 files changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 89abc6078703..1104745c41a9 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -44,6 +44,7 @@ config USB_DWC3_DUAL_ROLE
>   	bool "Dual Role mode"
>   	depends on ((USB=y || USB=USB_DWC3) && (USB_GADGET=y || USB_GADGET=USB_DWC3))
>   	depends on (EXTCON=y || EXTCON=USB_DWC3)
> +	select USB_ROLE_SWITCH
>   	help
>   	  This is the default mode of working of DWC3 controller where
>   	  both host and gadget features are enabled.
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index b3cb6eec3f8f..83728157b3e9 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -25,6 +25,7 @@
>   #include <linux/usb/ch9.h>
>   #include <linux/usb/gadget.h>
>   #include <linux/usb/otg.h>
> +#include <linux/usb/role.h>
>   #include <linux/ulpi/interface.h>
>   
>   #include <linux/phy/phy.h>
> @@ -951,6 +952,9 @@ struct dwc3_scratchpad_array {
>    * @hsphy_mode: UTMI phy mode, one of following:
>    *		- USBPHY_INTERFACE_MODE_UTMI
>    *		- USBPHY_INTERFACE_MODE_UTMIW
> + * role_sw: usb_role_switch handle
> + * role_switch_default_mode: default operation mode of controller while
> + *			usb role is USB_ROLE_NONE.
>    * @usb2_phy: pointer to USB2 PHY
>    * @usb3_phy: pointer to USB3 PHY
>    * @usb2_generic_phy: pointer to USB2 PHY
> @@ -1085,6 +1089,8 @@ struct dwc3 {
>   	struct extcon_dev	*edev;
>   	struct notifier_block	edev_nb;
>   	enum usb_phy_interface	hsphy_mode;
> +	struct usb_role_switch	*role_sw;
> +	enum usb_dr_mode	role_switch_default_mode;
>   
>   	u32			fladj;
>   	u32			irq_gadget;
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index 726100d1ac0d..95b466a7faa0 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -479,6 +479,58 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
>   	return edev;
>   }
>   
> +static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
> +{
> +	struct dwc3 *dwc = dev_get_drvdata(dev);
> +	u32 mode;
> +
> +	switch (role) {
> +	case USB_ROLE_HOST:
> +		mode = DWC3_GCTL_PRTCAP_HOST;
> +		break;
> +	case USB_ROLE_DEVICE:
> +		mode = DWC3_GCTL_PRTCAP_DEVICE;
> +		break;
> +	default:
> +		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
> +			mode = DWC3_GCTL_PRTCAP_HOST;
> +		else
> +			mode = DWC3_GCTL_PRTCAP_DEVICE;
> +		break;
> +	}
> +
> +	dwc3_set_mode(dwc, mode);
> +	return 0;
> +}
> +
> +static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
> +{
> +	struct dwc3 *dwc = dev_get_drvdata(dev);
> +	unsigned long flags;
> +	enum usb_role role;
> +
> +	spin_lock_irqsave(&dwc->lock, flags);
> +	switch (dwc->current_dr_role) {
> +	case DWC3_GCTL_PRTCAP_HOST:
> +		role = USB_ROLE_HOST;
> +		break;
> +	case DWC3_GCTL_PRTCAP_DEVICE:
> +		role = USB_ROLE_DEVICE;
> +		break;
> +	case DWC3_GCTL_PRTCAP_OTG:
> +		role = dwc->current_otg_role;
> +		break;
> +	default:
> +		if (dwc->role_switch_default_mode == USB_DR_MODE_HOST)
> +			role = USB_ROLE_HOST;
> +		else
> +			role = USB_ROLE_DEVICE;
> +		break;
> +	}
> +	spin_unlock_irqrestore(&dwc->lock, flags);
> +	return role;
> +}
> +
>   int dwc3_drd_init(struct dwc3 *dwc)
>   {
>   	int ret, irq;
> @@ -487,7 +539,28 @@ int dwc3_drd_init(struct dwc3 *dwc)
>   	if (IS_ERR(dwc->edev))
>   		return PTR_ERR(dwc->edev);
>   
> -	if (dwc->edev) {
> +	if (device_property_read_bool(dwc->dev, "usb-role-switch")) {

I think we should use role switch unconditionally and get rid of the
debugfs role status/change mechanism.

> +		struct usb_role_switch_desc dwc3_role_switch = {0};
> +		u32 mode;
> +
> +		if (device_property_read_bool(dwc->dev,
> +					      "role-switch-default-host")) {
> +			dwc->role_switch_default_mode = USB_DR_MODE_HOST;
> +			mode = DWC3_GCTL_PRTCAP_HOST;
> +		} else {
> +			dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
> +			mode = DWC3_GCTL_PRTCAP_DEVICE;
> +		}
> +		dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
> +		dwc3_role_switch.set = dwc3_usb_role_switch_set;
> +		dwc3_role_switch.get = dwc3_usb_role_switch_get;
> +		dwc->role_sw = usb_role_switch_register(dwc->dev,
> +							&dwc3_role_switch);
> +		if (IS_ERR(dwc->role_sw))
> +			return PTR_ERR(dwc->role_sw);
> +
> +		dwc3_set_mode(dwc, mode);
> +	} else if (dwc->edev) {

Role switch should exist regardless if dwc->edev is present or not.

>   		dwc->edev_nb.notifier_call = dwc3_drd_notifier;
>   		ret = extcon_register_notifier(dwc->edev, EXTCON_USB_HOST,
>   					       &dwc->edev_nb);
> @@ -534,6 +607,9 @@ void dwc3_drd_exit(struct dwc3 *dwc)
>   {
>   	unsigned long flags;
>   
> +	if (dwc->role_sw)
> +		usb_role_switch_unregister(dwc->role_sw);
> +
>   	if (dwc->edev)
>   		extcon_unregister_notifier(dwc->edev, EXTCON_USB_HOST,
>   					   &dwc->edev_nb);
> 

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
