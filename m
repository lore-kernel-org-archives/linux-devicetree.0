From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] Drivers: USB: DA8xx MUSB: added DT support
Date: Tue, 9 Feb 2016 13:50:19 +0300
Message-ID: <56B9C46B.30708@cogentembedded.com>
References: <1454693676-20211-1-git-send-email-petr@barix.com>
 <56B67351.1030604@cogentembedded.com> <56B85DB6.9030605@barix.com>
 <56B87A07.1060103@cogentembedded.com> <56B88098.1070309@barix.com>
 <56B8891C.3080409@cogentembedded.com> <56B8B515.5080106@barix.com>
 <56B8D676.1050809@cogentembedded.com> <56B9A3C1.4000600@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B9A3C1.4000600-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2/9/2016 11:30 AM, Petr Kulhavy wrote:

>>> I have prepared the patch as per you comments.
>>> Unfortunately I cannot use the 4.5 kernel from Felipe's repo as the
>>> of_usb_get_dr_mode() has been replaced with
>>> of_usb_get_dr_mode_by_phy() which requires a PHY node, which does not exist
>>> for DA8xx as we discussed before.
>>>
>>> What shall we do?
>>
>>    Doesn't usb_get_dr_mode() work for you?
>
> I can't really say because I can't test it. Is this the replacement for
> of_usb_get_dr_mode() ?

    Seems so. The call in musb_dsps.c was just replaced.

> Thanks
> Petr

MNR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
