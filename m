From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 5/5] mtd: mchp23k256: Add support for mchp23lcv1024
Date: Tue, 23 May 2017 09:14:23 +0200
Message-ID: <20170523091423.1a0b84d9@bbrezillon>
References: <20170523004317.16908-1-chris.packham@alliedtelesis.co.nz>
        <20170523004317.16908-6-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170523004317.16908-6-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le Tue, 23 May 2017 12:43:17 +1200,
Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> a écrit :

> The mchp23lcv1024 is software compatible with the mchp23k256, the
> only difference (from a software point of view) is the size. There
> is no way to detect the size so we must be told via a Device Tree.
> 
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
> ---
> Changes in v2:
> - fix formatting in switch statement
> - add support for 24-bit addressing
> Changes in v3:
> - None
> 
>  .../bindings/mtd/microchip,mchp23k256.txt          |  2 +-
>  drivers/mtd/devices/mchp23k256.c                   | 53 ++++++++++++++++++----
>  2 files changed, 44 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> index 25e5ad38b0f0..7328eb92a03c 100644
> --- a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> +++ b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> @@ -3,7 +3,7 @@
>  Required properties:
>  - #address-cells, #size-cells : Must be present if the device has sub-nodes
>    representing partitions.
> -- compatible : Must be "microchip,mchp23k256"
> +- compatible : Must be one of "microchip,mchp23k256" or "microchip,mchp23lcv1024"
>  - reg : Chip-Select number
>  - spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
>  
> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> index 3e5feb454644..72ecf374a06a 100644
> --- a/drivers/mtd/devices/mchp23k256.c
> +++ b/drivers/mtd/devices/mchp23k256.c
> @@ -21,10 +21,14 @@
>  #include <linux/spi/spi.h>
>  #include <linux/of_device.h>
>  
> +#define MAX_CMD_SIZE		4
> +enum chips { mchp23k256, mchp23lcv1024 };
> +
>  struct mchp23k256_flash {
>  	struct spi_device	*spi;
>  	struct mutex		lock;
>  	struct mtd_info		mtd;
> +	u8			addr_width;
>  };

How about creating a struct mchp23_caps or mchp23_specs struct
containing the SRAM specs.

struct mchp23_caps {
	u8 addr_width;
	unsigned int size;
}

and then

struct mchp23k256_flash {
	...
	const struct mchp32_cap	*caps;
};

This way you can get rid of the enum and add new fields to the caps
struct if needed.

BTW, it's really weird to have the _flash extension in the struct name,
while we're actually dealing with SRAMs.

>  
>  #define MCHP23K256_CMD_WRITE_STATUS	0x01
> @@ -34,22 +38,35 @@ struct mchp23k256_flash {
>  
>  #define to_mchp23k256_flash(x) container_of(x, struct mchp23k256_flash, mtd)
>  
> +static void mchp23k256_addr2cmd(struct mchp23k256_flash *flash,
> +				unsigned int addr, u8 *cmd)
> +{
> +	/* cmd[0] has opcode */
> +	cmd[1] = addr >> (flash->addr_width * 8 -  8);
> +	cmd[2] = addr >> (flash->addr_width * 8 - 16);
> +	cmd[3] = addr >> (flash->addr_width * 8 - 24);

or

	int i;

	/*
	 * Address is sent in big endian (MSB first) and we skip
	 * the first entry of the cmd array which contains the cmd
	 * opcode.
	 */
	for (i = flash->caps->addr_width; i--, addr >>= 8; i > 0)
		cmd[i] = addr;

> +}
> +
> +static int mchp23k256_cmdsz(struct mchp23k256_flash *flash)
> +{
> +	return 1 + flash->addr_width;
> +}
> +
>  static int mchp23k256_write(struct mtd_info *mtd, loff_t to, size_t len,
>  			    size_t *retlen, const unsigned char *buf)
>  {
>  	struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
>  	struct spi_transfer transfer[2] = {};
>  	struct spi_message message;
> -	unsigned char command[3];
> +	unsigned char command[MAX_CMD_SIZE];
>  
>  	spi_message_init(&message);
>  
>  	command[0] = MCHP23K256_CMD_WRITE;
> -	command[1] = to >> 8;
> -	command[2] = to;
> +	mchp23k256_addr2cmd(flash, to, command);
>  
>  	transfer[0].tx_buf = command;
> -	transfer[0].len = sizeof(command);
> +	transfer[0].len = mchp23k256_cmdsz(flash);
>  	spi_message_add_tail(&transfer[0], &message);
>  
>  	transfer[1].tx_buf = buf;
> @@ -73,17 +90,16 @@ static int mchp23k256_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	struct mchp23k256_flash *flash = to_mchp23k256_flash(mtd);
>  	struct spi_transfer transfer[2] = {};
>  	struct spi_message message;
> -	unsigned char command[3];
> +	unsigned char command[MAX_CMD_SIZE];
>  
>  	spi_message_init(&message);
>  
>  	memset(&transfer, 0, sizeof(transfer));
>  	command[0] = MCHP23K256_CMD_READ;
> -	command[1] = from >> 8;
> -	command[2] = from;
> +	mchp23k256_addr2cmd(flash, from, command);
>  
>  	transfer[0].tx_buf = command;
> -	transfer[0].len = sizeof(command);
> +	transfer[0].len = mchp23k256_cmdsz(flash);
>  	spi_message_add_tail(&transfer[0], &message);
>  
>  	transfer[1].rx_buf = buf;

static const struct mchp23_caps mchp23k256_caps = {
	.size = SZ_32K,
	.addr_width = 2;
};

static const struct mchp23_caps mchp23lcv1024_caps = {
	.size = SZ_128K,
	.addr_width = 3;
};

> @@ -128,6 +144,7 @@ static int mchp23k256_probe(struct spi_device *spi)
>  	struct mchp23k256_flash *flash;
>  	struct flash_platform_data *data;
>  	int err;
> +	enum chips chip;
>  
>  	flash = devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
>  	if (!flash)
> @@ -143,15 +160,30 @@ static int mchp23k256_probe(struct spi_device *spi)
>  
>  	data = dev_get_platdata(&spi->dev);
>  
> +	if (spi->dev.of_node)
> +		chip = (enum chips)of_device_get_match_data(&spi->dev);
> +	else
> +		chip = mchp23k256;

	flash->caps = of_device_get_match_data(&spi->dev);
	if (!flash->caps)
		flash->caps = mchp23k256_caps;

> +
>  	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
>  	flash->mtd.dev.parent	= &spi->dev;
>  	flash->mtd.type		= MTD_RAM;
>  	flash->mtd.flags	= MTD_CAP_RAM;
>  	flash->mtd.writesize	= 1;
> -	flash->mtd.size		= SZ_32K;
>  	flash->mtd._read	= mchp23k256_read;
>  	flash->mtd._write	= mchp23k256_write;
>  
> +	switch (chip) {
> +	case mchp23lcv1024:
> +		flash->mtd.size		= SZ_128K;
> +		flash->addr_width	= 3;
> +		break;
> +	default:
> +		flash->mtd.size		= SZ_32K;
> +		flash->addr_width	= 2;
> +		break;
> +	}
> +
>  	err = mtd_device_register(&flash->mtd, data ? data->parts : NULL,
>  				  data ? data->nr_parts : 0);
>  	if (err)
> @@ -168,7 +200,8 @@ static int mchp23k256_remove(struct spi_device *spi)
>  }
>  
>  static const struct of_device_id mchp23k256_of_table[] = {
> -	{ .compatible = "microchip,mchp23k256" },
> +	{ .compatible = "microchip,mchp23k256", .data = (void *)mchp23k256 },
> +	{ .compatible = "microchip,mchp23lcv1024", .data = (void *)mchp23lcv1024 },

	{
		.compatible = "microchip,mchp23k256",
		.data = &mchp23k256_caps,
	},
	{
		.compatible = "microchip,mchp23lcv1024",
		.data = &mchp23lcv1024_caps,
	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, mchp23k256_of_table);

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
