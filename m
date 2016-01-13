From: "Yang, Wenyou" <wenyou.yang@atmel.com>
Subject: Re: [RFC PATCH 1/4] mtd: atmel_nand: Do not warn on bitflips
Date: Wed, 13 Jan 2016 13:12:12 +0800
Message-ID: <5695DCAC.3030306@atmel.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
 <1452609223-14790-2-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1452609223-14790-2-git-send-email-romain.izard.pro@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Romain Izard <romain.izard.pro@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Cc: Josh Wu <josh.wu@atmel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: devicetree@vger.kernel.org

Hi Romain,

On 2016/1/12 22:33, Romain Izard wrote:
> When using multi-bit ECC, it is normal for the NAND Flash driver to
> correct bit errors during the life of the product. Those errors will
> only be cleared once a threshold has been reached, and corrections can
> occur regularly before this.
>
> Use only dev_dbg and not dev_info to report the bitflips, to keep the
> system log clean when everything works correctly.
>
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>

Acked-by:  Wenyou Yang <wenyou.yang@atmel.com>

> ---
>   drivers/mtd/nand/atmel_nand.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 46010bd895b1..9d71f9e6a8de 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -824,7 +824,7 @@ static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t *ecc,
>   			*(buf + byte_pos) ^= (1 << bit_pos);
>   
>   			pos = sector_num * host->pmecc_sector_size + byte_pos;
> -			dev_info(host->dev, "Bit flip in data area, byte_pos: %d, bit_pos: %d, 0x%02x -> 0x%02x\n",
> +			dev_dbg(host->dev, "Bit flip in data area, byte_pos: %d, bit_pos: %d, 0x%02x -> 0x%02x\n",
>   				pos, bit_pos, err_byte, *(buf + byte_pos));
>   		} else {
>   			/* Bit flip in OOB area */
> @@ -834,7 +834,7 @@ static void pmecc_correct_data(struct mtd_info *mtd, uint8_t *buf, uint8_t *ecc,
>   			ecc[tmp] ^= (1 << bit_pos);
>   
>   			pos = tmp + nand_chip->ecc.layout->eccpos[0];
> -			dev_info(host->dev, "Bit flip in OOB, oob_byte_pos: %d, bit_pos: %d, 0x%02x -> 0x%02x\n",
> +			dev_dbg(host->dev, "Bit flip in OOB, oob_byte_pos: %d, bit_pos: %d, 0x%02x -> 0x%02x\n",
>   				pos, bit_pos, err_byte, ecc[tmp]);
>   		}
>   

Best Regards,
Wenyou Yang

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
