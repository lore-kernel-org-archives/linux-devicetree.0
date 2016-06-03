From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2] mtd: brcmnand: Add v7.2 controller support
Date: Fri, 3 Jun 2016 12:05:17 +0200
Message-ID: <20160603120517.7d7189b5@bbrezillon>
References: <1464715383-26053-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464715383-26053-1-git-send-email-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, thomas.petazzoni@free-electrons.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Simon Arlott <simon@fire.lp0.eu>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:BROADCOM STB NAND
	FLASH DRIVER" <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Tue, 31 May 2016 10:23:02 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> The 7.2 controller differs in a few area compared to its predecssor (7.1):
> 
> - NAND scrambler, which we are not using just yet
> - higher ECC levels (up to 120 bits) per 1KB data blocks, also not supported yet
> - up to 128B OOB
> 
> This patchs adds the ncessary code to support such a controller
> generation and updates the Device Tree binding.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied with Rob's fixes.

Thanks,

Boris

> ---
> Changes in v2:
> 
> - fixed a bunch of conditionals on the versions which should
>   have been exclusive (spotted by Thomas)
> 
>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      |  1 +
>  drivers/mtd/nand/brcmnand/brcmnand.c               | 91 ++++++++++++++++++----
>  2 files changed, 78 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> index deb24cbdda82..c8d71e75cb09 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
> @@ -27,6 +27,7 @@ Required properties:
>                           brcm,brcmnand-v6.2
>                           brcm,brcmnand-v7.0
>                           brcm,brcmnand-v7.1
> +                         brcm,brcmnand-v7.2
>                           brcm,brcmnand
>  - reg              : the register start and length for NAND register region.
>                       (optional) Flash DMA register range (if present)
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index b76ad7c0144f..0a54a0f5a4b1 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -340,6 +340,36 @@ static const u16 brcmnand_regs_v71[] = {
>  	[BRCMNAND_FC_BASE]		= 0x400,
>  };
>  
> +/* BRCMNAND v7.2 */
> +static const u16 brcmnand_regs_v72[] = {
> +	[BRCMNAND_CMD_START]		=  0x04,
> +	[BRCMNAND_CMD_EXT_ADDRESS]	=  0x08,
> +	[BRCMNAND_CMD_ADDRESS]		=  0x0c,
> +	[BRCMNAND_INTFC_STATUS]		=  0x14,
> +	[BRCMNAND_CS_SELECT]		=  0x18,
> +	[BRCMNAND_CS_XOR]		=  0x1c,
> +	[BRCMNAND_LL_OP]		=  0x20,
> +	[BRCMNAND_CS0_BASE]		=  0x50,
> +	[BRCMNAND_CS1_BASE]		=     0,
> +	[BRCMNAND_CORR_THRESHOLD]	=  0xdc,
> +	[BRCMNAND_CORR_THRESHOLD_EXT]	=  0xe0,
> +	[BRCMNAND_UNCORR_COUNT]		=  0xfc,
> +	[BRCMNAND_CORR_COUNT]		= 0x100,
> +	[BRCMNAND_CORR_EXT_ADDR]	= 0x10c,
> +	[BRCMNAND_CORR_ADDR]		= 0x110,
> +	[BRCMNAND_UNCORR_EXT_ADDR]	= 0x114,
> +	[BRCMNAND_UNCORR_ADDR]		= 0x118,
> +	[BRCMNAND_SEMAPHORE]		= 0x150,
> +	[BRCMNAND_ID]			= 0x194,
> +	[BRCMNAND_ID_EXT]		= 0x198,
> +	[BRCMNAND_LL_RDATA]		= 0x19c,
> +	[BRCMNAND_OOB_READ_BASE]	= 0x200,
> +	[BRCMNAND_OOB_READ_10_BASE]	=     0,
> +	[BRCMNAND_OOB_WRITE_BASE]	= 0x400,
> +	[BRCMNAND_OOB_WRITE_10_BASE]	=     0,
> +	[BRCMNAND_FC_BASE]		= 0x600,
> +};
> +
>  enum brcmnand_cs_reg {
>  	BRCMNAND_CS_CFG_EXT = 0,
>  	BRCMNAND_CS_CFG,
> @@ -435,7 +465,9 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
>  	}
>  
>  	/* Register offsets */
> -	if (ctrl->nand_version >= 0x0701)
> +	if (ctrl->nand_version >= 0x0702)
> +		ctrl->reg_offsets = brcmnand_regs_v72;
> +	else if (ctrl->nand_version >= 0x0701)
>  		ctrl->reg_offsets = brcmnand_regs_v71;
>  	else if (ctrl->nand_version >= 0x0600)
>  		ctrl->reg_offsets = brcmnand_regs_v60;
> @@ -480,7 +512,9 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
>  	}
>  
>  	/* Maximum spare area sector size (per 512B) */
> -	if (ctrl->nand_version >= 0x0600)
> +	if (ctrl->nand_version >= 0x0702)
> +		ctrl->max_oob = 128;
> +	else if (ctrl->nand_version >= 0x0600)
>  		ctrl->max_oob = 64;
>  	else if (ctrl->nand_version >= 0x0500)
>  		ctrl->max_oob = 32;
> @@ -583,14 +617,20 @@ static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
>  	enum brcmnand_reg reg = BRCMNAND_CORR_THRESHOLD;
>  	int cs = host->cs;
>  
> -	if (ctrl->nand_version >= 0x0600)
> +	if (ctrl->nand_version >= 0x0702)
> +		bits = 7;
> +	else if (ctrl->nand_version >= 0x0600)
>  		bits = 6;
>  	else if (ctrl->nand_version >= 0x0500)
>  		bits = 5;
>  	else
>  		bits = 4;
>  
> -	if (ctrl->nand_version >= 0x0600) {
> +	if (ctrl->nand_version >= 0x0702) {
> +		if (cs >= 4)
> +			reg = BRCMNAND_CORR_THRESHOLD_EXT;
> +		shift = (cs % 4) * bits;
> +	} else if (ctrl->nand_version >= 0x0600) {
>  		if (cs >= 5)
>  			reg = BRCMNAND_CORR_THRESHOLD_EXT;
>  		shift = (cs % 5) * bits;
> @@ -631,19 +671,28 @@ enum {
>  
>  static inline u32 brcmnand_spare_area_mask(struct brcmnand_controller *ctrl)
>  {
> -	if (ctrl->nand_version >= 0x0600)
> +	if (ctrl->nand_version >= 0x0702)
> +		return GENMASK(7, 0);
> +	else if (ctrl->nand_version >= 0x0600)
>  		return GENMASK(6, 0);
>  	else
>  		return GENMASK(5, 0);
>  }
>  
>  #define NAND_ACC_CONTROL_ECC_SHIFT	16
> +#define NAND_ACC_CONTROL_ECC_EXT_SHIFT	13
>  
>  static inline u32 brcmnand_ecc_level_mask(struct brcmnand_controller *ctrl)
>  {
>  	u32 mask = (ctrl->nand_version >= 0x0600) ? 0x1f : 0x0f;
>  
> -	return mask << NAND_ACC_CONTROL_ECC_SHIFT;
> +	mask <<= NAND_ACC_CONTROL_ECC_SHIFT;
> +
> +	/* v7.2 includes additional ECC levels */
> +	if (ctrl->nand_version >= 0x0702)
> +		mask |= 0x7 << NAND_ACC_CONTROL_ECC_EXT_SHIFT;
> +
> +	return mask;
>  }
>  
>  static void brcmnand_set_ecc_enabled(struct brcmnand_host *host, int en)
> @@ -667,7 +716,9 @@ static void brcmnand_set_ecc_enabled(struct brcmnand_host *host, int en)
>  
>  static inline int brcmnand_sector_1k_shift(struct brcmnand_controller *ctrl)
>  {
> -	if (ctrl->nand_version >= 0x0600)
> +	if (ctrl->nand_version >= 0x0702)
> +		return 9;
> +	else if (ctrl->nand_version >= 0x0600)
>  		return 7;
>  	else if (ctrl->nand_version >= 0x0500)
>  		return 6;
> @@ -773,10 +824,16 @@ enum brcmnand_llop_type {
>   * Internal support functions
>   ***********************************************************************/
>  
> -static inline bool is_hamming_ecc(struct brcmnand_cfg *cfg)
> +static inline bool is_hamming_ecc(struct brcmnand_controller *ctrl,
> +				  struct brcmnand_cfg *cfg)
>  {
> -	return cfg->sector_size_1k == 0 && cfg->spare_area_size == 16 &&
> -		cfg->ecc_level == 15;
> +	if (ctrl->nand_version <= 0x0701)
> +		return cfg->sector_size_1k == 0 && cfg->spare_area_size == 16 &&
> +			cfg->ecc_level == 15;
> +	else
> +		return cfg->sector_size_1k == 0 && ((cfg->spare_area_size == 16 &&
> +			cfg->ecc_level == 15) ||
> +			(cfg->spare_area_size == 28 && cfg->ecc_level == 16));
>  }
>  
>  /*
> @@ -931,7 +988,7 @@ static int brcmstb_choose_ecc_layout(struct brcmnand_host *host)
>  	if (p->sector_size_1k)
>  		ecc_level <<= 1;
>  
> -	if (is_hamming_ecc(p)) {
> +	if (is_hamming_ecc(host->ctrl, p)) {
>  		ecc->bytes = 3 * sectors;
>  		mtd_set_ooblayout(mtd, &brcmnand_hamming_ooblayout_ops);
>  		return 0;
> @@ -1857,7 +1914,8 @@ static int brcmnand_set_cfg(struct brcmnand_host *host,
>  	return 0;
>  }
>  
> -static void brcmnand_print_cfg(char *buf, struct brcmnand_cfg *cfg)
> +static void brcmnand_print_cfg(struct brcmnand_host *host,
> +			       char *buf, struct brcmnand_cfg *cfg)
>  {
>  	buf += sprintf(buf,
>  		"%lluMiB total, %uKiB blocks, %u%s pages, %uB OOB, %u-bit",
> @@ -1868,7 +1926,7 @@ static void brcmnand_print_cfg(char *buf, struct brcmnand_cfg *cfg)
>  		cfg->spare_area_size, cfg->device_width);
>  
>  	/* Account for Hamming ECC and for BCH 512B vs 1KiB sectors */
> -	if (is_hamming_ecc(cfg))
> +	if (is_hamming_ecc(host->ctrl, cfg))
>  		sprintf(buf, ", Hamming ECC");
>  	else if (cfg->sector_size_1k)
>  		sprintf(buf, ", BCH-%u (1KiB sector)", cfg->ecc_level << 1);
> @@ -1987,7 +2045,7 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>  
>  	brcmnand_set_ecc_enabled(host, 1);
>  
> -	brcmnand_print_cfg(msg, cfg);
> +	brcmnand_print_cfg(host, msg, cfg);
>  	dev_info(ctrl->dev, "detected %s\n", msg);
>  
>  	/* Configure ACC_CONTROL */
> @@ -1995,6 +2053,10 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>  	tmp = nand_readreg(ctrl, offs);
>  	tmp &= ~ACC_CONTROL_PARTIAL_PAGE;
>  	tmp &= ~ACC_CONTROL_RD_ERASED;
> +
> +	/* We need to turn on Read from erased paged protected by ECC */
> +	if (ctrl->nand_version >= 0x0702)
> +		tmp |= ACC_CONTROL_RD_ERASED;
>  	tmp &= ~ACC_CONTROL_FAST_PGM_RDIN;
>  	if (ctrl->features & BRCMNAND_HAS_PREFETCH) {
>  		/*
> @@ -2195,6 +2257,7 @@ static const struct of_device_id brcmnand_of_match[] = {
>  	{ .compatible = "brcm,brcmnand-v6.2" },
>  	{ .compatible = "brcm,brcmnand-v7.0" },
>  	{ .compatible = "brcm,brcmnand-v7.1" },
> +	{ .compatible = "brcm,brcmnand-v7.2" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, brcmnand_of_match);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
