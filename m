From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v1 3/3] drivers: mtd: chips: add support for the dual
 die stacked PNOR
Date: Thu, 22 Feb 2018 14:33:57 +0100
Message-ID: <20180222143357.4ec680b6@bbrezillon>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
 <DM2PR12MB00143807EEF9602098FF0D4BA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <DM2PR12MB00143807EEF9602098FF0D4BA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Bean Huo <beanhuo@outlook.com>
Cc: "boris.brezillon@free-elections.com" <boris.brezillon@free-elections.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "richard@nod.at" <richard@nod.at>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, beanhuo <beanhuo@micron.com>
List-Id: devicetree@vger.kernel.org

On Wed, 21 Feb 2018 19:32:37 +0000
Bean Huo <beanhuo@outlook.com> wrote:

> From: beanhuo <beanhuo@micron.com>
> 
> For the dual die stacked parallel NOR flash (PNOR), it comprises
> two dies in the stack. These two dies can receive the commands in
> parallel, but there is only one die can be selected or accept
> commands according to the maximum address line A[max].
> For example,Micron parallel NOR MT28FW02GBBA1HPC and Cypress
> S70GL02GS, both are dual-die stacked PNOR with 2Gbit density,
> and maximum address line A[26], when A[26] == 0, the lower 1Gb die
> is selected, when A[26] == 1, the upper 1Gb is selected.
> 
> This patch is to check the accessing offset in the chip and rebase
> the unlock cycle command base addresses.
> 
> Signed-off-by: beanhuo <beanhuo@micron.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 144 ++++++++++++++++++++++++++++--------
>  1 file changed, 113 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 56aa6b7..8fa2193 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1104,6 +1104,27 @@ do {  \
>  
>  #endif
>  
> +/*
> + * The dual die stacked device comprises two identical dies which connected

								    ^are

> + * in parallel.But there is only one die being selected each time according

		  ^ missing space after the period

> + * to maximum address line A[max]. When A[max] == 0, the lower die is selected,
> + * when A[max] == 1, the upper die is selected. This function will reture the

								      ^return

> + * CFI unlock-command base address accrording to accessing address.

Is it really just about unlock commands?

> + */
> +static loff_t get_cmd_base_address(struct map_info *map, struct flchip *chip,
> +		loff_t offset)
> +{
> +	struct cfi_private *cfi = map->fldrv_priv;
> +	unsigned long cmd_base_addr = chip->start;
> +
> +	if (cfi->device_stack == CFI_DEVICESTACK_2DIE) {
> +		if (offset >= (1 << (cfi->cfiq->DevSize - 1)))
> +			cmd_base_addr += (1 << (cfi->cfiq->DevSize - 1));
> +	}

Could be done in a more generic way:

	unsigned long die = offset >> (cfi->cfiq->DevSize - 1);

	if (cfi->device_stack == 1) {
		WARN_ON(die);
		return cmd_base_addr;
	}

	cmd_base_addr += die << (cfi->cfiq->DevSize - 1);

> +
> +	return cmd_base_addr;
> +}
> +
>  static inline int do_read_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
>  {
>  	unsigned long cmd_addr;
> @@ -1180,12 +1201,18 @@ static inline void otp_enter(struct map_info *map, struct flchip *chip,
>  			     loff_t adr, size_t len)
>  {
>  	struct cfi_private *cfi = map->fldrv_priv;
> +	unsigned long  cmd_base_addr;
>  
> -	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> +	/* For the dual die device, rebase the command base address according

Please do not use net-style comments.

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
