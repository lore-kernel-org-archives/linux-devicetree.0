From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed
 SoCs
Date: Mon, 28 Nov 2016 19:21:19 +0100
Message-ID: <b5aabac4-ddd2-38c3-a5a7-d1b56274230d@gmail.com>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
 <bc14b6ba-800c-bf69-763e-65ead8d4efa7@gmail.com>
 <CACPK8Xc7Dy=4oaZ_+j3hCEkMY+sqZ_-QkCQ9okmUoOjTpuZvvA@mail.gmail.com>
 <9569aaca-5748-e82d-20e1-ed846fb762f6@gmail.com>
 <b9d8ba33-2bb9-cb93-d833-89ddd8cfd7f9@kaod.org>
 <c35d6a7a-1c77-1884-4ed4-aee161bd0e43@gmail.com>
 <9ad102a7-8d78-efef-8adb-62cad75f0034@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9ad102a7-8d78-efef-8adb-62cad75f0034-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/28/2016 07:09 PM, Cédric Le Goater wrote:
> Hello,
> 
>>> Aspeed SoC AST2400 has a set of SMC (Static Memory Controller) 
>>> controllers in which you find :
>>>
>>> - Legacy Static Memory Controller (called SMC in the spec)  
>>>   . base address at 0x16000000
>>>   . BMC firmware
>>>   . old register set
>>>   . supports NOR flash, NAND flash and SPI flash memory. All bootable.
>>>   . 1 chip select pin (CE0)
>>>
>>> - New Static Memory Controller (called FMC in the spec)
>>>   . base address at 0x16200000
>>>   . BMC firmware
>>>   . new register set
>>>   . supports NOR flash, NAND flash and SPI flash memory. 
>>>   . 5 chip select pins (CE0 ∼ CE4)
>>>
>>> - SPI Flash Controller (called SPI in the spec)  
>>>   . base address at 0x16300000
>>>   . host Firmware
>>>   . exotic register set, between old and new ...
>>>   . supports SPI flash memory
>>>   . 1 chip select pin (CE0)
>>
>> This should be (except for the base address) be in some documentation,
>> it helps.
> 
> Sure. I will add that.
> 
>>> Aspeed SoC AST2500 defines has a similar set of SMC (Static Memory 
>>> Controller) controllers, more in the vein of the AST2400 FMC  :
>>>
>>> - Legacy Static Memory Controller is gone, NOR and NAND support also
>>>
>>> - Firmware SPI Memory Controller (called FMC in the spec)  
>>>   . base address at 0x16200000
>>>   . BMC firmware
>>>   . new register set
>>>   . supports SPI flash memory.
>>>   . 3 chip select pins (CE0 ~ CE2)
>>>
>>> - SPI Flash Controller (called SPI1 in the spec) first
>>>   . base address at 0x16300000
>>>   . host firmware
>>>   . new register set
>>>   . supports SPI flash memory.
>>>   . 2 chip select pins (CE0 ~ CE1)
>>>
>>> - SPI Flash Controller (called SPI2 in the spec) second
>>>   . base address at 0x16310000
>>>   . host firmware
>>>   . new register set
>>>   . supports SPI flash memory.
>>>   . 2 chip select pins (CE0 ~ CE1)
>>>
>>>
>>> So, these are the reasons behind the naming mess. Added to that the 
>>> driver considers the acronym SMC to stand for SPI Memory Controller, 
>>> which is wrong. I tried to reduce the confusion with some comments but 
>>> that was a failure :)
>>
>> The explanation above is awesome though.
>>
>>> In qemu, we have used FMC (Firmware ...) and SPI to name the controllers 
>>> and we just dropped the legacy SMC. I think using the same naming scheme
>>> is a good idea. We don't support anything else than SPI either so we can 
>>> drop the other types for the moment.
>>
>> One thing which I still ponder about is how do you support those
>> controllers which support NOR and NAND flash and SPI, do you tap
>> into all subsystems ?
> 
> Aspeed dropped support for NAND and NOR flash in the AST2500 SoC, 
> all controllers are SPI only and the AST2400 boards we have also 
> only use SPI. So we did not consider the other flash flavors for 
> the driver even though some board might use it, but I don't know
> that.

So we cross that bridge when we come to it ? Hm, that could work.
Please be sure to explicitly state you only support the SPI mode
of operation in documentation.

Thanks!

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
