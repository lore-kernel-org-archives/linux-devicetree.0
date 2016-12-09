From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed
 SoCs
Date: Fri, 9 Dec 2016 11:42:09 +0100
Message-ID: <784fec66-08e6-0176-6d5b-ae445b5c5b14@kaod.org>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
 <bc14b6ba-800c-bf69-763e-65ead8d4efa7@gmail.com>
 <cd9a46ac-049f-e6b8-586c-d386f6012a51@kaod.org>
 <6d1bb5a6-3a99-3320-297b-311d359294f6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6d1bb5a6-3a99-3320-297b-311d359294f6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/09/2016 03:29 AM, Marek Vasut wrote:
> On 12/08/2016 05:36 PM, Cédric Le Goater wrote:
>> Hello Marek,
> 
> Hi!


Hello Hello,

[...]

>>>> +	/*
>>>> +	 * Read the existing control register to get basic values.
>>>> +	 *
>>>> +	 * XXX This register probably needs more sanitation.
>>>
>>> What's this comment about ?
>>
>> This is an initial comment about settings being done by U-Boot
>> before the kernel is loaded, and some optimisations should be 
>> nice to keep, for the FMC controller. I will rephrase.
> 
> Shouldn't that be passed via DT instead ? We want to be bootloader
> agnostic in Linux.

Yes, clearly, Linux should do its own timing calibration and not depend 
on the bootloader but I am not sure how to do that correctly, yet, in 
the driver for all controllers. It depends on the controller type and 
a lot on the flash model being used, which can vary for the same board. 

U-Boot uses specific registers of the FMC controller to evaluate the 
best SPI clock frequency. So, for the moment, keeping the previous 
setting for :

    bits [11:8]  SPI clock frequency selection

is a nice thing to have. we can replace this setting when calibration 
is handled from Linux.

The SPI controllers are different, they don't have the specific registers 
for calibration, and so the algo is bit more painful.

> btw off-topic, but is U-Boot support for these aspeed devices ever 
> be upstreamed ?

It is the plan to. 

This year, we have spent quite sometime porting, fixing, cleaning 
up the original code and getting ready to send a minimal framework, 
cpu and console, to mainline (flash and net drivers can come later). 
The code is operational on various boards but there is a major task 
we have not completed yet, which is to rewrite the 2/3 KLOC of 
assembly doing the DDR initialization :/ Once this is done, we 
should send.

Here is the tree we use on OpenBMC :

    https://github.com/openbmc/u-boot/commits/v2016.07-aspeed-openbmc

and a more recent branch with some extra cleanups :

    https://github.com/legoater/u-boot/commits/v2016.11-aspeed-openbmc

Thanks,

C.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
