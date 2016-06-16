From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V12 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller
Date: Thu, 16 Jun 2016 15:21:42 +0200
Message-ID: <5762A7E6.8000109@denx.de>
References: <1465000774-7762-1-git-send-email-marex@denx.de> <1465000774-7762-2-git-send-email-marex@denx.de> <575F91B2.7010304@ti.com> <575FFF97.7040104@denx.de> <57624A98.4060308@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57624A98.4060308-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/16/2016 08:43 AM, Vignesh R wrote:
> 
> 
> On Tuesday 14 June 2016 06:29 PM, Marek Vasut wrote:
> 
>>> I was wondering if its better to use direct access mode[1].
>>
>> The link leads to altera documentation front page, but I have an idea
>> what you mean. You might want to refer to [2] instead.
>>
>> [2] https://www.altera.com/en_US/pdfs/literature/hb/cyclone-v/cv_5v4.pdf
>>
> 
> My link was suppose to point to html edition of above document.

Ah, OK.

>>> With this
>>> mode there is no need to wait for IRQ or monitor sdram level. By setting
>>> up QSPI in direct access mode, this entire function can be replaced by:
>>> memcpy(buf, cqspi->ahb_base + from, n_rx)
>>
>> The altera docs, page 993, show how to use the direct access mode. The
>> idea is to map 1 MiB blocks of the flash in the address space, one at a
>> time and then do IO into those. I don't like such solution:
>>
>> - I didn't find any way to find when all the data in the current 1 MiB
>>   block were written and you can remap another 1 MiB block in place.
> 
> I believe this constraint only applies if enahbremap bit is set in cfg
> register, if not, then the entire memory map can be accessed.

And where is that memory window accessible then, at which address ?
The SoCFPGA peripherals are stuffed in some 12 MiB of the address
space, the rest is bootrom/sram/ram and the FPGA bridges, so I find
it hard to believe you can place ie. 128 MiB SPI NOR mapping somewhere
in there.

My impression is that in direct mode, the qspi will always overlay the
address 0x0 on socfpga , but that might be configurable , I'm not sure.

>> - Since the controller doesn't use the internal buffer in direct
>>   operation mode, it will block the AHB bus during it's operation.
> 
> I agree, this is a disadvantage.
> 
>> - I didn't find how IO errors get handled in this case, but maybe I
>>   didn't drill deep enough on this one.
>>
>> Moreover, page 991 bottom of [2] states that the indirect mode is
>> "high-performance". I am inclined to believe that as it uses the
>> internal buffer of the QSPI controller, which is tightly coupled to the
>> block,
>> so the data are available immediately when the flash is ready instead
>> of having to wait for the next AHB turn.
>>
> 
> Indirect mode may be the better option when using DMA. But, my thinking
> was that, for CPU copy, the interrupt overhead and the fact that sdram
> level needs to be monitored constantly might affect throughput badly
> while using indirect mode.

Ah yeah, that's true, that's a good point. I was also pondering if the
controller doesn't generate way too many interrupts.

>> My impression is that the Direct mode is great when the system boots
>> from the QSPI because it can "map" the flash and just execute code from
>> it. But for normal operation, the indirect mode seems the better choice.
>>
>>> IMO, this might give better throughput. Have tested this mode?
>>
>> I haven't tested it, no.
>>
> 
> Anyways, direct mode support can be added (if required) at later point
> of time. I have no objection for current approach as such.

OK, thanks!

> Thanks for the reply!
> 
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
