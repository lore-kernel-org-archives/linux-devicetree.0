From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V5 0/4] Add Broadcom STB USB phy driver
Date: Wed, 20 Sep 2017 15:37:21 -0700
Message-ID: <4068eb4a-3982-742f-2b23-28a4b1484de2@gmail.com>
References: <1503683495-11766-1-git-send-email-alcooperx@gmail.com>
 <f4625f5e-db00-ebcc-4618-6f00247edfab@gmail.com>
 <f7bb89bf-1a09-891c-4ae5-3dc2e4b38d97@ti.com>
 <5DDF9572-B2D1-4316-B307-14749365221E@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5DDF9572-B2D1-4316-B307-14749365221E-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On 09/15/2017 04:49 PM, Florian Fainelli wrote:
> On September 4, 2017 11:11:47 PM PDT, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>> Florian,
>>
>> On Saturday 02 September 2017 07:46 AM, Florian Fainelli wrote:
>>>
>>>
>>> On 08/25/2017 10:51 AM, Al Cooper wrote:
>>>> Add a new USB Phy driver for Broadcom STB SoCs. This driver
>>>> supports Broadcom STB ARM SoCs. This driver in
>>>> combination with the Broadcom STB ohci, ehci and xhci
>>>> drivers will enable USB1.1, USB2.0 and USB3.0 support.
>>>> This Phy driver also supports the Broadcom BDC gadget
>>>> driver.
>>>
>>> Thanks Al! Kishon, feel free to merge everything through your tree
>> there
>>> should not be any conflicts with drivers/soc/bcm/brcmstb/common.c and
>>> include/linux/soc/brcmstb/brcmstb.h.
>>
>> I'll start merging once 4.14 -rc1 is tagged.
> 
> OK, does not that mean we will be missing this driver in 4.14? I suppose that's fine. Thanks!

Gentle ping, v4.14-rc1 is now out, can you let us know if this patch
series is good with you? Thanks!
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
