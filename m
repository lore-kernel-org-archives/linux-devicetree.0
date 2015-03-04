From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [version 2]  amba uarts - arm type uarts fifo size provided by
 device tree
Date: Wed, 04 Mar 2015 15:52:59 -0500
Message-ID: <54F770AB.8090004@linaro.org>
References: <1424290069-8760-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <20150303165534.GB10239@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150303165534.GB10239@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/03/2015 11:55 AM, Mark Rutland wrote:
> On Wed, Feb 18, 2015 at 08:07:47PM +0000, Jorge Ramirez-Ortiz wrote:
>> [PATCH 1/2] Documentation: bindings: add optional fifo size property
>> [PATCH 2/2] drivers/tty: pl011: read fifo size from OF if present [updated]
>>
>> These patches aim at resolving an issue present on some of the amba pl011 uarts.
>>
>> They were developed for the Hisilicon Hi6220 SoC where the fifo size on the
>> uarts is 64 despite the amba revision having been set to 1. 
> Are we certain that the FIFO length is the only difference between the
> HI6220 PL011 and a regular PL011?

I am trying to get an answer from the hardware designers.

>
> It may be worth adding a compatible string in addition, just in case.
>
> Mark.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
