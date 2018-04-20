From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2] usb: chipidea: Hook into mux framework to toggle usb
 switch
Date: Fri, 20 Apr 2018 09:30:37 +0200
Message-ID: <1fd0df0a-3930-94c8-2973-2c90e0b07530@axentia.se>
References: <1523973148-2094-1-git-send-email-yossim@codeaurora.org>
 <HE1PR04MB14504981D8B409CD8F9E7B7D8BB40@HE1PR04MB1450.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <HE1PR04MB14504981D8B409CD8F9E7B7D8BB40@HE1PR04MB1450.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>, Yossi Mansharoff <yossim@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:CHIPIDEA USB HIGH SPEED DUAL ROLE CONTROLLER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>, "swboyd@chromium.org" <swboyd@chromium.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Boyd <stephen.boyd@linaro.org>
List-Id: devicetree@vger.kernel.org

On 2018-04-20 04:00, Peter Chen wrote:
>  
>  
>> --- a/drivers/usb/chipidea/Kconfig
>> +++ b/drivers/usb/chipidea/Kconfig
>> @@ -3,6 +3,8 @@ config USB_CHIPIDEA
>>  	depends on ((USB_EHCI_HCD && USB_GADGET) || (USB_EHCI_HCD
>> && !USB_GADGET) || (!USB_EHCI_HCD && USB_GADGET)) && HAS_DMA
>>  	select EXTCON
>>  	select RESET_CONTROLLER
>> +	select MULTIPLEXER
>> +	select MUX_GPIO
> 
> The above two configurations are only used at your specific platforms, please add
> them at either your platform defconfig or the related hardware driver's Kconfig. 

"select MUX_GPIO" is indeed questionable and should be somewhere else because
this driver will work with any other mux as well. It's simply something else
that requires it. If it was the case that MUX_GPIO is indeed required then the
whole use of the mux subsystem is questionable and the thing controlled might
as well be controlled directly with the GPIO line. The mux subsystem is good
when a single mux "controller" is shared between several unrelated drivers
utilizing different muxes controlled by that same mux "controller" (think
several muxes controlled by the same GPIO line/lines). The mux subsystem is
also useful when the driver does not want to handle/know how the specific mux
is controlled. That said, it's of course not wrong to use the mux subsystem
in cases like this either, but I think it might be much easier and direct to
just twiddle the single GPIO line directly here?

Or do you expect some future HW variant that will use some other means to
control this mux?

>>  	help
>>  	  Say Y here if your system has a dual role high speed USB
>>  	  controller based on ChipIdea silicon IP. It supports:
>> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c index
>> 33ae87f..8fa0991 100644
>> --- a/drivers/usb/chipidea/core.c
>> +++ b/drivers/usb/chipidea/core.c
>> @@ -61,6 +61,7 @@
>>  #include <linux/of.h>
>>  #include <linux/regulator/consumer.h>
>>  #include <linux/usb/ehci_def.h>
>> +#include <linux/mux/consumer.h>
>>
>>  #include "ci.h"
>>  #include "udc.h"
>> @@ -687,6 +688,10 @@ static int ci_get_platdata(struct device *dev,
>>  	if (of_find_property(dev->of_node, "non-zero-ttctrl-ttha", NULL))
>>  		platdata->flags |= CI_HDRC_SET_NON_ZERO_TTHA;
>>
>> +	platdata->usb_switch = devm_mux_control_get_optional(dev, "usb_switch");
>> +	if (IS_ERR(platdata->usb_switch))
>> +		return PTR_ERR(platdata->usb_switch);
>> +
>>  	ext_id = ERR_PTR(-ENODEV);
>>  	ext_vbus = ERR_PTR(-ENODEV);
>>  	if (of_property_read_bool(dev->of_node, "extcon")) { diff --git
>> a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c index af45aa32..d9d2d00
>> 100644
>> --- a/drivers/usb/chipidea/host.c
>> +++ b/drivers/usb/chipidea/host.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/usb/hcd.h>
>>  #include <linux/usb/chipidea.h>
>>  #include <linux/regulator/consumer.h>
>> +#include <linux/mux/consumer.h>
>>
>>  #include "../host/ehci.h"
>>
>> @@ -161,6 +162,10 @@ static int host_start(struct ci_hdrc *ci)
>>  		if (ci_otg_is_fsm_mode(ci)) {
>>  			otg->host = &hcd->self;
>>  			hcd->self.otg_port = 1;
>> +		} else {
>> +			ret = mux_control_select(ci->platdata->usb_switch, 1);
>> +			if (ret)
>> +				goto disable_reg;
> 
> What will happen if ci->platdata->usb_switch  is NULL?

What has not been mentioned in this patch is that it depends on another
patch which is not yet upstream. You can google for

mux: add mux_control_get_optional() API

to get an idea (it's also in linux-next). Anyway, with that patch this
is not a problem.

>>  		}
>>  	}
>>
>> @@ -181,6 +186,8 @@ static void host_stop(struct ci_hdrc *ci)
>>  	struct usb_hcd *hcd = ci->hcd;
>>
>>  	if (hcd) {
>> +		if (!ci_otg_is_fsm_mode(ci))
>> +			mux_control_deselect(ci->platdata->usb_switch);
> 
> Ditto.
> 
>>  		if (ci->platdata->notify_event)
>>  			ci->platdata->notify_event(ci,
>>  				CI_HDRC_CONTROLLER_STOPPED_EVENT);
>> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c index
>> 9852ec5..209d3f6 100644
>> --- a/drivers/usb/chipidea/udc.c
>> +++ b/drivers/usb/chipidea/udc.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/usb/gadget.h>
>>  #include <linux/usb/otg-fsm.h>
>>  #include <linux/usb/chipidea.h>
>> +#include <linux/mux/consumer.h>
>>
>>  #include "ci.h"
>>  #include "udc.h"
>> @@ -1965,16 +1966,26 @@ void ci_hdrc_gadget_destroy(struct ci_hdrc *ci)
>>
>>  static int udc_id_switch_for_device(struct ci_hdrc *ci)  {
>> +	int ret = 0;
>> +
>>  	if (ci->is_otg)
>>  		/* Clear and enable BSV irq */
>>  		hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
>>  					OTGSC_BSVIS | OTGSC_BSVIE);
>>
>> -	return 0;
>> +	if (!ci_otg_is_fsm_mode(ci))
>> +		ret = mux_control_select(ci->platdata->usb_switch, 0);
>> +
> 
> Ditto
> 
>> +	if (ci->is_otg && ret)
>> +		hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS,
>> OTGSC_BSVIS);
>> +
>> +	return ret;
>>  }
>>
>>  static void udc_id_switch_for_host(struct ci_hdrc *ci)  {
>> +	mux_control_deselect(ci->platdata->usb_switch);
>> +
>>  	/*
>>  	 * host doesn't care B_SESSION_VALID event
>>  	 * so clear and disbale BSV irq
>> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h index
>> 07f9936..9ea55a1 100644
>> --- a/include/linux/usb/chipidea.h
>> +++ b/include/linux/usb/chipidea.h
>> @@ -10,6 +10,7 @@
>>  #include <linux/usb/otg.h>
>>
>>  struct ci_hdrc;
>> +struct mux_control;
>>
>>  /**
>>   * struct ci_hdrc_cable - structure for external connector cable state tracking @@ -
>> 76,6 +77,7 @@ struct ci_hdrc_platform_data {
>>  	/* VBUS and ID signal state tracking, using extcon framework */
>>  	struct ci_hdrc_cable		vbus_extcon;
>>  	struct ci_hdrc_cable		id_extcon;
>> +	struct mux_control		*usb_switch;
>>  	u32			phy_clkgate_delay_us;
>  
> If CONFIG_USB_CHIPIDEA_HOST is not defined, it may cause build error

How is that related? There is a forward declaration above?

Cheers,
peda
