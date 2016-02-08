From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] Drivers: USB: DA8xx MUSB: added DT support
Date: Mon, 8 Feb 2016 16:49:50 +0300
Message-ID: <56B89CFE.5030306@cogentembedded.com>
References: <1454693676-20211-1-git-send-email-petr@barix.com>
 <56B67351.1030604@cogentembedded.com> <56B85DB6.9030605@barix.com>
 <56B87A07.1060103@cogentembedded.com> <56B88098.1070309@barix.com>
 <56B8891C.3080409@cogentembedded.com> <56B88ED5.9000104@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B88ED5.9000104-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/08/2016 03:49 PM, Petr Kulhavy wrote:

>>    As for the mode and power, I agree -- they are part of the board-specific
>> platform data (there's also power-on-to-power-good delay BTW which you missed).
>>
> I've also noticed the potpgt it in the platform driver. However the musb
> doesn't seem to use it, it's used by the ohci-da8xx driver.I will do.

    Indeed, it's not used and that probably should be fixed...

>>> Why doesn't the musb core use directly the USB_DR_MODE_xxx literals
>>> instead?
>>
>>    MUSB driver predates these (DT specific?) definitions IIRC...
 >>
> Would it make sense to replace it with the newer USB_DR_MODE_xxx ?

    Well, if you want to take on this task, ask Felipe, he's the maintainer...

> Petr

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
