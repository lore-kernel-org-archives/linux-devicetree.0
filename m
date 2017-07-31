From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 4/5] mtd: spi-nor: Add driver for Adaptrum Anarion QSPI
 controller
Date: Mon, 31 Jul 2017 23:35:05 +0200
Message-ID: <cd005749-9943-2b6e-a792-93843d2cdf6c@gmail.com>
References: <20170728220707.13960-1-alex.g@adaptrum.com>
 <20170728220707.13960-5-alex.g@adaptrum.com>
 <135fdf95-1029-2d34-2802-1283a73588e5@gmail.com>
 <63953f85-795e-20a2-04aa-4d486db608cc@adaptrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <63953f85-795e-20a2-04aa-4d486db608cc@adaptrum.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandru Gagniuc <alex.g@adaptrum.com>, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/31/2017 10:54 PM, Alexandru Gagniuc wrote:
> Hi Marek,
> 
> Me again!
> 
> On 07/29/2017 02:34 AM, Marek Vasut wrote:
>> On 07/29/2017 12:07 AM, Alexandru Gagniuc wrote:
>>> +static void aspi_drain_fifo(struct anarion_qspi *aspi, uint8_t *buf,
>>> size_t len)
>>> +{
>>> +    uint32_t data;
>>
>> Is this stuff below something like ioread32_rep() ?
>>
> [snip]
>>> +    aspi_write_reg(spi, ASPI_REG_BYTE_COUNT, sizeof(uint32_t));
>>> +    while (len >= 4) {
>>> +        memcpy(&data, buf, sizeof(data));
>>> +        aspi_write_reg(spi, ASPI_REG_DATA1, data);
>>
>> iowrite32_rep ?
>>
>>> +        buf += 4;
>>> +        len -= 4;
>>> +    }
> 
> I looked at using io(read|write)32_rep in these two places, and I've run
> into some issues.
> 
> First, I'm seeing unaligned MMIO accesses, which are not supported on
> ARC. Note that 'buf' has an alignment of 1, while the register requires
> an alignment of 4. The memcpy() in-between takes care of that, which was
> the original intent.
> 
> Other than that, we still need to break off the tail because we need to
> update ASPI_REG_BYTE_COUNT before writing/reading any more data from the
> FIFO. We have to keep track of the remainder, so we're not really saving
> any SLOC.
> 
> I'd like to keep the original version as I find it to be much more
> symmetrical and readable.

Look at the other drivers, AFAIR the io*_rep() issue was solved over and
over again, maybe you can factor that code out.

> Thanks,
> Alex
> 
>>> +
>>> +    if (len) {
>>> +        aspi_write_reg(spi, ASPI_REG_BYTE_COUNT, len);
>>> +        memcpy(&data, buf, len);
>>> +        aspi_write_reg(spi, ASPI_REG_DATA1, data);
>>> +    }
>>> +}
> 
> 
> Exhibit A: aspi_seed_fifo with writesl()
> 
> static void aspi_seed_fifo(struct anarion_qspi *spi,
>                const uint8_t *buf, size_t len)
> {
>     uint32_t data;
>     void __iomem *data_reg = (void *)(spi->regbase + ASPI_REG_DATA1);
> 
>     aspi_write_reg(spi, ASPI_REG_BYTE_COUNT, sizeof(uint32_t));
>     writesl(data_reg, buf, len / 4);
>     buf += len & ~0x03;
>     len &= 0x03;
> 
>     if (len) {
>         aspi_write_reg(spi, ASPI_REG_BYTE_COUNT, len);
>         memcpy(&data, buf, len);
>         aspi_write_reg(spi, ASPI_REG_DATA1, data);
>     }
> }


-- 
Best regards,
Marek Vasut
