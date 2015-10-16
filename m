From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH v2 1/4] mtd: brcmnand: Fix pointer type-cast in
 brcmnand_write()
Date: Fri, 16 Oct 2015 08:36:22 -0700
Message-ID: <56211976.1030401@broadcom.com>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
 <1444986537-28387-2-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444986537-28387-2-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup.patel@broadcom.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Pramod KUMAR <pramodku@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Sandeep Tripathy <tripathy@broadcom.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Correct me if I remember it wrong, but I thought this patch has already
been merged by Brian?

Thanks,

Ray

On 10/16/2015 2:08 AM, Anup Patel wrote:
> We should always type-cast pointer to "long" or "unsigned long"
> because size of pointer is same as machine word size. This will
> avoid pointer type-cast issues on both 32bit and 64bit systems.
> 
> This patch fixes pointer type-cast issue in brcmnand_write()
> as-per above info.
> 
> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> Reviewed-by: Vikram Prakash <vikramp@broadcom.com>
> Reviewed-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index fddb795..4cba03d 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1544,9 +1544,9 @@ static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
>  
>  	dev_dbg(ctrl->dev, "write %llx <- %p\n", (unsigned long long)addr, buf);
>  
> -	if (unlikely((u32)buf & 0x03)) {
> +	if (unlikely((unsigned long)buf & 0x03)) {
>  		dev_warn(ctrl->dev, "unaligned buffer: %p\n", buf);
> -		buf = (u32 *)((u32)buf & ~0x03);
> +		buf = (u32 *)((unsigned long)buf & ~0x03);
>  	}
>  
>  	brcmnand_wp(mtd, 0);
> 
