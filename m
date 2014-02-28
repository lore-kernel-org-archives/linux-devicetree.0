From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] dma: of: Move the functions under CONFIG_OF_DMA instead
 of CONFIG_OF
Date: Fri, 28 Feb 2014 10:25:15 -0500
Message-ID: <5310AA5B.3000309@ti.com>
References: <1393546850-13907-1-git-send-email-santosh.shilimkar@ti.com> <5615884.O4eVkOuQqe@wuerfel> <5310A52E.90908@ti.com> <5164707.sdmWv7EuCX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5164707.sdmWv7EuCX@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 28 February 2014 10:21 AM, Arnd Bergmann wrote:
> On Friday 28 February 2014 10:03:10 Santosh Shilimkar wrote:
>>> As of 5fa422c922c25 "dmaengine: move drivers/of/dma.c -> drivers/dma/of-dma.c"
>>>
>>> which seems to solve the problem already.
>>>
>>>> I am not sure but we added couple of functions for dma-ranges
>>>> and dma-coherent which gets called from generic code.
>>>
>>> These functions have nothing to do with the dmaengine code though,
>>> they should be in a different file.
>>>
>> Any suggestion on different file ?
>  
> drivers/of/platform.c would be my first choice. Possibly a new
> drivers/of/dma-mapping.c.
> 
'drivers/of/platform.c' sounds good.
Regards,
Santosh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
