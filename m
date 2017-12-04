From: Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4] usb: xhci: allow imod-interval to be configurable
Date: Mon, 4 Dec 2017 10:48:45 -0500
Message-ID: <2b252975-bf1f-7468-071e-f4a4aa2430a0@codeaurora.org>
References: <1512397671-28733-1-git-send-email-awallis@codeaurora.org>
 <9cb2e5fc-1bec-c19c-c04e-fe56e5c1bc16@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9cb2e5fc-1bec-c19c-c04e-fe56e5c1bc16-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Timur

On 12/4/2017 9:58 AM, Timur Tabi wrote:
> On 12/4/17 8:27 AM, Adam Wallis wrote:
>> If no interval is specified, the default of 40,000ns (IMOD=160) will be
>> used.
> 
> ...
> 
>> + - imod-interval-ns: default interrupt moderation interval is 5000ns
> 
> ...
> 
>> +  - imod-interval-ns: default interrupt moderation interval is 5000ns
> 
> ...
> 
>> +    xhci->imod_interval = 5000;
> 
> ...
> 
>> +    xhci->imod_interval = 40000;
> 
> ...
> 
>> +    xhci->imod_interval = 40000;
> 
> Is the default 5,000 or 40,000?  I can't tell.
> 
As noted in the patch description, xhci-plat devices will use a default of
40,000, while MTK devices will use a default of 5,000. This is also documented
in the probe for each relevant driver. This is further confirmed in the
description for each driver's binding TXT file.

Adam

-- 
Adam Wallis
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
