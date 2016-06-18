From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 00:54:19 +0200
Message-ID: <8697ff77-218b-2bc6-5d36-bfb02360d223@hauke-m.de>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at> <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
 <5765A4F9.3050107@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5765A4F9.3050107-/L3Ra7n9ekc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/18/2016 09:46 PM, Richard Weinberger wrote:
> Am 18.06.2016 um 21:35 schrieb Hauke Mehrtens:
>> There are some devices on the market that are storing the root file
>> system in an ubi layer.
>> To make this work there are currently two options.
>> 1. patch the kernel to specify which partitions to open in the code.
>> 2. provide some kernel command line parameter which specifies what to open.
>>
>> I would like to specify this in device tree.
> 
> What is wrong with command line parameters? If there is some parameter
> the UBI module misses I'll happily add it.
> You can also put your kernel command line into device tree.

I would like to configure this in device tree. When I install a third
party firmware on a router normally the kernel command line is taken
from the boot loader and the device tree is appended to the kernel.

Hauke
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
