From: Adam Wallis <awallis-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4] usb: xhci: allow imod-interval to be configurable
Date: Tue, 5 Dec 2017 18:50:01 -0500
Message-ID: <7df62698-d27f-a7fc-f61e-60586c16f14b@codeaurora.org>
References: <1512397671-28733-1-git-send-email-awallis@codeaurora.org>
 <1512440100.17567.172.camel@mhfsdcap03>
 <99ea0ee4-1fff-73df-d9b5-0f756dfc5635@codeaurora.org>
 <f5ca26d2-9432-2ae3-7501-5b3dcf1e1486@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f5ca26d2-9432-2ae3-7501-5b3dcf1e1486-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob,

On 12/5/2017 3:48 AM, Mathias Nyman wrote:
> On 05.12.2017 04:54, Adam Wallis wrote:
>> On 12/4/2017 9:15 PM, Chunfeng Yun wrote:
>>> On Mon, 2017-12-04 at 09:27 -0500, Adam Wallis wrote:
>>>> The xHCI driver currently has the IMOD set to 160, which
[..]
> 
> If Rob Acks this version I'll apply it and remove that blank line.
> 
> -Mathias
> 

Let me know if you have any other issues with this patch, otherwise with your
ACK, we are done.

Thanks

Adam

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- 
Adam Wallis
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
