From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [RESEND PATCH v2 26/53] mtd: nand: denali: support 1024 byte
 ECC step size
Date: Wed, 22 Mar 2017 22:32:39 +0100
Message-ID: <20170322223239.70a45053@bbrezillon>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
 <1490213273-8571-27-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1490213273-8571-27-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: laurent.monat@idquantique.com, devicetree@vger.kernel.org, thorsten.christiansson@idquantique.com, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, Brian Norris <computersforpeace@gmail.com>, Enrico Jorns <ejo@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>, Graham Moore <grmoore@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Thu, 23 Mar 2017 05:07:25 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> This driver was originally written for the Intel MRST platform with
> several platform specific parameters hard-coded.  Another thing we
> need to fix is the hard-coded ECC step size.  Currently, it is
> defined as follows:
> 
>   #define ECC_SECTOR_SIZE 512
> 
> (somehow, it is defined in both denali.c and denali.h)
> 
> This must be avoided because the Denali IP supports 1024B ECC size
> as well.  The Denali User's Guide also says supporting both 512B and
> 1024B ECC sectors is possible, though it would require instantiation
> of two different ECC circuits.  So, possible cases are:
> 
>  [1] only 512B ECC size is supported
>  [2] only 1024B ECC size is supported
>  [3] both 512B and 1024B ECC sizes are supported
> 
> For [3], the actually used ECC size is specified by some registers.
> 
> Newer versions of this IP have the following registers:
>   CFG_DATA_BLOCK_SIZE       (0x6b0)
>   CFG_LAST_DATA_BLOCK_SIZE  (0x6c0)
>   CFG_NUM_DATA_BLOCKS       (0x6d0)
> 
> For those versions, the software should set ecc.size and ecc.steps
> to these registers.  Old versions do not have such registers, but
> they are "reserved", so write accesses are safely ignored.
> 
> This commit adds new flags DENALI_CAP_ECC_SIZE_{512,1024}.
> 
> The DT property "nand-ecc-step-size" is still optional; a reasonable
> default will be chosen for [1] and [2].  For case [3], if exists, it
> is recommended to specify the desired ECC size explicitly.

Actually, the NAND chip gives some hints to help controller drivers
decide which ecc-block-size/strength is appropriate
(chip->ecc_strength_ds, chip->ecc_step_ds), so, in most cases
nand-ecc-step-size is unneeded (unless you want to force a specific
setting).

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes in v2:
>   - Change the capability prefix DENALI_CAPS_ -> DENALI_CAP_
>   - Make ECC 512 cap and ECC 1024 cap independent
>   - Set up three CFG_... registers
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  5 +++
>  drivers/mtd/nand/denali.c                          | 44 +++++++++++++++-------
>  drivers/mtd/nand/denali.h                          | 12 +++++-
>  drivers/mtd/nand/denali_dt.c                       |  3 +-
>  drivers/mtd/nand/denali_pci.c                      |  2 +
>  5 files changed, 50 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> index e593bbe..25313c7 100644
> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> @@ -7,6 +7,11 @@ Required properties:
>    - reg-names: Should contain the reg names "nand_data" and "denali_reg"
>    - interrupts : The interrupt number.
>  
> +Optional properties:
> +  - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to:
> +      512   for "altr,socfpga-denali-nand"
> +    see nand.txt for details.
> +
>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.
>  
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index a190cb2..cf8daba 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -875,8 +875,6 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
>  	return max_bitflips;
>  }
>  
> -#define ECC_SECTOR_SIZE 512
> -
>  #define ECC_SECTOR(x)	(((x) & ECC_ERROR_ADDRESS__SECTOR_NR) >> 12)
>  #define ECC_BYTE(x)	(((x) & ECC_ERROR_ADDRESS__OFFSET))
>  #define ECC_CORRECTION_VALUE(x) ((x) & ERR_CORRECTION_INFO__BYTEMASK)
> @@ -887,6 +885,7 @@ static int denali_hw_ecc_fixup(struct mtd_info *mtd,
>  static int denali_sw_ecc_fixup(struct mtd_info *mtd,
>  			       struct denali_nand_info *denali, uint8_t *buf)
>  {
> +	unsigned int ecc_size = denali->nand.ecc.size;
>  	unsigned int bitflips = 0;
>  	unsigned int max_bitflips = 0;
>  	unsigned int total_bitflips = 0;
> @@ -914,9 +913,9 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
>  
>  		if (ECC_ERROR_UNCORRECTABLE(err_cor_info)) {
>  			ret = -EBADMSG;
> -		} else if (err_byte < ECC_SECTOR_SIZE) {
> +		} else if (err_byte < ecc_size) {
>  			/*
> -			 * If err_byte is larger than ECC_SECTOR_SIZE, means error
> +			 * If err_byte is larger than ecc_size, means error
>  			 * happened in OOB, so we ignore it. It's no need for
>  			 * us to correct it err_device is represented the NAND
>  			 * error bits are happened in if there are more than
> @@ -925,7 +924,7 @@ static int denali_sw_ecc_fixup(struct mtd_info *mtd,
>  			int offset;
>  			unsigned int flips_in_byte;
>  
> -			offset = (err_sector * ECC_SECTOR_SIZE + err_byte) *
> +			offset = (err_sector * ecc_size + err_byte) *
>  						denali->devnum + err_device;
>  
>  			/* correct the ECC error */
> @@ -1579,22 +1578,37 @@ int denali_init(struct denali_nand_info *denali)
>  	/* no subpage writes on denali */
>  	chip->options |= NAND_NO_SUBPAGE_WRITE;
>  
> +	if (!chip->ecc.size) {

You should set it to chip->ecc_step_ds and pick a default value only if
it's still 0 after that. Same goes for ecc.strength.

> +		if (denali->caps & DENALI_CAP_ECC_SIZE_512)
> +			chip->ecc.size = 512;
> +		if (denali->caps & DENALI_CAP_ECC_SIZE_1024)
> +			chip->ecc.size = 1024;
> +		if (WARN(!chip->ecc.size, "must support at least 512 or 1024 ECC size"))
> +			goto failed_req_irq;
> +	}
> +
> +	if ((chip->ecc.size != 512 && chip->ecc.size != 1024) ||
> +	    (chip->ecc.size == 512 && !(denali->caps & DENALI_CAP_ECC_SIZE_512)) ||
> +	    (chip->ecc.size == 1024 && !(denali->caps & DENALI_CAP_ECC_SIZE_1024))) {
> +		dev_err(denali->dev, "specified ECC size %d in not supported",
> +			chip->ecc.size);
> +		goto failed_req_irq;
> +	}
> +
>  	/*
>  	 * Denali Controller only support 15bit and 8bit ECC in MRST,
>  	 * so just let controller do 15bit ECC for MLC and 8bit ECC for
>  	 * SLC if possible.

Usually the NAND chips expose the ECC requirements, so basing our
decision only on the type of NAND sounds a bit weird.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
