From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 2/3] mtd: brcmnand: Force 8bit mode before doing
 nand_scan_ident()
Date: Fri, 30 Oct 2015 12:47:44 -0700
Message-ID: <20151030194744.GJ13239@google.com>
References: <1446188361-15146-1-git-send-email-anup.patel@broadcom.com>
 <1446188361-15146-3-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1446188361-15146-3-git-send-email-anup.patel@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anup Patel <anup.patel@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Device Tree <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Will Deacon <will.deacon@arm.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Linux MTD <linux-mtd@lists.infradead.org>, Sandeep Tripathy <tripathy@broadcom.com>, Sudeep Holla <sudeep.holla@arm.com>, Pramod KUMAR <pramodku@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, David Woodhouse <dwmw2@infradead.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 12:29:20PM +0530, Anup Patel wrote:
> Just like other NAND controllers,

^^ That part isn't strictly true. While READ ID data only comes out on
the lower 8 bits, that doesn't *actually* mean you can't get valid data
from a 16-bit bus in general; you just have to drop the upper 8 bits. That's
what these two commits did for read ID and parameter page read commands:

commit 3dad2344e92c6e1aeae42df1c4824f307c51bcc7
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Wed Jan 29 14:08:12 2014 -0800

    mtd: nand: force NAND_CMD_READID onto 8-bit bus

commit bd9c6e99b58255b9de1982711ac9487c9a2f18be
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Fri Nov 29 22:04:28 2013 -0800

    mtd: nand: don't use read_buf for 8-bit ONFI transfers

> the NAND READID command only works
> in 8bit mode for all versions of BRCMNAND controller.

But I presume *this* statement is actually true. This NAND controller doesn't
exactly give us a fully-flexible READID / read_byte / read_word command, as it
works at a higher level than that (although LOW_LEVEL_OP gives us this
flexibility now). I could imagine (though I never tested 16-bit NAND) that
16-bit READID is broken.

BTW, did you ask the HW designer about this? It'd be nice to be 100% sure.

Anyway, as I noted on the cover letter, I've pushed this patch.

Thanks,
Brian

> This patch forces 8bit mode for each NAND CS in brcmnand_init_cs()
> before doing nand_scan_ident() to ensure that BRCMNAND controller
> is in 8bit mode when NAND READID command is issued.
> 
> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index dda96fa..b410527 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1912,6 +1912,7 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
>  	struct mtd_info *mtd;
>  	struct nand_chip *chip;
>  	int ret;
> +	u16 cfg_offs;
>  	struct mtd_part_parser_data ppdata = { .of_node = dn };
>  
>  	ret = of_property_read_u32(dn, "reg", &host->cs);
> @@ -1954,6 +1955,15 @@ static int brcmnand_init_cs(struct brcmnand_host *host)
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
> +		      nand_readreg(ctrl, cfg_offs) & ~CFG_BUS_WIDTH);
> +
>  	if (nand_scan_ident(mtd, 1, NULL))
>  		return -ENXIO;
>  
> -- 
> 1.9.1
> 
