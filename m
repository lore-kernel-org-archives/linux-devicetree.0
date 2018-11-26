From: Roger Quadros <rogerq@ti.com>
Subject: Re: [RFC PATCH v2 05/15] usb:cdns3: Added DRD support
Date: Mon, 26 Nov 2018 11:39:49 +0200
Message-ID: <5BFBBF65.7090204@ti.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-6-git-send-email-pawell@cadence.com>
 <5BF8140C.7000605@ti.com>
 <BYAPR07MB470991EB0AE200B6481AEE35DDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
 <5BFBA9BC.20306@ti.com>
 <BYAPR07MB47092F6F92A344AA76C093C9DDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB47092F6F92A344AA76C093C9DDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

On 26/11/18 10:39, Pawel Laszczak wrote:
>>
>> Pawel,
>>
>> On 26/11/18 09:23, Pawel Laszczak wrote:
>>> Hi Roger,
>>>
>>>> On 18/11/18 12:09, Pawel Laszczak wrote:
>>>>> Patch adds supports for detecting Host/Device mode.
>>>>> Controller has additional OTG register that allow
>>>>> implement even whole OTG functionality.
>>>>> At this moment patch adds support only for detecting
>>>>> the appropriate mode based on strap pins and ID pin.
>>>>>
>>>>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>>>>> ---
>>>>>  drivers/usb/cdns3/Makefile |   2 +-
>>>>>  drivers/usb/cdns3/core.c   |  27 +++--
>>>>>  drivers/usb/cdns3/drd.c    | 229 +++++++++++++++++++++++++++++++++++++
>>>>>  drivers/usb/cdns3/drd.h    | 122 ++++++++++++++++++++
>>>>>  4 files changed, 372 insertions(+), 8 deletions(-)
>>>>>  create mode 100644 drivers/usb/cdns3/drd.c
>>>>>  create mode 100644 drivers/usb/cdns3/drd.h
>>>>>
>>>>> diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
>>>>> index 02d25b23c5d3..e779b2a2f8eb 100644
>>>>> --- a/drivers/usb/cdns3/Makefile
>>>>> +++ b/drivers/usb/cdns3/Makefile
>>>>> @@ -1,5 +1,5 @@
>>>>>  obj-$(CONFIG_USB_CDNS3)			+= cdns3.o
>>>>>  obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+= cdns3-pci.o
>>>>>
>>>>> -cdns3-y					:= core.o
>>>>> +cdns3-y					:= core.o drd.o
>>>>>  cdns3-pci-y		 		:= cdns3-pci-wrap.o
>>>>> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
>>>>> index f9055d4da67f..dbee4325da7f 100644
>>>>> --- a/drivers/usb/cdns3/core.c
>>>>> +++ b/drivers/usb/cdns3/core.c
>>>>> @@ -17,6 +17,7 @@
>>>>>
>>>>>  #include "gadget.h"
>>>>>  #include "core.h"
>>>>> +#include "drd.h"
>>>>>
>>>>>  static inline struct cdns3_role_driver *cdns3_get_current_role_driver(struct cdns3 *cdns)
>>>>>  {
>>>>> @@ -57,8 +58,10 @@ static inline void cdns3_role_stop(struct cdns3 *cdns)
>>>>>  static enum cdns3_roles cdns3_get_role(struct cdns3 *cdns)
>>>>>  {
>>>>>  	if (cdns->roles[CDNS3_ROLE_HOST] && cdns->roles[CDNS3_ROLE_GADGET]) {
>>>>> -		//TODO: implements selecting device/host mode
>>>>> -		return CDNS3_ROLE_HOST;
>>>>> +		if (cdns3_is_host(cdns))
>>>>> +			return CDNS3_ROLE_HOST;
>>>>> +		if (cdns3_is_device(cdns))
>>>>> +			return CDNS3_ROLE_GADGET;
>>>>>  	}
>>>>>  	return cdns->roles[CDNS3_ROLE_HOST]
>>>>>  		? CDNS3_ROLE_HOST
>>>>> @@ -124,6 +127,12 @@ static irqreturn_t cdns3_irq(int irq, void *data)
>>>>>  	struct cdns3 *cdns = data;
>>>>>  	irqreturn_t ret = IRQ_NONE;
>>>>>
>>>>> +	if (cdns->dr_mode == USB_DR_MODE_OTG) {
>>>>> +		ret = cdns3_drd_irq(cdns);
>>>>> +		if (ret == IRQ_HANDLED)
>>>>> +			return ret;
>>>>> +	}
>>>>
>>>> The kernel's shared IRQ model takes care of sharing the same interrupt
>>>> between different devices and their drivers. You don't need to manually
>>>> handle it here. Just let all 3 drivers do a request_irq() and have
>>>> handlers check if the IRQ was theirs or not and return IRQ_HANDLED or
>>>> IRQ_NONE accordingly.
>>>>
>>>> Looks like you can do away with irq member of the role driver struct.
>>>
>>> Ok, I will split it into 3 separate part, but in this case, I additionally have to check the current
>>> role in ISR function. Driver can't read host side registers when controller works in device role
>>> and vice versa. One part of controller is kept in reset. Only DRD registers are common and are all accessible.
>>>
>>
>> In which ISR do you need to check current role?
>>
>> I'm not sure if we are on the same page.
>> Core (drd) driver shouldn't read host/device side registers. All 3 drivers,
>> i.e. DRD(core), Host (xhci) and device (cdns3) should do a request_irq()
>> and process their respective IRQ events.
> 
> Yes, I understand. 
> I need to check this in cdns3_irq_handler_thread and cdns3_host_irq.
> 
> Core (drd) has register that are always accessible. 
> Core (device)  - registers are available also in device mode
> Core (host)  - registers  are available only in host mode 
> 
> So we can use separate request_irq  for drd, device and host side, but 
> we need ensure that in host side driver will not touch the device register. 

That should never happen as host side doesn't have visibility to device registers.
> 
> We doesn't know the order in which  the system will call interrupts function related to 
>  the shared interrupt line.

Order shouldn't matter. Each user will check its own events return IRQ_NONE if they
didn't cause the IRQ.
> 

<snip>

cheers,
-roger

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
