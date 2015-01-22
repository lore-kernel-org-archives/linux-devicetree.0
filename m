From: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH mtd] mtd:devices: Add Altera EPCQ Driver
Date: Thu, 22 Jan 2015 10:56:57 +0800
Message-ID: <CAN1oZWwBb3nWDKcwFmDD1kc94mxCWBz+O-nUnZdByYsfZSTtCQ@mail.gmail.com>
References: <CAN1oZWxB5N=YMQcsJppZgp7TXodcR4tKZM+LNFXS7PSx3F-Yag@mail.gmail.com>
	<CAN1oZWzeev-1uE7gxPnJA=L4Th65CRj8C_LQ7hMJLPHGssDjNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAN1oZWzeev-1uE7gxPnJA=L4Th65CRj8C_LQ7hMJLPHGssDjNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 20, 2015 at 10:05 AM, Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrote:
> On Thu, Jan 15, 2015 at 5:27 PM, Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrote:
>> On Tue, Jan 13, 2015 at 11:33 AM, Brian Norris
>> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On Thu, Dec 18, 2014 at 12:23:16AM -0800, vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
>>>> From: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> Altera EPCQ Controller is a soft IP which enables access to Altera EPCQ and
>>>> EPCS flash chips. This patch adds driver for these devices.
>>>>
>>>> Signed-off-by: Viet Nga Dao <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>>>
>>> This drivers seems awfully similar to (and so I infer it is likely
>>> copy-and-pasted from) m25p80.c / spi-nor.c. Do you think it can be
>>> rewritten as a SPI NOR driver, under drivers/mtd/spi-nor/ ? It looks
>>> like these flash share most (all?) the same basic opcodes.
>>>
>> For Altera EPCQ flashes, almost operations are performed underline
>> hardware. Software only able to perform the following through
>> registers:
>>  -  read status register
>>  -  read id
>>  -  write status registers bit SR_BP0,SR_BP1, SR_BP2,SR_BP3, SR_TB
>> (http://www.altera.com.my/literature/hb/cfg/cfg_cf52012.pdf)
>> For read/write data: all the operations like QUAD_READ/WRITE,
>> FAST_READ/WRITE are handled by hardware as well. From software point
>> of view, there is no difference between these 2 modes.
>> That is why if rewrite the drivers to follow spi-nor structure, it
>> will require extra decoding works for the only few used opcodes.
>>
> Is it OK to remain this driver structure?
Can someone please reply my question as it is been a while?
Viet Nga
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
