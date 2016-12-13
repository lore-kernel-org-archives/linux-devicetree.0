From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
Date: Tue, 13 Dec 2016 08:50:20 +0100
Message-ID: <3f3260d1-e677-b6d9-5571-a08a80344495@gmail.com>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-2-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481557252-13656-2-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/12/2016 04:40 PM, Cédric Le Goater wrote:
> This driver adds mtd support for the Aspeed AST2500 SoC static memory
> controllers :

[...]

> +#define DEVICE_NAME	"aspeed-smc"
> +
> +/*
> + * The driver only support SPI flash
> + */
> +enum aspeed_smc_flash_type {
> +	smc_type_nor  = 0,
> +	smc_type_nand = 1,
> +	smc_type_spi  = 2,
> +};

So why is this here ? :)

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

Otherwise looks good:
Reviewed-by: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
