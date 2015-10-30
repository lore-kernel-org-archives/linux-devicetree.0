From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v4 2/3] mtd: brcmnand: Force 8bit mode before doing
 nand_scan_ident()
Date: Fri, 30 Oct 2015 06:58:59 +0000
Message-ID: <39063E8F96E11742B35A201CC5D095B7B021B5@SJEXCHMB10.corp.ad.broadcom.com>
References: <1446185938-17520-1-git-send-email-anup.patel@broadcom.com>
 <1446185938-17520-3-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446185938-17520-3-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux MTD <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pramod Kumar <pramodku-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Anup Patel [mailto:anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org]
> Sent: 30 October 2015 11:49
> To: David Woodhouse; Brian Norris; Linux MTD
> Cc: Rob Herring; Pawel Moll; Mark Rutland; Catalin Marinas; Will Deacon;
> Sudeep Holla; Ian Campbell; Kumar Gala; Ray Jui; Scott Branden; Florian Fainelli;
> Pramod Kumar; Vikram Prakash; Sandeep Tripathy; Linux ARM Kernel; Device
> Tree; Linux Kernel; bcm-kernel-feedback-list; Anup Patel
> Subject: [PATCH v4 2/3] mtd: brcmnand: Force 8bit mode before doing
> nand_scan_ident()
> 
> Just like other NAND controllers, the NAND READID command only works in 8bit
> mode for all versions of BRCMNAND controller.
> 
> This patch forces 8bit mode for each NAND CS in brcmnand_init_cs() before
> doing nand_scan_ident() to ensure that BRCMNAND controller is in 8bit mode
> when NAND READID command is issued.
> 
> Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c
> b/drivers/mtd/nand/brcmnand/brcmnand.c
> index dda96fa..641591d 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1912,6 +1912,7 @@ static int brcmnand_init_cs(struct brcmnand_host
> *host)
>  	struct mtd_info *mtd;
>  	struct nand_chip *chip;
>  	int ret;
> +	u16 cfg_offs;
>  	struct mtd_part_parser_data ppdata = { .of_node = dn };
> 
>  	ret = of_property_read_u32(dn, "reg", &host->cs); @@ -1954,6
> +1955,15 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
> 
>  	chip->controller = &ctrl->controller;
> 
> +	/*
> +	 * The bootloader might have configured 16bit mode but
> +	 * NAND READID command only works in 8bit mode. We force
> +	 * 8bit mode here to ensure that NAND READID commands works.
> +	 */
> +	cfg_offs = brcmnand_cs_offset(ctrl, host->cs, BRCMNAND_CS_CFG);
> +	nand_writereg(ctrl, cfg_offs,
> +		      nand_readreg(ctrl, cfg_offs) & CFG_BUS_WIDTH);

This should have been "nand_readreg(ctrl, cfg_offs) & ~CFG_BUS_WIDTH".

My bad ...

--
Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
