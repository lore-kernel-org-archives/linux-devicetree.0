From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V5 0/4] Add Broadcom STB USB phy driver
Date: Tue, 5 Sep 2017 11:41:47 +0530
Message-ID: <f7bb89bf-1a09-891c-4ae5-3dc2e4b38d97@ti.com>
References: <1503683495-11766-1-git-send-email-alcooperx@gmail.com>
 <f4625f5e-db00-ebcc-4618-6f00247edfab@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f4625f5e-db00-ebcc-4618-6f00247edfab-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Florian,

On Saturday 02 September 2017 07:46 AM, Florian Fainelli wrote:
> 
> 
> On 08/25/2017 10:51 AM, Al Cooper wrote:
>> Add a new USB Phy driver for Broadcom STB SoCs. This driver
>> supports Broadcom STB ARM SoCs. This driver in
>> combination with the Broadcom STB ohci, ehci and xhci
>> drivers will enable USB1.1, USB2.0 and USB3.0 support.
>> This Phy driver also supports the Broadcom BDC gadget
>> driver.
> 
> Thanks Al! Kishon, feel free to merge everything through your tree there
> should not be any conflicts with drivers/soc/bcm/brcmstb/common.c and
> include/linux/soc/brcmstb/brcmstb.h.

I'll start merging once 4.14 -rc1 is tagged.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
