From: Alexandru Gagniuc <alex.g-JVBBi1ABkv5Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/5] mtd: spi-nor: Add driver for Adaptrum Anarion QSPI
 controller
Date: Mon, 31 Jul 2017 10:17:17 -0700
Message-ID: <83a4e27a-b96c-0558-fbb5-10e64f9bf59b@adaptrum.com>
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

On 07/29/2017 02:34 AM, Marek Vasut wrote:
> On 07/29/2017 12:07 AM, Alexandru Gagniuc wrote:
>> Add support for the QSPI controller found in Adaptrum Anarion SOCs.
>> This controller is designed specifically to handle SPI NOR chips, and
>> the driver is modeled as such.
>>
>> Because the system is emulated on an FPGA, we don't have a way to test
>> all the hardware adjustemts, so only basic features are implemented at
>> this time.
>>
Hi Marek,

Thank you very much for the comments. I am going to fix most issues you 
pointed out in v2. I do have some follow-up question on some of your 
comments, so please bear with me. I hope I have responded to all your 
comments, but feel free to nudge me if I missed any.

[snip]

>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/anarion-quadspi.txt
>> @@ -0,0 +1,22 @@
>> +* Adaptrum Anarion Quad SPI controller
>> +
>> +Required properties:
>> +- compatible : Should be "adaptrum,anarion-qspi".
>> +- reg : Contains two entries, each of which is a tuple consisting of a
>> +	physical address and length. The first entry is the address and
>> +	length of the controller register set. The second entry is the
>> +	address and length of the memory-mapped flash. This second region is
>> +	the region where the controller responds to XIP requests, and may be
>> +	larger than the size of the attached flash.
>
> You want to split the bindings into separate patch and CC Rob to review
> them.

Yes, I do want that now!

[snip]

>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index 293c8a4..98dc012 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -48,6 +48,13 @@ config SPI_ATMEL_QUADSPI
>>  	  This driver does not support generic SPI. The implementation only
>>  	  supports SPI NOR.
>>
>> +config SPI_ANARION_QUADSPI
>> +	tristate "Adaptrum Anarion Quad SPI Controller"
>> +	depends on OF && HAS_IOMEM
>> +	help
>> +	  Enable support for the Adaptrum Anarion Quad SPI controller.
>> +	  This driver does not support generic SPI. It only supports SPI NOR.
>
> Keep the list sorted.

Staged for [PATCH v2].

>>  config SPI_CADENCE_QUADSPI
>>  	tristate "Cadence Quad SPI controller"
>>  	depends on OF && (ARM || COMPILE_TEST)
>> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
>> index 285aab8..53635f6 100644
>> --- a/drivers/mtd/spi-nor/Makefile
>> +++ b/drivers/mtd/spi-nor/Makefile
>> @@ -1,6 +1,7 @@
>>  obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
>>  obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
>>  obj-$(CONFIG_SPI_ATMEL_QUADSPI)	+= atmel-quadspi.o
>> +obj-$(CONFIG_SPI_ANARION_QUADSPI)	+= anarion-quadspi.o
>
> DTTO, N is before S and T .

Staged for [PATCH v2].

>>  obj-$(CONFIG_SPI_CADENCE_QUADSPI)	+= cadence-quadspi.o
>>  obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
>>  obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
>> diff --git a/drivers/mtd/spi-nor/anarion-quadspi.c b/drivers/mtd/spi-nor/anarion-quadspi.c
>> new file mode 100644
>> index 0000000..d981356
>> --- /dev/null
>> +++ b/drivers/mtd/spi-nor/anarion-quadspi.c
>> @@ -0,0 +1,490 @@
>> +/*
>> + * Adaptrum Anarion Quad SPI controller driver
>> + *
>> + * Copyright (C) 2017, Adaptrum, Inc.
>> + * (Written by Alexandru Gagniuc <alex.g at adaptrum.com> for Adaptrum, Inc.)
>> + * Licensed under the GPLv2 or (at your option) any later version.
>
> The GPL boilerplate should be here.

I chose this form of the boilerplate because it seems to be quite used 
in other places. I am assuming the fatter boilerplate the requirement 
for drivers/mtd, correct?

[snip]

>> +#define ASPI_CLK_SW_RESET		(1 << 0)
>
> BIT(0) , fix globally

Staged for [PATCH v2].

>> +#define ASPI_CLK_RESET_BUF		(1 << 1)
>> +#define ASPI_CLK_RESET_ALL		(ASPI_CLK_SW_RESET | ASPI_CLK_RESET_BUF)
>> +#define ASPI_CLK_SPI_MODE3		(1 << 2)
>> +#define ASPI_CLOCK_DIV_MASK		(0xff << 8)
>> +#define ASPI_CLOCK_DIV(d)		(((d) << 8) & ASPI_CLOCK_DIV_MASK)
>> +
>> +#define ASPI_TIMEOUT_US		100000
>> +
>> +#define ASPI_DATA_LEN_MASK		0x3fff
>> +#define ASPI_MAX_XFER_LEN		(size_t)(ASPI_DATA_LEN_MASK + 1)
>> +
>> +#define MODE_IO_X1			(0 << 16)
>> +#define MODE_IO_X2			(1 << 16)
>> +#define MODE_IO_X4			(2 << 16)
>> +#define MODE_IO_SDR_POS_SKEW		(0 << 20)
>> +#define MODE_IO_SDR_NEG_SKEW		(1 << 20)
>> +#define MODE_IO_DDR_34_SKEW		(2 << 20)
>> +#define MODE_IO_DDR_PN_SKEW		(3 << 20)
>> +#define MODE_IO_DDR_DQS			(5 << 20)
>> +
>> +#define ASPI_STATUS_BUSY			(1 << 2)
>> +
>> +/*
>> + * This mask does not match reality. Get over it:
>
> What is this about ?

Each stage of the QSPI chain has two registers. The second register has 
a bitfield which takes in the length of the stage. For example, for 
DATA2, we can set the length up to 0x4000, but for ADDR2, we can only 
set a max of 4 bytes. I wrote this comment as a reminder to myself to be 
careful about using this mask. I'll rephrase the comment for [v2]

>> + * DATA2:	0x3fff
>> + * CMD2:	0x0003
>> + * ADDR2:	0x0007
>> + * PERF2:	0x0000
>> + * HI_Z:	0x003f
>> + * BCNT:	0x0007
>> + */
>> +#define CHAIN_LEN(x)		((x - 1) & ASPI_DATA_LEN_MASK)
>> +
>> +struct anarion_qspi {
>> +	struct		spi_nor nor;
>> +	struct		device *dev;
>> +	uintptr_t	regbase;
>
> Should be void __iomem * I guess ?

I chose uintptr_t as opposed to void *, because arithmetic on void * is 
not valid in C. What is the right answer hen, without risking undefined 
behavior?

>
>> +	uintptr_t	xipbase;
>> +	uint32_t	xfer_mode_cmd;
>
> u32 etc, fix globally, this is not userspace.

 From coding-style, section 5.(d), my understanding is that 
"Linux-specific u8/u16/u32/u64 types [...] are not mandatory in new 
code". Most of the code in this driver is shared between Linux, u-boot, 
openocd, ASIC validation tests, and manufacturing tests. Unlike, 
shortint types, stdint types are available in all cases.

Therefore, having to use a different set of primitive types makes code 
sharing much more difficult, and increases the maintenance burden, hence 
the strong preference for standard types. Is this reasonable?

[snip]

>> +static void aspi_drain_fifo(struct anarion_qspi *aspi, uint8_t *buf, size_t len)
>> +{
>> +	uint32_t data;
>
> Is this stuff below something like ioread32_rep() ?
>
>> +	aspi_write_reg(aspi, ASPI_REG_BYTE_COUNT, sizeof(uint32_t));
>> +	while (len >= 4) {
>> +		data = aspi_read_reg(aspi, ASPI_REG_DATA1);
>> +		memcpy(buf, &data, sizeof(data));
>> +		buf += 4;
>> +		len -= 4;
>> +	}

That is very similar to ioread32_rep, yes. I kept this as for the 
reasons outlined above, but changing this to _rep() seems innocent enough.

>> +	if (len) {
>> +		aspi_write_reg(aspi, ASPI_REG_BYTE_COUNT, len);
>> +		data = aspi_read_reg(aspi, ASPI_REG_DATA1);
>> +		memcpy(buf, &data, len);
>> +	}
>> +}
>> +
>> +static void aspi_seed_fifo(struct anarion_qspi *spi,
>> +			   const uint8_t *buf, size_t len)
>> +{
>> +	uint32_t data;
>> +
>> +	aspi_write_reg(spi, ASPI_REG_BYTE_COUNT, sizeof(uint32_t));
>> +	while (len >= 4) {
>> +		memcpy(&data, buf, sizeof(data));
>> +		aspi_write_reg(spi, ASPI_REG_DATA1, data);
>
> iowrite32_rep ?
>

[snip]
>> +/* While we could send read commands manually to the flash chip, we'd have to
>> + * get data back through the DATA2 register. That is on the AHB bus, whereas
>> + * XIP reads go over AXI. Hence, we use the memory-mapped flash space for read.
>> + * TODO: Look at using DMA instead of memcpy().
>> + */
>
> Multiline comment looks like this,
> /*
>  * foo
>  * bar
>  */
>

Staged for [PATCH v2].

[snip]
>> +static ssize_t anarion_spi_nor_write(struct spi_nor *nor, loff_t to,
>> +				     size_t len, const uint8_t *src)
>> +{
>> +	int ret;
>> +	struct anarion_qspi *aspi = nor->priv;
>> +
>> +	dev_err(aspi->dev, "%s, @0x%llx + %zu\n", __func__, to, len);
>
> Drop this.
>
OOPS! That wasn't supposed to be there.
Staged for [PATCH v2].

[snip]

>> +	switch (nor->flash_read) {
>> +	default:		/* Fall through */
>
> This will break once we add OSPI support ...

Ooh, I see the API here has changed significantly from the 4.9 LTS 
branch where we originally developed the driver. I will add and test 
normal and FAST_READ support, but I won't have the bandwidth to test 
other modes yet. Those will have to remain as a TODO.

>> +	case SPI_NOR_NORMAL:
>> +		aspi->num_hi_z_clocks = nor->read_dummy;
>> +		aspi->xfer_mode_cmd = MODE_IO_X1;
>> +		aspi->xfer_mode_addr = MODE_IO_X1;
>> +		aspi->xfer_mode_data = MODE_IO_X1;
>> +		break;
>> +	case SPI_NOR_FAST:
>> +		aspi->num_hi_z_clocks = nor->read_dummy;
>> +		aspi->xfer_mode_cmd = MODE_IO_X1;
>> +		aspi->xfer_mode_addr = MODE_IO_X1;
>> +		aspi->xfer_mode_data = MODE_IO_X1;
>> +		break;
>> +	case SPI_NOR_DUAL:
>> +		aspi->num_hi_z_clocks = nor->read_dummy;
>> +		aspi->xfer_mode_cmd = MODE_IO_X1;
>> +		aspi->xfer_mode_addr = MODE_IO_X1;
>> +		aspi->xfer_mode_data = MODE_IO_X2;
>> +		break;
>> +	case SPI_NOR_QUAD:
>> +		aspi->num_hi_z_clocks = nor->read_dummy;
>> +		aspi->xfer_mode_cmd = MODE_IO_X1;
>> +		aspi->xfer_mode_addr = MODE_IO_X1;
>> +		aspi->xfer_mode_data = MODE_IO_X4;
>> +		break;
>> +	}
>> +
>> +	aspi_setup_xip_read_chain(aspi, nor);
>> +
>> +	mtd_device_register(&aspi->nor.mtd, NULL, 0);
>> +
>> +	return 0;
>> +}

[snip]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
