From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Thu, 16 Apr 2015 16:59:31 +0900
Message-ID: <552F6BE3.5080604@samsung.com>
References: <55278DD3.3020409@samsung.com> <55279550.1060609@samsung.com>
 <552CE579.6060702@ti.com> <552CE5C0.3010207@ti.com>
 <552CEC97.1050205@samsung.com> <552CEE42.1050907@ti.com>
 <552CFA1E.5070400@samsung.com> <20150415032734.GA29095@shlinux2>
 <552E1862.6090709@ti.com> <552E2EBF.5090906@samsung.com>
 <20150416015922.GB22269@shlinux2> <552F5E17.5020902@samsung.com>
 <1429168424.26621.1.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1429168424.26621.1.camel-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "Balbi, Felipe" <balbi-l0cyMroinI0@public.gmane.org>, "ABRAHAM, KISHON VIJAY" <kishon-l0cyMroinI0@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/16/2015 04:13 PM, Ivan T. Ivanov wrote:
> Hi,
> 
> On Thu, 2015-04-16 at 16:00 +0900, Chanwoo Choi wrote:
>> Hi Peter,
>>
>> On 04/16/2015 10:59 AM, Peter Chen wrote:
>>>
> 
>>> Ok, from USB point, external id/vbus value can't decide
>>> which role the controller will be, the controller driver
>>> will decide role according to many things, eg, user configurations,
>>> id/vbus value, OTG HNP, etc.
>>>
>>> So, from USB controller/phy driver, it doesn't care which cable is
>>> inserted, it cares about id/vbus value. Eg, it can get id/vbus value
>>> and it will be notified when the id/vbus value has changed.
>>
>> OK, I change the notifier name and add notifier events as following:
>>
>> - extcon_{register|unregister}_usb_notifier(struct extcon_dev *edev, struct notifier_block *nb);
>> - list of notifier events
>>         #define EXTCON_USB_ID_L_VBUS_L0       /* ID low  and VBUS low */
>>         #define EXTCON_USB_ID_L_VBUS_H1       /* ID low  and VBUS high */
>>         #define EXTCON_USB_ID_H_VBUS_L2       /* ID high and VBUS low */
>>         #define EXTCON_USB_ID_H_VBUS_H3       /* ID high and VBUS high */
> 
> I am still confused, why we mix ID and VBUS events into one? 
> Those are two lines and they are not necessarily handled by
> the same extcon_dev.

IMO, if some usb driver check both id and vbus pin at the same time,
the usb driver can know the both id and vbus pin state through only one notifier event.

Also,
If some usb driver want to know the state of id pin except of vbus state,
when receiving following events, id pin is low.
	#define EXTCON_USB_ID_L_VBUS_L0
	#define EXTCON_USB_ID_L_VBUS_H1
when receiving following events, id pin is high.
	#define EXTCON_USB_ID_H_VBUS_L2
	#define EXTCON_USB_ID_H_VBUS_H3
Also, some usb driver would catch the vbus pin state with same method.

But, it is just my opinion. We may use following notifier events for each pin.
We need to discuss it.
	#define EXTCON_USB_ID_LOW
	#define EXTCON_USB_ID_HIGH	
	#define EXTCON_USB_VBUS_LOW
	#define EXTCON_USB_VBUS_HIGH
	







--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
