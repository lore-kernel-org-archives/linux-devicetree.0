From: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH V12 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller
Date: Fri, 17 Jun 2016 10:13:29 +0530
Message-ID: <57637FF1.9030802@ti.com>
References: <1465000774-7762-1-git-send-email-marex@denx.de>
 <1465000774-7762-2-git-send-email-marex@denx.de> <575F91B2.7010304@ti.com>
 <575FFF97.7040104@denx.de> <57624A98.4060308@ti.com>
 <5762A7E6.8000109@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5762A7E6.8000109-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Thursday 16 June 2016 06:51 PM, Marek Vasut wrote:
> On 06/16/2016 08:43 AM, Vignesh R wrote:
[...]
>>> - I didn't find any way to find when all the data in the current 1 MiB
>>>   block were written and you can remap another 1 MiB block in place.
>>
>> I believe this constraint only applies if enahbremap bit is set in cfg
>> register, if not, then the entire memory map can be accessed.
> 
> And where is that memory window accessible then, at which address ?
> The SoCFPGA peripherals are stuffed in some 12 MiB of the address
> space, the rest is bootrom/sram/ram and the FPGA bridges, so I find
> it hard to believe you can place ie. 128 MiB SPI NOR mapping somewhere
> in there.
> 
> My impression is that in direct mode, the qspi will always overlay the
> address 0x0 on socfpga , but that might be configurable , I'm not sure.
> 

Ah, socfgpa provides just 1MB window to access QSPI_DATA area. So direct
mode may not be practical as it will require remapping.
But, on TI EVM, QSPI_DATA area is 64MB in size, so looks like direct
mode(when added) needs to be tied to TI specific compatible.

-- 
Regards
Vignesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
