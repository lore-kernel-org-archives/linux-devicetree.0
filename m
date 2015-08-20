From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] [PATCH v5] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Thu, 20 Aug 2015 10:03:38 +0200
Message-ID: <201508201003.38179.marex@denx.de>
References: <1440053705-3836-1-git-send-email-vndao@altera.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440053705-3836-1-git-send-email-vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ngachi86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday, August 20, 2015 at 08:55:05 AM, vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> From: VIET NGA DAO <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> 
> Altera Quad SPI Controller is a soft IP which enables access to
> Altera EPCS and EPCQ flash chips. This patch adds driver
> for these devices.
> 
> Signed-off-by: VIET NGA DAO <vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> 
> ---
> v5:
> - Remove Micron support
> - Add multiple flashes probe failure handle
> 
> v4:
> - Add more flash devices support ( EPCQL and Micron)
> - Remove redundant messages
> - Change EPCQ_OPCODE_ID to NON_EPCS_OPCODE_ID
> - Replace get_flash_name to altera_quadspi_scan
> - Remove clk related parts
> - Remove altera_quadspi_plat
> - Change device tree reg name and remove opcode-id
> 
> v3:
> - Change altera_epcq driver name to altera_quadspi for more generic name
> - Implement flash name searching in altera_quadspi.c instead of spi-nor
> - Edit the altra quadspi info table in spi-nor
> - Remove wait_til_ready in all read,write, erase, lock, unlock functions
> - Merge .h and .c into 1 file
> 
> v2:
> - Change to spi_nor structure
> - Add lock and unlock functions for spi_nor
> - Simplify the altera_epcq_lock function
> - Replace reg by compatible in device tree
> ---
>  .../devicetree/bindings/mtd/altera-quadspi.txt     |   45 ++
>  drivers/mtd/spi-nor/Kconfig                        |    8 +
>  drivers/mtd/spi-nor/Makefile                       |    1 +
>  drivers/mtd/spi-nor/altera-quadspi.c               |  557
> ++++++++++++++++++++ drivers/mtd/spi-nor/spi-nor.c                      | 
>  18 +
>  5 files changed, 629 insertions(+), 0 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/mtd/altera-quadspi.txt create mode
> 100644 drivers/mtd/spi-nor/altera-quadspi.c
> 
> diff --git a/Documentation/devicetree/bindings/mtd/altera-quadspi.txt
> b/Documentation/devicetree/bindings/mtd/altera-quadspi.txt new file mode
> 100644
> index 0000000..e1bcf18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/altera-quadspi.txt
> @@ -0,0 +1,45 @@
> +* MTD Altera QUADSPI driver
> +
> +Required properties:
> +- compatible: Should be "altr,quadspi-1.0"
> +- reg: Address and length of the register set  for the device. It contains
> +  the information of registers in the same order as described by reg-names
> +- reg-names: Should contain the reg names
> +  "avl_csr": Should contain the register configuration base address
> +  "avl_mem": Should contain the data base address
> +- #address-cells: Must be <1>.
> +- #size-cells: Must be <0>.
> +- flash device tree subnode, there must be a node with the following
> fields: +	- compatible: Should contain the flash name:
> +	  1. EPCS:   epcs16, epcs64, epcs128
> +	  2. EPCQ:   epcq16, epcq32, epcq64, epcq128, epcq256, epcq512, epcq1024
> +	  3. EPCQ-L: epcql256, epcql512, epcql1024
> +	- #address-cells: please refer to /mtd/partition.txt
> +	- #size-cells: please refer to /mtd/partition.txt
> +	For partitions inside each flash, please refer to /mtd/partition.txt
> +
> +Example:
> +
> +			quadspi_controller_0: quadspi@0x180014a0 {
> +				compatible = "altr,quadspi-1.0";
> +				reg = <0x180014a0 0x00000020>,
> +				      <0x14000000 0x04000000>;
> +				reg-names = "avl_csr", "avl_mem";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				flash0: epcq256@0 {
> +					compatible = "altr,epcq256";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +					partition@0 {
> +						/* 16 MB for raw data. */
> +						label = "EPCQ Flash 0 raw data";
> +						reg = <0x0 0x1000000>;
> +					};
> +					partition@1000000 {
> +						/* 16 MB for jffs2 data. */
> +						label = "EPCQ Flash 0 JFFS 2";
> +						reg = <0x1000000 0x1000000>;
> +					};

IIRC, encoding partitions into OF is deprecated (and it shouldn't be
part of the example anyway, so please remove this bit).

> +				};
> +			}; //end quadspi@0x180014a0 (quadspi_controller_0)

Remove this incorrect comment.


[...]

> +static struct flash_device flash_devices[] = {
> +	FLASH_ID("epcs16",              EPCS_OPCODE_ID,     0x14),
> +	FLASH_ID("epcs64",              EPCS_OPCODE_ID,     0x16),
> +	FLASH_ID("epcs128",             EPCS_OPCODE_ID,     0x18),
> +
> +	FLASH_ID("epcq16",              NON_EPCS_OPCODE_ID, 0x15),
> +	FLASH_ID("epcq32",              NON_EPCS_OPCODE_ID, 0x16),
> +	FLASH_ID("epcq64",              NON_EPCS_OPCODE_ID, 0x17),
> +	FLASH_ID("epcq128",             NON_EPCS_OPCODE_ID, 0x18),
> +	FLASH_ID("epcq256",             NON_EPCS_OPCODE_ID, 0x19),
> +	FLASH_ID("epcq512",             NON_EPCS_OPCODE_ID, 0x20),
> +	FLASH_ID("epcq1024",            NON_EPCS_OPCODE_ID, 0x21),
> +
> +	FLASH_ID("epcql256",            NON_EPCS_OPCODE_ID, 0x19),
> +	FLASH_ID("epcql512",            NON_EPCS_OPCODE_ID, 0x20),
> +	FLASH_ID("epcql1024",           NON_EPCS_OPCODE_ID, 0x21),
> +
> +};

I think it'd be better to wait until the IP block is fixed and can
issue READID correctly.

> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 14a5d23..2ab7279 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -687,6 +687,24 @@ static const struct spi_device_id spi_nor_ids[] = {
>  	{ "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE |
> SPI_NOR_NO_FR) }, { "cat25c17", CAT25_INFO( 256, 8, 32, 2,
> SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) }, { "cat25128", CAT25_INFO(2048, 8, 64,
> 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) }, +
> +	/* Altera EPCQ/EPCS Flashes are non-JEDEC */

Are they really ? Last time I checked on CV SoC, I was able to read their
JEDEC ID just fine ; though it's true I used that EPCS core.

> +	{ "epcs16",   INFO(0, 0, 0x10000, 32,   0) },
> +	{ "epcs64",   INFO(0, 0, 0x10000, 128,  0) },
> +	{ "epcs128",  INFO(0, 0, 0x40000, 256,  0) },
> +
> +	{ "epcq16",   INFO(0, 0, 0x10000, 32,   0) },
> +	{ "epcq32",   INFO(0, 0, 0x10000, 64,   0) },
> +	{ "epcq64",   INFO(0, 0, 0x10000, 128,  0) },
> +	{ "epcq128",  INFO(0, 0, 0x10000, 256,  0) },
> +	{ "epcq256",  INFO(0, 0, 0x10000, 512,  0) },
> +	{ "epcq512",  INFO(0, 0, 0x10000, 1024, 0) },
> +	{ "epcq1024", INFO(0, 0, 0x10000, 2048, 0) },
> +
> +	{ "epcql256",  INFO(0, 0, 0x10000, 512,  0) },
> +	{ "epcql512",  INFO(0, 0, 0x10000, 1024, 0) },
> +	{ "epcql1024", INFO(0, 0, 0x10000, 2048, 0) },
> +
>  	{ },
>  };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
