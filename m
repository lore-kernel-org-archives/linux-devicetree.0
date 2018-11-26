From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [RFC PATCH v2 05/15] usb:cdns3: Added DRD support
Date: Mon, 26 Nov 2018 10:09:48 +0000
Message-ID: <BYAPR07MB4709DFA347BC883F7F276332DDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-6-git-send-email-pawell@cadence.com>
 <5BF8140C.7000605@ti.com>
 <BYAPR07MB470991EB0AE200B6481AEE35DDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
 <5BFBA9BC.20306@ti.com>
 <BYAPR07MB47092F6F92A344AA76C093C9DDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
 <5BFBBF65.7090204@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5BFBBF65.7090204@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

>>>
>>> Pawel,
>>>
>>> On 26/11/18 09:23, Pawel Laszczak wrote:
>>>> Hi Roger,
>>>>
>>>>> On 18/11/18 12:09, Pawel Laszczak wrote:
>>>>>> Patch adds supports for detecting Host/Device mode.
>>>>>> Controller has additional OTG register that allow
>>>>>> implement even whole OTG functionality.
>>>>>> At this moment patch adds support only for detecting
>>>>>> the appropriate mode based on strap pins and ID pin.
>>>>>>
>>>>>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>>>>>> ---
>>>>>>  drivers/usb/cdns3/Makefile |   2 +-
>>>>>>  drivers/usb/cdns3/core.c   |  27 +++--
>>>>>>  drivers/usb/cdns3/drd.c    | 229 ++++++++++++++++++++++++++++++++++=
+++
>>>>>>  drivers/usb/cdns3/drd.h    | 122 ++++++++++++++++++++
>>>>>>  4 files changed, 372 insertions(+), 8 deletions(-)
>>>>>>  create mode 100644 drivers/usb/cdns3/drd.c
>>>>>>  create mode 100644 drivers/usb/cdns3/drd.h
>>>>>>
>>>>>> diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
>>>>>> index 02d25b23c5d3..e779b2a2f8eb 100644
>>>>>> --- a/drivers/usb/cdns3/Makefile
>>>>>> +++ b/drivers/usb/cdns3/Makefile
>>>>>> @@ -1,5 +1,5 @@
>>>>>>  obj-$(CONFIG_USB_CDNS3)			+=3D cdns3.o
>>>>>>  obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+=3D cdns3-pci.o
>>>>>>
>>>>>> -cdns3-y					:=3D core.o
>>>>>> +cdns3-y					:=3D core.o drd.o
>>>>>>  cdns3-pci-y		 		:=3D cdns3-pci-wrap.o
>>>>>> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
>>>>>> index f9055d4da67f..dbee4325da7f 100644
>>>>>> --- a/drivers/usb/cdns3/core.c
>>>>>> +++ b/drivers/usb/cdns3/core.c
>>>>>> @@ -17,6 +17,7 @@
>>>>>>
>>>>>>  #include "gadget.h"
>>>>>>  #include "core.h"
>>>>>> +#include "drd.h"
>>>>>>
>>>>>>  static inline struct cdns3_role_driver *cdns3_get_current_role_driv=
er(struct cdns3 *cdns)
>>>>>>  {
>>>>>> @@ -57,8 +58,10 @@ static inline void cdns3_role_stop(struct cdns3 *=
cdns)
>>>>>>  static enum cdns3_roles cdns3_get_role(struct cdns3 *cdns)
>>>>>>  {
>>>>>>  	if (cdns->roles[CDNS3_ROLE_HOST] && cdns->roles[CDNS3_ROLE_GADGET]=
) {
>>>>>> -		//TODO: implements selecting device/host mode
>>>>>> -		return CDNS3_ROLE_HOST;
>>>>>> +		if (cdns3_is_host(cdns))
>>>>>> +			return CDNS3_ROLE_HOST;
>>>>>> +		if (cdns3_is_device(cdns))
>>>>>> +			return CDNS3_ROLE_GADGET;
>>>>>>  	}
>>>>>>  	return cdns->roles[CDNS3_ROLE_HOST]
>>>>>>  		? CDNS3_ROLE_HOST
>>>>>> @@ -124,6 +127,12 @@ static irqreturn_t cdns3_irq(int irq, void *dat=
a)
>>>>>>  	struct cdns3 *cdns =3D data;
>>>>>>  	irqreturn_t ret =3D IRQ_NONE;
>>>>>>
>>>>>> +	if (cdns->dr_mode =3D=3D USB_DR_MODE_OTG) {
>>>>>> +		ret =3D cdns3_drd_irq(cdns);
>>>>>> +		if (ret =3D=3D IRQ_HANDLED)
>>>>>> +			return ret;
>>>>>> +	}
>>>>>
>>>>> The kernel's shared IRQ model takes care of sharing the same interrup=
t
>>>>> between different devices and their drivers. You don't need to manual=
ly
>>>>> handle it here. Just let all 3 drivers do a request_irq() and have
>>>>> handlers check if the IRQ was theirs or not and return IRQ_HANDLED or
>>>>> IRQ_NONE accordingly.
>>>>>
>>>>> Looks like you can do away with irq member of the role driver struct.
>>>>
>>>> Ok, I will split it into 3 separate part, but in this case, I addition=
ally have to check the current
>>>> role in ISR function. Driver can't read host side registers when contr=
oller works in device role
>>>> and vice versa. One part of controller is kept in reset. Only DRD regi=
sters are common and are all accessible.
>>>>
>>>
>>> In which ISR do you need to check current role?
>>>
>>> I'm not sure if we are on the same page.
>>> Core (drd) driver shouldn't read host/device side registers. All 3 driv=
ers,
>>> i.e. DRD(core), Host (xhci) and device (cdns3) should do a request_irq(=
)
>>> and process their respective IRQ events.
>>
>> Yes, I understand.
>> I need to check this in cdns3_irq_handler_thread and cdns3_host_irq.
>>
>> Core (drd) has register that are always accessible.
>> Core (device)  - registers are available also in device mode
>> Core (host)  - registers  are available only in host mode
>>
>> So we can use separate request_irq  for drd, device and host side, but
>> we need ensure that in host side driver will not touch the device regist=
er.
>
>That should never happen as host side doesn't have visibility to device re=
gisters.

I meant the following scenario:
Assume that controller work in Device role and it raise interrupt for Devic=
e part.=20
Now host is kept in reset.=20
1. System receive interrupt=20
2.  Kernel call drd_irq but this function return IRQ_NONE
3.  Kernel call cdns3_host_irq and driver has to read some interrupt regist=
er to check if=20
     this event is addressed to him. In this moment we can have unknown beh=
avior.=20
4.  Kernel call cdns3_irq_handler  (device). This point probably will not h=
appen because=20
    It could have stuck at point 3.=20

Ok, I think I understood. After changing role, the driver unregisters the i=
nterrupt function
used by previous role so point 3 never happen.=20

I will try to check how it works. =20

>>
>> We doesn't know the order in which  the system will call interrupts func=
tion related to
>>  the shared interrupt line.
>
>Order shouldn't matter. Each user will check its own events return IRQ_NON=
E if they
>didn't cause the IRQ.
>>
>
><snip>
>
>cheers,
>-roger
>
>--
>Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

Thanks,=20
Cheers,
Pawel
