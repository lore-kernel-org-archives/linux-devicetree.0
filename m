From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: add driver for STM32 quad spi flash
 controller
Date: Wed, 29 Mar 2017 15:57:38 +0200
Message-ID: <0e7da44f-c41b-de15-62c3-7509e556f623@gmail.com>
References: <1490619296-8168-1-git-send-email-ludovic.Barre@st.com>
 <1490619296-8168-3-git-send-email-ludovic.Barre@st.com>
 <1be39452-83b0-5c32-39fe-d6dd5134d1ef@gmail.com>
 <2c364b99-512c-8eb6-7044-7989ba21d53b@st.com>
 <28454969-0f56-7752-b087-5e02a1a20c23@gmail.com>
 <2410fcde-1d1d-57b5-01ee-bd6bc3bc863b@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2410fcde-1d1d-57b5-01ee-bd6bc3bc863b@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic BARRE <ludovic.barre@st.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/29/2017 03:35 PM, Ludovic BARRE wrote:

[...]

>>>>> +    writel_relaxed(CR_PRESC(presc) | CR_FTHRES(3) | CR_TCEN |
>>>>> CR_SSHIFT
>>>>> +               | CR_EN, qspi->io_base + QUADSPI_CR);
>>>>> +
>>>>> +    /* a minimum fsize must be set to sent the command id */
>>>>> +    flash->fsize = 25;
>>>> I don't understand why this is needed and the comment doesn't make
>>>> sense. Please fix.
>>> fsize field defines the size of external memory.
>> What external memory ? Unclear
> oops, fsize field defined the size of "flash memory" in stm32 qspi
> controller.

Errr, now I am totally lost :) Is that some internal SPI NOR ? Shouldn't
the size be coming from DT or something ?

> Number of bytes in Flash memory = 2 ^[FSIZE+1].
> To sent a nor cmd this field must be set (hardware issue),
> but before "spi_nor_scan" the size of flash nor is not know.
> So I set a temporary value (workaround).

Is it needed before the scan ?

> After "spi_nor_scan" the fsize is overwritten by the right value
> flash->fsize = __fls(mtd->size) - 1;
>>> Normaly, this field is used only for memory map mode,
>>> but in fact is check in indirect mode.
>>> So while flash scan "spi_nor_scan":
>>> -I can't let 0.
>>> -I not know yet the size of flash.
>>> So I fix a temporary value
>>>
>>> I will update my comment
>> Please do, also please consider that I'm reading the comment and I
>> barely have any clue about this hardware , so make sure I can
>> understand it.
>>
>>>>> +    ret = spi_nor_scan(&flash->nor, NULL, flash_read);
>>>>> +    if (ret) {
>>>>> +        dev_err(qspi->dev, "device scan failed\n");
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    flash->fsize = __fls(mtd->size) - 1;
>>>>> +
>>>>> +    writel_relaxed(DCR_CSHT(1), qspi->io_base + QUADSPI_DCR);
>>>>> +
>>>>> +    ret = mtd_device_register(mtd, NULL, 0);
>>>>> +    if (ret) {
>>>>> +        dev_err(qspi->dev, "mtd device parse failed\n");
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    dev_dbg(qspi->dev, "read mm:%s cs:%d bus:%d\n",
>>>>> +        qspi->read_mode == CCR_FMODE_MM ? "yes" : "no", cs_num,
>>>>> width);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>> [...]
>>>>
>>
> 


-- 
Best regards,
Marek Vasut
