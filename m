From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed
 SoCs
Date: Mon, 14 Nov 2016 19:42:07 +0100
Message-ID: <6be81da8-84e2-4208-94d7-c0517920b5c4@gmail.com>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
 <CACPK8Xc=AcA=d+O++W07ki+KkCxA86EnXj7dqTRobTpb9WQbUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8Xc=AcA=d+O++W07ki+KkCxA86EnXj7dqTRobTpb9WQbUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/11/2016 05:42 AM, Joel Stanley wrote:
> On Wed, Nov 9, 2016 at 9:12 PM, Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:
>> This driver adds mtd support for spi-nor attached to either or both of
>> the Firmware Memory Controller or the SPI Flash Controller (AST2400
>> only).
>>
>> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
>> ones found on the AST2400. The differences are on the number of
>> supported flash modules and their default mappings in the SoC address
>> space.
>>
>> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
>> for the host firmware. All controllers have now the same set of
>> registers compatible with the AST2400 FMC controller and the legacy
>> 'SMC' controller is fully gone.
>>
>> Each controller has a memory range on which it maps its flash module
>> slaves. Each slave is assigned a memory window for its mapping that
>> can be changed at bootime with the Segment Address Register.
>>
>> Each SPI flash slave can then be accessed in two modes: Command and
>> User. When in User mode, accesses to the memory segment of the slaves
>> are translated in SPI transfers. When in Command mode, the HW
>> generates the SPI commands automatically and the memory segment is
>> accessed as if doing a MMIO.
>>
>> Currently, only the User mode is supported. Command mode needs a
>> little more work to check that the memory window on the AHB bus fits
>> the module size.
>>
>> Based on previous work from Milton D. Miller II <miltonm-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
>>
>> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
>> ---
>>  Tested on:
>>
>>  * OpenPOWER Palmetto (AST2400) with
>>         FMC controller : n25q256a
>>         SPI controller : mx25l25635e and n25q512ax3
>>
>>  * Evaluation board (AST2500) with
>>         FMC controller : w25q256
>>         SPI controller : w25q256
>>
>>  * OpenPOWER Witherspoon (AST2500) with
>>         FMC controller : mx25l25635e * 2
>>         SPI controller : mx66l1g45g
> 
> It's also in use on the Zaius and Barreleye OpenBMC systems.
> 
> In that respect, I would like to see this merged once it's deemed
> ready by the mtd maintainers. We can follow up with the extra features
> in future patches.
> 
> I've reviewed and tested this as Cedric and Milton have developed it,
> so please add:
> 
> Reviewed-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> 

Thanks! I'll review the patch ASAP (this week).

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
