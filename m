From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Thu, 11 Feb 2016 21:35:01 +0300
Message-ID: <56BCD455.3080805@cogentembedded.com>
References: <1455188466-10879-1-git-send-email-petr@barix.com>
 <56BC925F.6010809@cogentembedded.com> <56BCA243.4010507@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56BCA243.4010507-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/11/2016 06:01 PM, Petr Kulhavy wrote:

>>> +        ti,phy20-clkmux-pll;
>>> +        ti,phy20-refclock-frequency = <24000000>;
>>
>>    In principle these 2 should belong to the USB PHY subnode...
>
> Do you mean to define a PHY subnode even if there is currently no standalone
> PHY driver for da8xx?

    Actually, USB PHY shouldn't be a subnode for MUSB (different register 
spaces), so nevermind. Sorry, just a stereotype from Ethernet where the MAC 
often includes MDIO-related registers...

> Petr

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
