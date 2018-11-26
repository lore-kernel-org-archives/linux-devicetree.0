From: Roger Quadros <rogerq@ti.com>
Subject: Re: [RFC PATCH v2 05/15] usb:cdns3: Added DRD support
Date: Mon, 26 Nov 2018 10:07:24 +0200
Message-ID: <5BFBA9BC.20306@ti.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-6-git-send-email-pawell@cadence.com>
 <5BF8140C.7000605@ti.com>
 <BYAPR07MB470991EB0AE200B6481AEE35DDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB470991EB0AE200B6481AEE35DDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Pawel,

On 26/11/18 09:23, Pawel Laszczak wrote:
> Hi Roger,
> 
>> On 18/11/18 12:09, Pawel Laszczak wrote:
>>> Patch adds supports for detecting Host/Device mode.
>>> Controller has additional OTG register that allow
>>> implement even whole OTG functionality.
>>> At this moment patch adds support only for detecting
>>> the appropriate mode based on strap pins and ID pin.
>>>
>>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>>> ---
>>>  drivers/usb/cdns3/Makefile |   2 +-
>>>  drivers/usb/cdns3/core.c   |  27 +++--
>>>  drivers/usb/cdns3/drd.c    | 229 +++++++++++++++++++++++++++++++++++++
>>>  drivers/usb/cdns3/drd.h    | 122 ++++++++++++++++++++
>>>  4 files changed, 372 insertions(+), 8 deletions(-)
>>>  create mode 100644 drivers/usb/cdns3/drd.c
>>>  create mode 100644 drivers/usb/cdns3/drd.h
>>>
>>> diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
>>> index 02d25b23c5d3..e779b2a2f8eb 100644
>>> --- a/drivers/usb/cdns3/Makefile
>>> +++ b/drivers/usb/cdns3/Makefile
>>> @@ -1,5 +1,5 @@
>>>  obj-$(CONFIG_USB_CDNS3)			+= cdns3.o
>>>  obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+= cdns3-pci.o
>>>
>>> -cdns3-y					:= core.o
>>> +cdns3-y					:= core.o drd.o
>>>  cdns3-pci-y		 		:= cdns3-pci-wrap.o
>>> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
>>> index f9055d4da67f..dbee4325da7f 100644
>>> --- a/drivers/usb/cdns3/core.c
>>> +++ b/drivers/usb/cdns3/core.c
>>> @@ -17,6 +17,7 @@
>>>
>>>  #include "gadget.h"
>>>  #include "core.h"
>>> +#include "drd.h"
>>>
>>>  static inline struct cdns3_role_driver *cdns3_get_current_role_driver(struct cdns3 *cdns)
>>>  {
>>> @@ -57,8 +58,10 @@ static inline void cdns3_role_stop(struct cdns3 *cdns)
>>>  static enum cdns3_roles cdns3_get_role(struct cdns3 *cdns)
>>>  {
>>>  	if (cdns->roles[CDNS3_ROLE_HOST] && cdns->roles[CDNS3_ROLE_GADGET]) {
>>> -		//TODO: implements selecting device/host mode
>>> -		return CDNS3_ROLE_HOST;
>>> +		if (cdns3_is_host(cdns))
>>> +			return CDNS3_ROLE_HOST;
>>> +		if (cdns3_is_device(cdns))
>>> +			return CDNS3_ROLE_GADGET;
>>>  	}
>>>  	return cdns->roles[CDNS3_ROLE_HOST]
>>>  		? CDNS3_ROLE_HOST
>>> @@ -124,6 +127,12 @@ static irqreturn_t cdns3_irq(int irq, void *data)
>>>  	struct cdns3 *cdns = data;
>>>  	irqreturn_t ret = IRQ_NONE;
>>>
>>> +	if (cdns->dr_mode == USB_DR_MODE_OTG) {
>>> +		ret = cdns3_drd_irq(cdns);
>>> +		if (ret == IRQ_HANDLED)
>>> +			return ret;
>>> +	}
>>
>> The kernel's shared IRQ model takes care of sharing the same interrupt
>> between different devices and their drivers. You don't need to manually
>> handle it here. Just let all 3 drivers do a request_irq() and have
>> handlers check if the IRQ was theirs or not and return IRQ_HANDLED or
>> IRQ_NONE accordingly.
>>
>> Looks like you can do away with irq member of the role driver struct.
> 
> Ok, I will split it into 3 separate part, but in this case, I additionally have to check the current 
> role in ISR function. Driver can't read host side registers when controller works in device role 
> and vice versa. One part of controller is kept in reset. Only DRD registers are common and are all accessible.
> 

In which ISR do you need to check current role?

I'm not sure if we are on the same page.
Core (drd) driver shouldn't read host/device side registers. All 3 drivers,
i.e. DRD(core), Host (xhci) and device (cdns3) should do a request_irq()
and process their respective IRQ events.

>>> +
>>>  	/* Handle device/host interrupt */
>>>  	if (cdns->role != CDNS3_ROLE_END)
>>>  		ret = cdns3_get_current_role_driver(cdns)->irq(cdns);
>>> @@ -176,11 +185,8 @@ static void cdns3_role_switch(struct work_struct *work)
>>>
>>>  	cdns = container_of(work, struct cdns3, role_switch_wq);
>>>
>>> -	//TODO: implements this functions.
>>> -	//host = cdns3_is_host(cdns);
>>> -	//device = cdns3_is_device(cdns);
>>> -	host = 1;
>>> -	device = 0;
>>> +	host = cdns3_is_host(cdns);
>>> +	device = cdns3_is_device(cdns);
>>
>> What if there is a ID transition between the 2 functions so that
>> and both host and device become true?
>> Since you are checking the ID level separately in both the functions.
>>
>> How about instead having cdns3_get_id() and using
>> it to start/stop relevant roles if we are in OTG mode.
>>
>> Is this going to be used for a role switch even if we're not in OTG mode?
>> If not then it is a BUG if we get here.
>>
> Good point.
> User can change current mode by debugfs and then this function will also invoked.
> Probably I use  cdns3_get_id as you suggest. 
> 
>>>
>>>  	if (host)
>>>  		role = CDNS3_ROLE_HOST;
>>> @@ -194,6 +200,12 @@ static void cdns3_role_switch(struct work_struct *work)
>>>  	pm_runtime_get_sync(cdns->dev);
>>>  	cdns3_role_stop(cdns);
>>>
>>> +	if (cdns->desired_dr_mode != cdns->current_dr_mode) {
>>
>> This is about roles, why are we checking dr_mode here?
> 
> Because after changing dr_mode by means of debugfs we need to update mode. 
> Driver should do this after stopping the previous role.  I will move this condition 
> to cdns3_drd_update_mode and add comment in this place. 
> 
>>
>>> +		cdns3_drd_update_mode(cdns);
>>> +		host = cdns3_is_host(cdns);
>>> +		device = cdns3_is_device(cdns);
>>> +	}
>>> +
>>>  	if (host) {
>>>  		if (cdns->roles[CDNS3_ROLE_HOST])
>>>  			cdns3_do_role_switch(cdns, CDNS3_ROLE_HOST);
>>> @@ -287,6 +299,7 @@ static int cdns3_probe(struct platform_device *pdev)
>>>  	if (ret)
>>>  		goto err2;
>>>
>>> +	ret = cdns3_drd_init(cdns);
>>>  	if (ret)
>>>  		goto err2;
>>>
>>> diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
>>> new file mode 100644
>>> index 000000000000..ac741c80e776
>>> --- /dev/null
>>> +++ b/drivers/usb/cdns3/drd.c
>>> @@ -0,0 +1,229 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Cadence USBSS DRD Driver.
>>> + *
>>> + * Copyright (C) 2018 Cadence.
>>> + *
>>> + * Author: Pawel Laszczak <pawell@cadence.com
>>> + *
>>> + */
>>> +#include <linux/kernel.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/usb/otg.h>
>>> +
>>> +#include "gadget.h"
>>> +#include "drd.h"
>>> +
>>> +/**
>>> + * cdns3_set_mode - change mode of OTG Core
>>> + * @cdns: pointer to context structure
>>> + * @mode: selected mode from cdns_role
>>> + */
>>> +void cdns3_set_mode(struct cdns3 *cdns, enum usb_dr_mode mode)
>>> +{
>>> +	u32 reg;
>>> +
>>> +	cdns->current_dr_mode = mode;
>>> +	switch (mode) {
>>> +	case USB_DR_MODE_PERIPHERAL:
>>> +		dev_info(cdns->dev, "Set controller to Gadget mode\n");
>>> +		writel(OTGCMD_DEV_BUS_REQ | OTGCMD_OTG_DIS,
>>> +		       &cdns->otg_regs->cmd);
>>> +		break;
>>> +	case USB_DR_MODE_HOST:
>>> +		dev_info(cdns->dev, "Set controller to Host mode\n");
>>> +		writel(OTGCMD_HOST_BUS_REQ | OTGCMD_OTG_DIS,
>>> +		       &cdns->otg_regs->cmd);
>>> +		break;
>>> +	case USB_DR_MODE_OTG:
>>> +		dev_info(cdns->dev, "Set controller to OTG mode\n");
>>> +		reg = readl(&cdns->otg_regs->ctrl1);
>>> +		reg |= OTGCTRL1_IDPULLUP;
>>> +		writel(reg, &cdns->otg_regs->ctrl1);
>>> +
>>> +		/* wait until valid ID (ID_VALUE) can be sampled (50ms). */
>>> +		mdelay(50);
>>> +		break;
>>> +	default:
>>> +		cdns->current_dr_mode = USB_DR_MODE_UNKNOWN;
>>> +		dev_err(cdns->dev, "Unsupported mode of operation %d\n", mode);
>>> +		return;
>>> +	}
>>> +}
>>> +
>>> +static int cdns3_otg_get_id(struct cdns3 *cdns)
>>> +{
>>> +	int id;
>>> +
>>> +	id = readl(&cdns->otg_regs->sts) & OTGSTS_ID_VALUE;
>>> +	dev_dbg(cdns->dev, "OTG ID: %d", id);
>>> +	return id;
>>> +}
>>> +
>>> +int cdns3_is_host(struct cdns3 *cdns)
>>> +{
>>> +	if (cdns->current_dr_mode == USB_DR_MODE_HOST)
>>> +		return 1;
>>
>> Why do you need this?
> 
> I assumed that some SoC could have cut DRD /OTG and Device or Host part. 
> In such case the driver cannot be based on ID pin. 
> For only HOST it's not a problem because 
> the standard XHCI driver will be used.  Probably I will remove this fragment.
>>
>>> +	else if (cdns->current_dr_mode == USB_DR_MODE_OTG)
>>> +		if (!cdns3_otg_get_id(cdns))
>>> +			return 1;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +int cdns3_is_device(struct cdns3 *cdns)
>>> +{
>>> +	if (cdns->current_dr_mode == USB_DR_MODE_PERIPHERAL)
>>> +		return 1;
>>> +	else if (cdns->current_dr_mode == USB_DR_MODE_OTG)
>>> +		if (cdns3_otg_get_id(cdns))
>>> +			return 1;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * cdns3_otg_disable_irq - Disable all OTG interrupts
>>> + * @cdns: Pointer to controller context structure
>>> + */
>>> +static void cdns3_otg_disable_irq(struct cdns3 *cdns)
>>> +{
>>> +	writel(0, &cdns->otg_regs->ien);
>>> +}
>>> +
>>> +/**
>>> + * cdns3_otg_enable_irq - enable id and sess_valid interrupts
>>> + * @cdns: Pointer to controller context structure
>>> + */
>>> +static void cdns3_otg_enable_irq(struct cdns3 *cdns)
>>> +{
>>> +	writel(OTGIEN_ID_CHANGE_INT | OTGIEN_VBUSVALID_RISE_INT |
>>> +	       OTGIEN_VBUSVALID_FALL_INT, &cdns->otg_regs->ien);
>>> +}
>>> +
>>> +/**
>>> + * cdns3_init_otg_mode - initialize drd controller
>>> + * @cdns: Pointer to controller context structure
>>> + *
>>> + * Returns 0 on success otherwise negative errno
>>> + */
>>> +static void cdns3_init_otg_mode(struct cdns3 *cdns)
>>> +{
>>> +	cdns3_otg_disable_irq(cdns);
>>> +	/* clear all interrupts */
>>> +	writel(~0, &cdns->otg_regs->ivect);
>>> +
>>> +	cdns3_set_mode(cdns, USB_DR_MODE_OTG);
>>> +
>>> +	cdns3_otg_enable_irq(cdns);
>>> +}
>>> +
>>> +/**
>>> + * cdns3_drd_update_mode - initialize mode of operation
>>
>> Looks like this will be called only once. How about calling it
>>
>> cdns3_drd_init_mode()?
> 
> It will be also called after changing dr_mode from debugfs.
> 
>>> + * @cdns: Pointer to controller context structure
>>> + *
>>> + * Returns 0 on success otherwise negative errno
>>> + */
>>> +int cdns3_drd_update_mode(struct cdns3 *cdns)
>>> +{
>>> +	int ret = 0;
>>> +
>>> +	switch (cdns->desired_dr_mode) {
>>
>> I think we can get rid of desired_dr_mode member in struct cdns.
>> Just pass the mode as an argument to cdns3_drd_init_mode()
> 
> This will be used also in patch that introduce debugfs. This filed is also used 
> during changing dr_mode from user space.
> 
> My intention was:
> dr_mode - indicated what driver can support, this filed based on dr_mode from device tree, 
> 	     straps bits from otg register and kernel configuration. 
> desired_ dr_mode - the next mode desired by user, changed by debugfs 
> current_dr_mode  - actually selected mode 
> 

OK, makes sense. But let's keep this patch simple. Add only the members you need right now.
Introduce the new one (desired_dr_mode) in the debugfs patch.

>>
>> And we already have cdns->dr_mode.
>>
>>> +	case USB_DR_MODE_PERIPHERAL:
>>> +		cdns3_set_mode(cdns, USB_DR_MODE_PERIPHERAL);
>>> +		break;
>>> +	case USB_DR_MODE_HOST:
>>> +		cdns3_set_mode(cdns, USB_DR_MODE_HOST);
>>> +		break;
>>> +	case USB_DR_MODE_OTG:
>>> +		cdns3_init_otg_mode(cdns);
>>> +		break;
>>> +	default:
>>> +		dev_err(cdns->dev, "Unsupported mode of operation %d\n",
>>> +			cdns->dr_mode);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	return ret;
>>> +}

<snip>

cheers,
-roger

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
