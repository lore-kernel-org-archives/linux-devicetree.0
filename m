From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Thu, 30 Apr 2015 11:04:00 +0300
Message-ID: <5541E1F0.6080503@ti.com>
References: <552CEC97.1050205@samsung.com> <552CEE42.1050907@ti.com> <552CFA1E.5070400@samsung.com> <20150415032734.GA29095@shlinux2> <552E1862.6090709@ti.com> <552E2EBF.5090906@samsung.com> <20150416015922.GB22269@shlinux2> <552F5E17.5020902@samsung.com> <1429168424.26621.1.camel@mm-sol.com> <552F6BE3.5080604@samsung.com> <20150416080107.GC1709@shlinux2> <552F724A.1050500@samsung.com> <5541DAA0.7030200@ti.com> <5541DFEA.8060109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5541DFEA.8060109@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Peter Chen <peter.chen@freescale.com>, Robert Baldyga <r.baldyga@samsung.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, "Balbi, Felipe" <balbi@ti.com>, "ABRAHAM, KISHON VIJAY" <kishon@ti.com>, myungjoo.ham@samsung.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

On 30/04/15 10:55, Chanwoo Choi wrote:
> On 04/30/2015 04:32 PM, Roger Quadros wrote:
>> On 16/04/15 11:26, Chanwoo Choi wrote:
>>> On 04/16/2015 05:01 PM, Peter Chen wrote:
>>>> On Thu, Apr 16, 2015 at 04:59:31PM +0900, Chanwoo Choi wrote:
>>>>> On 04/16/2015 04:13 PM, Ivan T. Ivanov wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Thu, 2015-04-16 at 16:00 +0900, Chanwoo Choi wrote:
>>>>>>> Hi Peter,
>>>>>>>
>>>>>>> On 04/16/2015 10:59 AM, Peter Chen wrote:
>>>>>>>>
>>>>>>
>>>>>>>> Ok, from USB point, external id/vbus value can't decide
>>>>>>>> which role the controller will be, the controller driver
>>>>>>>> will decide role according to many things, eg, user configurations,
>>>>>>>> id/vbus value, OTG HNP, etc.
>>>>>>>>
>>>>>>>> So, from USB controller/phy driver, it doesn't care which cable is
>>>>>>>> inserted, it cares about id/vbus value. Eg, it can get id/vbus value
>>>>>>>> and it will be notified when the id/vbus value has changed.
>>>>>>>
>>>>>>> OK, I change the notifier name and add notifier events as following:
>>>>>>>
>>>>>>> - extcon_{register|unregister}_usb_notifier(struct extcon_dev *edev, struct notifier_block *nb);
>>>>>>> - list of notifier events
>>>>>>>         #define EXTCON_USB_ID_L_VBUS_L0       /* ID low  and VBUS low */
>>>>>>>         #define EXTCON_USB_ID_L_VBUS_H1       /* ID low  and VBUS high */
>>>>>>>         #define EXTCON_USB_ID_H_VBUS_L2       /* ID high and VBUS low */
>>>>>>>         #define EXTCON_USB_ID_H_VBUS_H3       /* ID high and VBUS high */
>>>>>>
>>>>>> I am still confused, why we mix ID and VBUS events into one? 
>>>>>> Those are two lines and they are not necessarily handled by
>>>>>> the same extcon_dev.
>>>>>
>>>>> IMO, if some usb driver check both id and vbus pin at the same time,
>>>>> the usb driver can know the both id and vbus pin state through only one notifier event.
>>>>>
>>>>> Also,
>>>>> If some usb driver want to know the state of id pin except of vbus state,
>>>>> when receiving following events, id pin is low.
>>>>> 	#define EXTCON_USB_ID_L_VBUS_L0
>>>>> 	#define EXTCON_USB_ID_L_VBUS_H1
>>>>> when receiving following events, id pin is high.
>>>>> 	#define EXTCON_USB_ID_H_VBUS_L2
>>>>> 	#define EXTCON_USB_ID_H_VBUS_H3
>>>>> Also, some usb driver would catch the vbus pin state with same method.
>>>>>
>>>>> But, it is just my opinion. We may use following notifier events for each pin.
>>>>> We need to discuss it.
>>>>> 	#define EXTCON_USB_ID_LOW
>>>>> 	#define EXTCON_USB_ID_HIGH	
>>>>> 	#define EXTCON_USB_VBUS_LOW
>>>>> 	#define EXTCON_USB_VBUS_HIGH
>>>>> 	
>>>>
>>>> I agree with above definition.
>>>>
>>>
>>> OK. I understand.
>>>
>>>
>> Chanwoo, Robert,
>>
> 
> Hi Roger,
> 
>> Do we have an agreement on a common solution then?
> 
> Yes.
> 
>> IMO the above mentioned 4 notifier events should meet all our USB needs.
> 
> I'll support usb notifier chain which includes 4 notifier events.

Great, then Robert can base his patches on that. Thanks.

cheers,
-roger
