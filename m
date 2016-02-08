From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] Drivers: USB: DA8xx MUSB: added DT support
Date: Mon, 8 Feb 2016 16:32:37 +0100
Message-ID: <56B8B515.5080106@barix.com>
References: <1454693676-20211-1-git-send-email-petr@barix.com>
 <56B67351.1030604@cogentembedded.com> <56B85DB6.9030605@barix.com>
 <56B87A07.1060103@cogentembedded.com> <56B88098.1070309@barix.com>
 <56B8891C.3080409@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B8891C.3080409-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Sergei,

I have prepared the patch as per you comments.
Unfortunately I cannot use the 4.5 kernel from Felipe's repo as the 
of_usb_get_dr_mode() has been replaced with
of_usb_get_dr_mode_by_phy() which requires a PHY node, which does not 
exist for DA8xx as we discussed before.

What shall we do?

Regards
Petr

On 08.02.2016 13:25, Sergei Shtylyov wrote:
> On 2/8/2016 2:48 PM, Petr Kulhavy wrote:
>
>>>    And the patch is against 3.17? You should only submit patches 
>>> against the
>>> recent kernel. In this case, against the -next branch of Felipe's 
>>> repo on
>>> kernel.org.
>>
>> Could you give me the full branch name please.
>
>    See the MAINTAINERS entry for drivers/usb/musb/. The branch is 
> named just 'next'. 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
