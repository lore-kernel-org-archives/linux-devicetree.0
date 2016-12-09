From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd/spi-nor: Add SPI memory controllers for Aspeed
 SoCs
Date: Fri, 9 Dec 2016 03:29:48 +0100
Message-ID: <6d1bb5a6-3a99-3320-297b-311d359294f6@gmail.com>
References: <1478688149-4554-1-git-send-email-clg@kaod.org>
 <bc14b6ba-800c-bf69-763e-65ead8d4efa7@gmail.com>
 <cd9a46ac-049f-e6b8-586c-d386f6012a51@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cd9a46ac-049f-e6b8-586c-d386f6012a51-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/08/2016 05:36 PM, Cédric Le Goater wrote:
> Hello Marek,

Hi!

[...]

>>> @@ -0,0 +1,72 @@
>>> +* Aspeed Static Memory controller
>>> +* Aspeed SPI Flash Controller
>>> +
>>> +The Static memory controller in the ast2400 supports 5 chip selects
>>> +each can be attached to NAND, parallel NOR, or SPI NOR attached flash.
>>
>> So this controller is supported by this driver, which behaves like a SPI
>> controller driver, yet the block can also do NAND and parallel NOR ?
> 
> I think that was answered in a previous email.

Yep, thanks!

>>> +The Firmware Memory Controller in the ast2500 supports 3 chip selects,
>>> +two of which are always in SPI-NOR mode and the third can be SPI-NOR
>>> +or parallel flash. The SPI flash controller in the ast2400 supports
>>> +one of 2 chip selects selected by pinmux. The two SPI flash
>>> +controllers in the ast2500 each support two chip selects.
>>
>> This paragraph is confusing, it's hard to grok down how many different
>> controllers does this driver support and what are their properties from
>> it. It is all there, it's just hard to read.
> 
> I will start with the AST2500 controllers only, which are consistent.

That works too :-)

[...]

>>> +	tristate "Aspeed flash controllers in SPI mode"
>>> +	depends on HAS_IOMEM && OF
>>> +	depends on ARCH_ASPEED || COMPILE_TEST
>>> +	# IO_SPACE_LIMIT must be equivalent to (~0UL)
>>> +	depends on !NEED_MACH_IO_H
>>
>> Why?
> 
> Some left over from the patch we have been keeping for too long (+1year)
> in our tree.

Hehe, I see, so it's fixed now.

>>> +	help
>>> +	  This enables support for the New Static Memory Controller
>>> +	  (FMC) in the Aspeed SoCs (AST2400 and AST2500) when attached
>>> +	  to SPI nor chips, and support for the SPI Memory controller
>>> +	  (SPI) for the BIOS.
>>
>> I think there is a naming chaos between FMC, SMC (as in Static MC) and
>> SMC (as in SPI MC).
> 
> I agree, I will try to clarify the naming in the next version. I will keep 
> the smc suffix for the driver name though.

Thanks!

[...]

>>> +static void aspeed_smc_chip_set_4b_smc_2400(struct aspeed_smc_chip *chip);
>>> +static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
>>> +
>>> +static const struct aspeed_smc_info fmc_2400_info = {
>>> +	.maxsize = 64 * 1024 * 1024,
>>> +	.nce = 5,
>>> +	.maxwidth = 4,
>>> +	.hastype = true,
>>
>> Shouldn't all this be specified in DT ?
> 
> I am not sure, these values are not configurable. I will remove a few 
> of them in the next version as they are unused.

Sooo, I had a discussion with Boris (which we didn't finish yet).
Please ignore my comment for now and yes please, drop unused params.

>>> +	.we0 = 16,
>>> +	.ctl0 = 0x10,
>>> +	.time = 0x94,
>>> +	.misc = 0x54,
>>> +	.set_4b = aspeed_smc_chip_set_4b,
>>> +};

[...]

>>> +static u32 spi_control_fill_opcode(u8 opcode)
>>> +{
>>> +	return ((u32)(opcode)) << CONTROL_SPI_COMMAND_SHIFT;
>>
>> return opcode << CONTROL... , fix these horrible casts and parenthesis
>> globally.
> 
> I killed the helper. 

Nice, thanks for all the cleanups :)

>>> +}
>>> +
>>> +static inline u32 aspeed_smc_chip_write_bit(struct aspeed_smc_chip *chip)
>>> +{
>>> +	return ((u32)1 << (chip->controller->info->we0 + chip->cs));
>>
>> return BIT(...)
>>
>> I'm not sure these microfunctions are even needed.
> 
> well, this one is used in a couple of places.

Ah all right, then just return BIT(...) and be done with it.

>>> +}

[...]

>>> +static int aspeed_smc_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>>> +{
>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>> +
>>> +	mutex_lock(&chip->controller->mutex);
>>
>> Won't this have a horrid overhead ?
> 
> Shall I use the prepare() and unprepare() ops instead ? 

I think that'd trim down the amount of locking, yes.

>>> +	aspeed_smc_start_user(nor);
>>> +	aspeed_smc_write_to_ahb(chip->base, &opcode, 1);
>>> +	aspeed_smc_read_from_ahb(buf, chip->base, len);
>>> +	aspeed_smc_stop_user(nor);
>>> +
>>> +	mutex_unlock(&chip->controller->mutex);
>>> +
>>> +	return 0;
>>> +}

[...]

>>> +static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>>> +				      struct resource *r)
>>> +{
>>> +	struct aspeed_smc_controller *controller = chip->controller;
>>> +	const struct aspeed_smc_info *info = controller->info;
>>> +	u32 reg, base_reg;
>>> +
>>> +	/*
>>> +	 * Always turn on the write enable bit to allow opcodes to be
>>> +	 * sent in user mode.
>>> +	 */
>>> +	aspeed_smc_chip_enable_write(chip);
>>> +
>>> +	/* The driver only supports SPI type flash for the moment */
>>> +	if (info->hastype)
>>> +		aspeed_smc_chip_set_type(chip, smc_type_spi);
>>> +
>>> +	/*
>>> +	 * Configure chip base address in memory
>>> +	 */
>>> +	chip->base = window_start(controller, r, chip->cs);
>>> +	if (!chip->base) {
>>> +		dev_warn(chip->nor.dev, "CE segment window closed.\n");
>>> +		return -1;
>>> +	}
>>> +
>>> +	/*
>>> +	 * Read the existing control register to get basic values.
>>> +	 *
>>> +	 * XXX This register probably needs more sanitation.
>>
>> What's this comment about ?
> 
> This is an initial comment about settings being done by U-Boot
> before the kernel is loaded, and some optimisations should be 
> nice to keep, for the FMC controller. I will rephrase.

Shouldn't that be passed via DT instead ? We want to be bootloader
agnostic in Linux.

btw off-topic, but is U-Boot support for these aspeed devices ever be
upstreamed ?

>>> +	 * Do we need support for mode 3 vs mode 0 clock phasing?
>>> +	 */
>>> +	reg = readl(chip->ctl);
>>> +	dev_dbg(controller->dev, "control register: %08x\n", reg);
>>> +
>>> +	base_reg = reg & CONTROL_SPI_KEEP_MASK;
>>> +	if (base_reg != reg) {
>>> +		dev_info(controller->dev,
>>> +			 "control register changed to: %08x\n",
>>> +			 base_reg);
>>> +	}


[...]

>>> +		err = mtd_device_register(&chip->nor.mtd, NULL, 0);
>>> +		if (err)
>>> +			continue;
>>
>> What happens if some chip fails to register ?
> 
> That's not correctly handled ... I have a fix for it.
> 
> Thanks,

Thanks for all the work :)

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
