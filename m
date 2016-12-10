From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
Date: Sat, 10 Dec 2016 05:01:56 +0100
Message-ID: <68aa03be-8195-1824-a9e1-609a5ad74381@gmail.com>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-2-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481302167-28044-2-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/09/2016 05:49 PM, Cédric Le Goater wrote:

[...]


> +static int aspeed_smc_read_from_ahb(void *buf, const void __iomem *src,
> +				    size_t len)
> +{
> +	if (IS_ALIGNED((u32)src, sizeof(u32)) &&
> +	    IS_ALIGNED((u32)buf, sizeof(u32)) &&
> +	    IS_ALIGNED(len, sizeof(u32))) {

Did you try compiling this on any 64bit system ?

> +		while (len > 3) {
> +			*(u32 *)buf = readl(src);

ioread32_rep() to avoid open-coding the loop .

> +			buf += 4;
> +			src += 4;
> +			len -= 4;
> +		}
> +	}
> +
> +	while (len--) {
> +		*(u8 *)buf = readb(src);
> +		buf += 1;
> +		src += 1;
> +	}
> +	return 0;
> +}
> +
> +static int aspeed_smc_write_to_ahb(void __iomem *dst, const void *buf,
> +				   size_t len)
> +{
> +	if (IS_ALIGNED((u32)dst, sizeof(u32)) &&
> +	    IS_ALIGNED((u32)buf, sizeof(u32)) &&
> +	    IS_ALIGNED(len, sizeof(u32))) {
> +		while (len > 3) {
> +			u32 val = *(u32 *)buf;
> +
> +			writel(val, dst);

iowrite32_rep()

> +			buf += 4;
> +			dst += 4;
> +			len -= 4;
> +		}
> +	}
> +
> +	while (len--) {
> +		u8 val = *(u8 *)buf;
> +
> +		writeb(val, dst);
> +		buf += 1;
> +		dst += 1;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * The driver only support SPI flash
> + */
> +enum aspeed_smc_flash_type {
> +	smc_type_nor  = 0,
> +	smc_type_nand = 1,
> +	smc_type_spi  = 2,
> +};
> +
> +struct aspeed_smc_chip;
> +
> +struct aspeed_smc_info {
> +	u32 maxsize;		/* maximum size of chip window */
> +	u8 nce;			/* number of chip enables */
> +	bool hastype;		/* flash type field exists in config reg */
> +	u8 we0;			/* shift for write enable bit for CE0 */
> +	u8 ctl0;		/* offset in regs of ctl for CE0 */
> +
> +	void (*set_4b)(struct aspeed_smc_chip *chip);
> +};

Move all the structs to the beginning of the driver please.

> +static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
> +
> +static const struct aspeed_smc_info fmc_2500_info = {
> +	.maxsize = 256 * 1024 * 1024,
> +	.nce = 3,
> +	.hastype = true,
> +	.we0 = 16,
> +	.ctl0 = 0x10,
> +	.set_4b = aspeed_smc_chip_set_4b,
> +};
> +
> +static const struct aspeed_smc_info spi_2500_info = {
> +	.maxsize = 128 * 1024 * 1024,
> +	.nce = 2,
> +	.hastype = false,
> +	.we0 = 16,
> +	.ctl0 = 0x10,
> +	.set_4b = aspeed_smc_chip_set_4b,
> +};
> +
> +enum aspeed_smc_ctl_reg_value {
> +	smc_base,		/* base value without mode for other commands */
> +	smc_read,		/* command reg for (maybe fast) reads */
> +	smc_write,		/* command reg for writes */
> +	smc_max,
> +};

[...]

> +#define CONTROL_CE_STOP_ACTIVE_CONTROL	BIT(2)
> +#define CONTROL_COMMAND_MODE_MASK	GENMASK(1, 0)
> +#define CONTROL_COMMAND_MODE_NORMAL	(0)
> +#define CONTROL_COMMAND_MODE_FREAD	(1)
> +#define CONTROL_COMMAND_MODE_WRITE	(2)
> +#define CONTROL_COMMAND_MODE_USER	(3)

Drop the parenthesis around constants :)

> +#define CONTROL_KEEP_MASK						\
> +	(CONTROL_AAF_MODE | CONTROL_CE_INACTIVE_MASK | CONTROL_CLK_DIV4 | \
> +	 CONTROL_IO_DUMMY_MASK | CONTROL_CLOCK_FREQ_SEL_MASK |		\
> +	 CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)
> +
> +/*
> + * Segment Address Registers. Start and end addresses are encoded
> + * using 8MB units
> + */
> +#define SEGMENT_ADDR_REG0		0x30
> +#define SEGMENT_ADDR_START(_r)		((((_r) >> 16) & 0xFF) << 23)

is that ((r) & 0xff0000) << 7 ?

> +#define SEGMENT_ADDR_END(_r)		((((_r) >> 24) & 0xFF) << 23)

((r) & 0xff000000) >> 1 ?

> +static inline u32 aspeed_smc_chip_write_bit(struct aspeed_smc_chip *chip)
> +{
> +	return BIT(chip->controller->info->we0 + chip->cs);
> +}

[...]

> +static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
> +				      struct resource *res)
> +{
> +	struct aspeed_smc_controller *controller = chip->controller;
> +	const struct aspeed_smc_info *info = controller->info;
> +	u32 reg, base_reg;
> +
> +	/*
> +	 * Always turn on the write enable bit to allow opcodes to be
> +	 * sent in user mode.
> +	 */
> +	aspeed_smc_chip_enable_write(chip);
> +
> +	/* The driver only supports SPI type flash */
> +	if (info->hastype)
> +		aspeed_smc_chip_set_type(chip, smc_type_spi);
> +
> +	/*
> +	 * Configure chip base address in memory
> +	 */
> +	chip->ahb_base = aspeed_smc_chip_base(chip, res);
> +	if (!chip->ahb_base) {
> +		dev_warn(chip->nor.dev, "CE segment window closed.\n");
> +		return -1;

return -EINVAL ? Check whether you always use errno.h macros in returns.

> +	}
> +
> +	/*
> +	 * Get value of the inherited control register. U-Boot usually
> +	 * does some timing calibration on the FMC chip, so it's good
> +	 * to keep them. In the future, we should handle calibration
> +	 * from Linux.
> +	 */
> +	reg = readl(chip->ctl);
> +	dev_dbg(controller->dev, "control register: %08x\n", reg);
> +
> +	base_reg = reg & CONTROL_KEEP_MASK;
> +	if (base_reg != reg) {
> +		dev_info(controller->dev,
> +			 "control register changed to: %08x\n",
> +			 base_reg);
> +	}
> +	chip->ctl_val[smc_base] = base_reg;

[...]

Mostly minor nits, looks nice otherwise, thanks :)

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
