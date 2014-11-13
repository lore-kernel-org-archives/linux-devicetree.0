From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] DT: watchdog: Add ImgTec PDC Watchdog Timer binding documentation
Date: Thu, 13 Nov 2014 11:07:52 -0800
Message-ID: <CAL1qeaHEGZWs8PPrX5cNpUWXDL3D_5Y2w772eKBEO0G+5q_p-g@mail.gmail.com>
References: <1415805483-26268-1-git-send-email-Naidu.Tellapati@imgtec.com>
	<1415805483-26268-3-git-send-email-Naidu.Tellapati@imgtec.com>
	<CAL1qeaHrjccd4KYAUMvWEKqhM9DFNyKWE=-2k0ux+76XR+Q5tQ@mail.gmail.com>
	<89F3BC60EA3A0141B1F6C2A661D95E5E3F192BAA@hbmail01.hb.imgtec.org>
	<5464AD4B.1000509@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5464AD4B.1000509-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org" <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 13, 2014 at 5:08 AM, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> On 13/11/14 12:58, Jude Abraham wrote:
>> On Wed, Nov 12, 2014 at 7:18 AM,  <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
>>>> diff --git a/Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt
>
>>>> +- interrupts : Should contain WDT interrupt
>>
>>>  Not sure the interrupt will really be necessary.
>>
>> Ok, We will remove the interrupt.
>
> Regardless, there is still an interrupt line coming out of the WDT and
> interrupt status/clear/enable registers for the single reminder
> interrupt. IMO it makes sense to describe it in DT even if the driver
> doesn't [yet] make use it.

Yes, you're right.  Even if we don't currently use the interrupt, it's
a correct description of the hardware.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
