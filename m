From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v4 1/5] mtd: mchp23k256: Add OF device ID table
Date: Mon, 29 May 2017 11:13:19 +0200
Message-ID: <20170529111319.1c261582@bbrezillon>
References: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
 <20170524234916.16181-2-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20170524234916.16181-2-chris.packham@alliedtelesis.co.nz>
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

On Thu, 25 May 2017 11:49:12 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> This allows registering of this device via a Device Tree.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Andrew Lunn <andrew@lunn.ch>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Changes in v2:
> - collect review/test from Andrew
> Changes in v3:
> - None
> Changes in v4:
> - None
> 
>  .../devicetree/bindings/mtd/microchip,mchp23k256.txt   | 18 ++++++++++++++++++
>  drivers/mtd/devices/mchp23k256.c                       |  8 ++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> new file mode 100644
> index 000000000000..25e5ad38b0f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
> @@ -0,0 +1,18 @@
> +* MTD SPI driver for Microchip 23K256 (and similar) serial SRAM
> +
> +Required properties:
> +- #address-cells, #size-cells : Must be present if the device has sub-nodes
> +  representing partitions.
> +- compatible : Must be "microchip,mchp23k256"
> +- reg : Chip-Select number
> +- spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
> +
> +Example:
> +
> +	spi-sram@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "microchip,mchp23k256";
> +		reg = <0>;
> +		spi-max-frequency = <20000000>;
> +	};
> diff --git a/drivers/mtd/devices/mchp23k256.c b/drivers/mtd/devices/mchp23k256.c
> index e237db9f1bdb..9d8306a15833 100644
> --- a/drivers/mtd/devices/mchp23k256.c
> +++ b/drivers/mtd/devices/mchp23k256.c
> @@ -19,6 +19,7 @@
>  #include <linux/sizes.h>
>  #include <linux/spi/flash.h>
>  #include <linux/spi/spi.h>
> +#include <linux/of_device.h>
>  
>  struct mchp23k256_flash {
>  	struct spi_device	*spi;
> @@ -166,9 +167,16 @@ static int mchp23k256_remove(struct spi_device *spi)
>  	return mtd_device_unregister(&flash->mtd);
>  }
>  
> +static const struct of_device_id mchp23k256_of_table[] = {
> +	{ .compatible = "microchip,mchp23k256" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mchp23k256_of_table);
> +
>  static struct spi_driver mchp23k256_driver = {
>  	.driver = {
>  		.name	= "mchp23k256",
> +		.of_match_table = of_match_ptr(mchp23k256_of_table),
>  	},
>  	.probe		= mchp23k256_probe,
>  	.remove		= mchp23k256_remove,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
