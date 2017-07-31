From: Alexandru Gagniuc <alex.g-JVBBi1ABkv5Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/5] mtd: spi-nor: Add driver for Adaptrum Anarion QSPI
 controller
Date: Mon, 31 Jul 2017 13:54:58 -0700
Message-ID: <63953f85-795e-20a2-04aa-4d486db608cc@adaptrum.com>
References: <20170728220707.13960-1-alex.g@adaptrum.com>
 <20170728220707.13960-5-alex.g@adaptrum.com>
 <135fdf95-1029-2d34-2802-1283a73588e5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <135fdf95-1029-2d34-2802-1283a73588e5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marek,

Me again!

On 07/29/2017 02:34 AM, Marek Vasut wrote:
> On 07/29/2017 12:07 AM, Alexandru Gagniuc wrote:
>> +static void aspi_drain_fifo(struct anarion_qspi *aspi, uint8_t *buf, size_t len)
>> +{
>> +	uint32_t data;
>
> Is this stuff below something like ioread32_rep() ?
>
[snip]
>> +	aspi_write_reg(spi, ASPI_REG_BYTE_COUNT, sizeof(uint32_t));
>> +	while (len >= 4) {
>> +		memcpy(&data, buf, sizeof(data));
>> +		aspi_write_reg(spi, ASPI_REG_DATA1, data);
>
> iowrite32_rep ?
>
>> +		buf += 4;
>> +		len -= 4;
>> +	}

I looked at using io(read|write)32_rep in these two places, and I've run 
into some issues.

First, I'm seeing unaligned MMIO accesses, which are not supported on 
ARC. Note that 'buf' has an alignment of 1, while the register requires 
an alignment of 4. The memcpy() in-between takes care of that, which was 
the original intent.

Other than that, we still need to break off the tail because we need to 
update ASPI_REG_BYTE_COUNT before writing/reading any more data from the 
FIFO. We have to keep track of the remainder, so we're not really saving 
any SLOC.

I'd like to keep the original version as I find it to be much more 
symmetrical and readable.

Thanks,
Alex

>> +
>> +	if (len) {
>> +		aspi_write_reg(spi, ASPI_REG_BYTE_COUNT, len);
>> +		memcpy(&data, buf, len);
>> +		aspi_write_reg(spi, ASPI_REG_DATA1, data);
>> +	}
>> +}


Exhibit A: aspi_seed_fifo with writesl()

static void aspi_seed_fifo(struct anarion_qspi *spi,
			   const uint8_t *buf, size_t len)
{
	uint32_t data;
	void __iomem *data_reg = (void *)(spi->regbase + ASPI_REG_DATA1);

	aspi_write_reg(spi, ASPI_REG_BYTE_COUNT, sizeof(uint32_t));
	writesl(data_reg, buf, len / 4);
	buf += len & ~0x03;
	len &= 0x03;

	if (len) {
		aspi_write_reg(spi, ASPI_REG_BYTE_COUNT, len);
		memcpy(&data, buf, len);
		aspi_write_reg(spi, ASPI_REG_DATA1, data);
	}
}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
