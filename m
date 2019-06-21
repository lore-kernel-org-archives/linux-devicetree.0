From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] drivers: mtd: spi-nor: Add flash property for mt25qu512a
 and mt35xu02g
Date: Fri, 21 Jun 2019 11:07:47 +0530
Message-ID: <f28085b6-7c0a-1a0c-cc01-c41f35c9ecae@ti.com>
References: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Ashish Kumar <Ashish.Kumar@nxp.com>, devicetree@vger.kernel.org
Cc: Kuldeep Singh <kuldeep.singh@nxp.com>, broonie@kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bbrezillon@kernel.org
List-Id: devicetree@vger.kernel.org



On 19/06/19 4:41 PM, Ashish Kumar wrote:
> From: Kuldeep Singh <kuldeep.singh@nxp.com>
> 

Please add a suitable commit message. Like, which boards have these
flashes and how was it tested? What modes were tested?

> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>

Need submitter's Sign off as well.

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 73172d7..34e33a7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1880,6 +1880,7 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>  	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> +	{ "mt25qu512a", INFO6(0x20bb20, 0x104400, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_4B_OPCODES) },

How is this flash/entry different from n25q512a that has same initial
JEDEC ID bytes? Would be good to have that documented in the commit message

>  	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
>  
>  	/* Micron */
> @@ -1888,6 +1889,7 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>  			SPI_NOR_4B_OPCODES)
>  	},
> +	{ "mt35xu02g",   INFO(0x2c5b1c, 0, 128 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES) },
>  
>  	/* PMC */
>  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
> 

Also, patch numbering isn't right. Moreover other patches in the series
are independent of this patch. Please resubmit this patch separately
after addressing all the comments.

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
