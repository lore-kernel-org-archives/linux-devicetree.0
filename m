From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Wed, 10 Feb 2016 17:17:33 +0100
Message-ID: <56BB629D.2040209@denx.de>
References: <1452486886-8049-1-git-send-email-marex@denx.de> <201602060842.38290.marex@denx.de> <56B879BD.2070608@ti.com> <201602081627.57666.marex@denx.de> <56BB60F1.9070306@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56BB60F1.9070306-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/10/2016 05:10 PM, Graham Moore wrote:
> On 02/08/2016 09:27 AM, Marek Vasut wrote:
>> On Monday, February 08, 2016 at 12:19:25 PM, Vignesh R wrote:
>>> On 02/06/2016 01:12 PM, Marek Vasut wrote:
>>>> On Thursday, February 04, 2016 at 06:30:27 PM, R, Vignesh wrote:
>>>>> On 2/4/2016 4:55 PM, Marek Vasut wrote:
>>> [...]
>>>
>>>>> Yeah, there is delay(of few ns) required between writing to
>>>>> INDIRECTWR_START bit and actually writing data to flash(i.e writesl()
>>>>> call). This is specific to TI K2G SoC and needs to be tied to the new
>>>>> binding.
>>>>
>>>> Can't you somehow poll the hardware to check whether or not it's ready
>>>> instead of adding some random delay ?
>>>
>>> There is no dedicated register to poll as such.
>>>
>>> According to TRM:
>>> "Wait for couple of cycles of QSPI_REF_CLK(functional clock of QSPI
>>> @384MHz) until CQSPI_REG_INDIRECTWR[0] bit is internally synchronized by
>>> the QSPI module before writing to flash".
>>>
>>> So, a few ns(~6ns @384MHz) delay is needed (or accessing a QSPI module
>>> register should be sufficient as it will take more than 2 clock cycles).
>>> I believe this delay is specific to TI K2G SoC and maybe needs to be
>>> tied to the binding.
>>
>> OK, got it. Dinh/Graham, can you check if this might be needed on
>> SoCFPGA too
>> please?
>>
> 
> I don't see any such requirement in the data sheet.  It's working
> without it.  So I think it's not needed on SoCFPGA

All right, so we will just add a special property or compat string for
the TI SoC. But we need to get this driver mainlined first :)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
