From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v4 5/5] mtd: mchp23k256: Add support for mchp23lcv1024
Date: Mon, 29 May 2017 11:15:36 +0200
Message-ID: <20170529111536.6b386321@bbrezillon>
References: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
 <20170524234916.16181-6-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170524234916.16181-6-chris.packham@alliedtelesis.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Mark Rutland <mark.rutland@arm.com>, andrew@lunn.ch, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 25 May 2017 11:49:16 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> The mchp23lcv1024 is similar to the mchp23k256, the differences (from a
> software point of view) are the capacity of the chip and the size of the
> addresses used.
> 
> There is no way to detect the specific chip so we must be told via a
> Device Tree or default to mchp23k256 when device tree is not used.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Changes in v2:
> - fix formatting in switch statement
> - add support for 24-bit addressing
> Changes in v3:
> - None
> Changes in v4:
> - reword commit message (thanks Andrew)
> - introduce mchp23_caps struct (thanks Boris)
> 
>  .../bindings/mtd/microchip,mchp23k256.txt          |  2 +-
>  drivers/mtd/devices/mchp23k256.c                   | 66 ++++++++++++++++++----
>  2 files changed, 57 insertions(+), 11 deletions(-)
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
> index 3e5feb454644..8956b7dcc984 100644
> --- a/drivers/mtd/devices/mchp23k256.c
> +++ b/drivers/mtd/devices/mchp23k256.c
> @@ -21,10 +21,18 @@
>  #include <linux/spi/spi.h>
>  #include <linux/of_device.h>
>  
> +#define MAX_CMD_SIZE		4
> +
> +struct mchp23_caps {
> +	u8 addr_width;
> +	unsigned int size;
> +};
> +
>  struct mchp23k256_flash {
>  	struct spi_device	*spi;
>  	struct mutex		lock;
>  	struct mtd_info		mtd;
> +	const struct mchp23_caps	*caps;
>  };
>  
>  #define MCHP23K256_CMD_WRITE_STATUS	0x01
> @@ -34,22 +42,40 @@ struct mchp23k256_flash {
>  
>  #define to_mchp23k256_flash(x) container_of(x, struct mchp23k256_flash, mtd)
>  
> +static void mchp23k256_addr2cmd(struct mchp23k256_flash *flash,
> +				unsigned int addr, u8 *cmd)
> +{
> +	int i;
> +
> +	/*
> +	 * Address is sent in big endian (MSB first) and we skip
> +	 * the first entry of the cmd array which contains the cmd
> +	 * opcode.
> +	 */
> +	for (i = flash->caps->addr_width; i > 0; i--, addr >>= 8)
> +		cmd[i] = addr;
> +}
> +
> +static int mchp23k256_cmdsz(struct mchp23k256_flash *flash)
> +{
> +	return 1 + flash->caps->addr_width;
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
> @@ -73,17 +99,16 @@ static int mchp23k256_read(struct mtd_info *mtd, loff_t from, size_t len,
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
> @@ -123,6 +148,16 @@ static int mchp23k256_set_mode(struct spi_device *spi)
>  	return spi_sync(spi, &message);
>  }
>  
> +static const struct mchp23_caps mchp23k256_caps = {
> +	.size = SZ_32K,
> +	.addr_width = 2,
> +};
> +
> +static const struct mchp23_caps mchp23lcv1024_caps = {
> +	.size = SZ_128K,
> +	.addr_width = 3,
> +};
> +
>  static int mchp23k256_probe(struct spi_device *spi)
>  {
>  	struct mchp23k256_flash *flash;
> @@ -143,12 +178,16 @@ static int mchp23k256_probe(struct spi_device *spi)
>  
>  	data = dev_get_platdata(&spi->dev);
>  
> +	flash->caps = of_device_get_match_data(&spi->dev);
> +	if (!flash->caps)
> +		flash->caps = &mchp23k256_caps;
> +
>  	mtd_set_of_node(&flash->mtd, spi->dev.of_node);
>  	flash->mtd.dev.parent	= &spi->dev;
>  	flash->mtd.type		= MTD_RAM;
>  	flash->mtd.flags	= MTD_CAP_RAM;
>  	flash->mtd.writesize	= 1;
> -	flash->mtd.size		= SZ_32K;
> +	flash->mtd.size		= flash->caps->size;
>  	flash->mtd._read	= mchp23k256_read;
>  	flash->mtd._write	= mchp23k256_write;
>  
> @@ -168,7 +207,14 @@ static int mchp23k256_remove(struct spi_device *spi)
>  }
>  
>  static const struct of_device_id mchp23k256_of_table[] = {
> -	{ .compatible = "microchip,mchp23k256" },
> +	{
> +		.compatible = "microchip,mchp23k256",
> +		.data = &mchp23k256_caps,
> +	},
> +	{
> +		.compatible = "microchip,mchp23lcv1024",
> +		.data = &mchp23lcv1024_caps,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, mchp23k256_of_table);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
