From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v7 2/6] usb:common Separated decoding functions from dwc3
 driver.
Date: Mon, 10 Jun 2019 14:57:14 +0300
Message-ID: <f86b1a4a-1400-bdf7-3d01-6010f20af72e@ti.com>
References: <1559729030-16390-1-git-send-email-pawell@cadence.com>
 <1559729030-16390-3-git-send-email-pawell@cadence.com>
 <20190608134008.GB11489@kroah.com>
 <BYAPR07MB4709C42303D60ABF917E22D0DD130@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709C42303D60ABF917E22D0DD130@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org



On 10/06/2019 09:29, Pawel Laszczak wrote:
> 
>> On Wed, Jun 05, 2019 at 11:03:46AM +0100, Pawel Laszczak wrote:
>>
>>> Patch moves some decoding functions from driver/usb/dwc3/debug.h driver
>>
>>> to driver/usb/common/debug.c file. These moved functions include:
>>
>>>     dwc3_decode_get_status
>>
>>>     dwc3_decode_set_clear_feature
>>
>>>     dwc3_decode_set_address
>>
>>>     dwc3_decode_get_set_descriptor
>>
>>>     dwc3_decode_get_configuration
>>
>>>     dwc3_decode_set_configuration
>>
>>>     dwc3_decode_get_intf
>>
>>>     dwc3_decode_set_intf
>>
>>>     dwc3_decode_synch_frame
>>
>>>     dwc3_decode_set_sel
>>
>>>     dwc3_decode_set_isoch_delay
>>
>>>     dwc3_decode_ctrl
>>
>>>
>>
>>> These functions are used also in inroduced cdns3 driver.
>>
>>>
>>
>>> All functions prefixes were changed from dwc3 to usb.
>>
>>> Also, function's parameters has been extended according to the name
>>
>>> of fields in standard SETUP packet.
>>
>>> Additionally, patch adds usb_decode_ctrl function to
>>
>>> include/linux/usb/ch9.h file.i
>>
>>>
>>
>>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>>
>>> ---
>>
>>>  drivers/usb/common/Makefile |   2 +-
>>
>>>  drivers/usb/common/debug.c  | 273 ++++++++++++++++++++++++++++++++++++
>>
>>>  drivers/usb/dwc3/debug.h    | 252 ---------------------------------
>>
>>>  drivers/usb/dwc3/trace.h    |   2 +-
>>
>>>  include/linux/usb/ch9.h     |  25 ++++
>>
>>>  5 files changed, 300 insertions(+), 254 deletions(-)
>>
>>>  create mode 100644 drivers/usb/common/debug.c
>>
>>>
>>
>>> diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
>>
>>> index 0a7c45e85481..02eb01666289 100644
>>
>>> --- a/drivers/usb/common/Makefile
>>
>>> +++ b/drivers/usb/common/Makefile
>>
>>> @@ -4,7 +4,7 @@
>>
>>>  #
>>
>>>
>>
>>>  obj-$(CONFIG_USB_COMMON)	  += usb-common.o
>>
>>> -usb-common-y			  += common.o
>>
>>> +usb-common-y			  += common.o debug.o
>>
>>>  usb-common-$(CONFIG_USB_LED_TRIG) += led.o
>>
>>>
>>
>>>  obj-$(CONFIG_USB_OTG_FSM) += usb-otg-fsm.o
>>
>>> diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
>>
>>> new file mode 100644
>>
>>> index 000000000000..f7218d794aa6
>>
>>> --- /dev/null
>>
>>> +++ b/drivers/usb/common/debug.c
>>
>>> @@ -0,0 +1,273 @@
>>
>>> +// SPDX-License-Identifier: GPL-2.0
>>
>>> +/**
>>
>>> + * Common USB debugging functions
>>
>>> + *
>>
>>> + * Copyright (C) 2010-2011 Texas Instruments Incorporated - https://urldefense.proofpoint.com/v2/url?u=http-
>> 3A__www.ti.com&d=DwIBAg&c=aUq983L2pue2FqKFoP6PGHMJQyoJ7kl3s3GZ-_haXqY&r=e1OgxfvkL0qo9XO6fX1gscva-
>> w03uSYC1nIyxl89-rI&m=hCAftKt20FnC6KiCwNbVrg7WoY-WnCtUjVuast3iJSw&s=Q4qhFXl4s1P2u0s65WgkulIRgV4KZtGphj7Xjr4t6yA&e=
>>
>>> + *
>>
>>> + * Authors: Felipe Balbi <balbi@ti.com>,
>>
>>> + *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>
>>> + */
>>
>>> +
>>
>>> +#ifndef __LINUX_USB_COMMON_DEBUG
>>
>>> +#define __LINUX_USB_COMMON_DEBUG
>>
>>
>>
>> Why are you doing thsi in a .c file?
>>
> Good question, I don't know :). 
> Was removed 
> 
> Also I remember that you complained about placing it in 
> drivers/usb/common. 
> Currently this file is used only by two drivers dwc3 and cdns3.
> Both are USB controller drivers. Maybe it could be better to move it to:
> drivers/gadget/udc/debug.c
> drivers/gadget/debug.c 
> drivers/gadget/common/debug.c
> or
> drivers/gadget/debug/debug.c 
> 
> What do you think Roger? 

Since they are only used by gadget code, I would opt to have it in drivers/usb/gadget/

> 
> Felipe it's also question for you. 
>  
> 
> Thanks,
> Pawel
> 
>>
>>
>> thanks,
>>
>>
>>
>> greg k-h
> 

-- 
cheers,
-roger
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
