From: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 1/5 v2] ARM: kirkwood: covert orion-spi to fdt.
Date: Sun, 4 Mar 2012 19:12:20 +0100
Message-ID: <201203041912.21137.michael@walle.cc>
References: <cover.1330709314.git.jason@lakedaemon.net>
 <a3c65ac8146eab1796dec771c1ddfe403d1471a9.1330709314.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a3c65ac8146eab1796dec771c1ddfe403d1471a9.1330709314.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

Am Freitag 02 M=E4rz 2012, 18:50:18 schrieb Jason Cooper:
> On the Globalscale Dreamplug (Marvell Kirkwood Development Platform),
> 2MB of NOR flash are used to hold the bootloader, bootloader
> environment, and devicetree blob.  It is connected via spi.
> =

> Signed-off-by: Jason Cooper <jason@lakedaemon.net>
> ---
> =

> Changes from v1:
> =

>     - used of_match_ptr() as suggested by Grant Likely
> =

>  arch/arm/boot/dts/kirkwood-dreamplug.dts |   34 +++++++++++++++++++++++++
>  arch/arm/mach-kirkwood/board-dt.c        |   40
> ------------------------------ arch/arm/mach-kirkwood/common.c          | =

>  11 ++++++++
>  drivers/spi/spi-orion.c                  |   37
> ++++++++++++++++++++++++--- 4 files changed, 78 insertions(+), 44
> deletions(-)
> =

> diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts
> b/arch/arm/boot/dts/kirkwood-dreamplug.dts index 8a5dff8..bdf2ddc 100644
> --- a/arch/arm/boot/dts/kirkwood-dreamplug.dts
> +++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
> @@ -22,4 +22,38 @@
>  		interrupts =3D <33>;
>  		clock-frequency =3D <200000000>;
>  	};
> +
> +	spi@f1010600 {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		compatible =3D "marvell,orion-spi";
> +		reg =3D <0xf1010600 0x1ff>;
> +		clock-frequency =3D <200000000>;
> +
> +		flash@0 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			compatible =3D "macronix,mx25l1606e", "jedec-flash";
> +
> +			spi-max-frequency =3D <50000000>;
> +			reg =3D <0>;
> +
> +			partition@0 {
> +				label =3D "U-Boot";
> +				reg =3D <0x0 0x100000>;
> +			};
> +
> +			partition@100000 {
> +				label =3D "U-Boot Environment";
> +				reg =3D <0x100000 0x080000>;
> +			};
> +
> +			partition@180000 {
> +				label =3D "Flattened Device Tree";
> +				reg =3D <0x180000 0x080000>;
> +			};
> +		};
> +	};
>  };
> diff --git a/arch/arm/mach-kirkwood/board-dt.c
> b/arch/arm/mach-kirkwood/board-dt.c index fbe6405..4960e63 100644
> --- a/arch/arm/mach-kirkwood/board-dt.c
> +++ b/arch/arm/mach-kirkwood/board-dt.c
> @@ -39,42 +39,6 @@ static struct of_device_id kirkwood_dt_match_table[]
> __initdata =3D { { }
>  };
> =

> -struct mtd_partition dreamplug_partitions[] =3D {
> -	{
> -		.name	=3D "u-boot",
> -		.size	=3D SZ_512K,
> -		.offset =3D 0,
> -	},
> -	{
> -		.name	=3D "u-boot env",
> -		.size	=3D SZ_64K,
> -		.offset =3D SZ_512K + SZ_512K,
> -	},
> -	{
> -		.name	=3D "dtb",
> -		.size	=3D SZ_64K,
> -		.offset =3D SZ_512K + SZ_512K + SZ_512K,
> -	},
> -};
> -
> -static const struct flash_platform_data dreamplug_spi_slave_data =3D {
> -	.type		=3D "mx25l1606e",
> -	.name		=3D "spi_flash",
> -	.parts		=3D dreamplug_partitions,
> -	.nr_parts	=3D ARRAY_SIZE(dreamplug_partitions),
> -};
> -
> -static struct spi_board_info __initdata dreamplug_spi_slave_info[] =3D {
> -	{
> -		.modalias	=3D "m25p80",
> -		.platform_data	=3D &dreamplug_spi_slave_data,
> -		.irq		=3D -1,
> -		.max_speed_hz	=3D 50000000,
> -		.bus_num	=3D 0,
> -		.chip_select	=3D 0,
> -	},
> -};
> -
>  static struct mv643xx_eth_platform_data dreamplug_ge00_data =3D {
>  	.phy_addr	=3D MV643XX_ETH_PHY_ADDR(0),
>  };
> @@ -140,10 +104,6 @@ static void __init dreamplug_init(void)
>  	 */
>  	kirkwood_mpp_conf(dreamplug_mpp_config);
> =

> -	spi_register_board_info(dreamplug_spi_slave_info,
> -				ARRAY_SIZE(dreamplug_spi_slave_info));
> -	kirkwood_spi_init();
> -
>  	kirkwood_ehci_init();
>  	kirkwood_ge00_init(&dreamplug_ge00_data);
>  	kirkwood_ge01_init(&dreamplug_ge01_data);
> diff --git a/arch/arm/mach-kirkwood/common.c
> b/arch/arm/mach-kirkwood/common.c index cc15426..357fcde 100644
> --- a/arch/arm/mach-kirkwood/common.c
> +++ b/arch/arm/mach-kirkwood/common.c
> @@ -15,6 +15,7 @@
>  #include <linux/ata_platform.h>
>  #include <linux/mtd/nand.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/of.h>
>  #include <net/dsa.h>
>  #include <asm/page.h>
>  #include <asm/timex.h>
> @@ -481,6 +482,9 @@ static int __init kirkwood_clock_gate(void)
>  {
>  	unsigned int curr =3D readl(CLOCK_GATING_CTRL);
>  	u32 dev, rev;
> +#ifdef CONFIG_OF
> +	struct device_node *dp;
> +#endif
> =

>  	kirkwood_pcie_id(&dev, &rev);
>  	printk(KERN_DEBUG "Gating clock of unused units\n");
> @@ -524,6 +528,13 @@ static int __init kirkwood_clock_gate(void)
>  	} else  /* keep this bit set for devices that don't have PCIe1 */
>  		kirkwood_clk_ctrl |=3D CGC_PEX1;
> =

> +#ifdef CONFIG_OF
> +	dp =3D of_find_node_by_path("/");
> +	if (dp && of_device_is_available(of_find_compatible_node(dp, NULL,
> +							  "marvell,orion-
spi")))
> +		kirkwood_clk_ctrl |=3D CGC_RUNIT;
> +#endif
> +
>  	/* Now gate clock the required units */
>  	writel(kirkwood_clk_ctrl, CLOCK_GATING_CTRL);
>  	printk(KERN_DEBUG " after: 0x%08x\n", readl(CLOCK_GATING_CTRL));
> diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
> index 13448c8..acfb240 100644
> --- a/drivers/spi/spi-orion.c
> +++ b/drivers/spi/spi-orion.c
> @@ -18,6 +18,7 @@
>  #include <linux/spi/spi.h>
>  #include <linux/spi/orion_spi.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <asm/unaligned.h>
> =

>  #define DRIVER_NAME			"orion_spi"
> @@ -45,6 +46,8 @@ struct orion_spi {
>  	void __iomem		*base;
>  	unsigned int		max_speed;
>  	unsigned int		min_speed;
> +	unsigned int		tclk;
> +	unsigned int		clock_fix;
>  	struct orion_spi_info	*spi_info;
>  };
> =

> @@ -104,7 +107,7 @@ static int orion_spi_baudrate_set(struct spi_device
> *spi, unsigned int speed)
> =

>  	orion_spi =3D spi_master_get_devdata(spi->master);
> =

> -	tclk_hz =3D orion_spi->spi_info->tclk;
> +	tclk_hz =3D orion_spi->tclk;
> =

>  	/*
>  	 * the supported rates are: 4,6,8...30
> @@ -360,7 +363,7 @@ static int orion_spi_setup(struct spi_device *spi)
>  	orion_spi =3D spi_master_get_devdata(spi->master);
> =

>  	/* Fix ac timing if required.   */
> -	if (orion_spi->spi_info->enable_clock_fix)
> +	if (orion_spi->clock_fix)
>  		orion_spi_setbits(orion_spi, ORION_SPI_IF_CONFIG_REG,
>  				  (1 << 14));
> =

> @@ -474,6 +477,7 @@ static int __init orion_spi_probe(struct
> platform_device *pdev) master->setup =3D orion_spi_setup;
>  	master->transfer =3D orion_spi_transfer;
>  	master->num_chipselect =3D ORION_NUM_CHIPSELECTS;
> +	master->dev.of_node =3D pdev->dev.of_node;
> =

>  	dev_set_drvdata(&pdev->dev, master);
> =

> @@ -481,8 +485,26 @@ static int __init orion_spi_probe(struct
> platform_device *pdev) spi->master =3D master;
>  	spi->spi_info =3D spi_info;
> =

> -	spi->max_speed =3D DIV_ROUND_UP(spi_info->tclk, 4);
> -	spi->min_speed =3D DIV_ROUND_UP(spi_info->tclk, 30);
> +	if (spi_info)
> +		spi->tclk =3D spi_info->tclk;
> +
> +	of_property_read_u32(master->dev.of_node,
> +				"clock-frequency", &spi->tclk);
> +
> +	if (!spi->tclk) {
> +		dev_err(&pdev->dev, "cannot set clock rate\n");
shouldn't you check the return value of of_property_read_u32 instead? and =

report a more meaningful error message, eg no valid clock-frequency propert=
y =

in the OF case?

> +		status =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	spi->max_speed =3D DIV_ROUND_UP(spi->tclk, 4);
> +	spi->min_speed =3D DIV_ROUND_UP(spi->tclk, 30);
> +
> +	if (spi_info)
> +		spi->clock_fix =3D spi_info->enable_clock_fix;
> +
> +	if (of_find_property(master->dev.of_node, "spi-clock-fix", NULL))
> +		spi->clock_fix =3D 1;
> =

>  	r =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (r =3D=3D NULL) {
> @@ -541,10 +563,17 @@ static int __exit orion_spi_remove(struct
> platform_device *pdev)
> =

>  MODULE_ALIAS("platform:" DRIVER_NAME);
> =


#ifdef CONFIG_OF
> +static struct of_device_id spi_orion_of_match_table[] __devinitdata =3D {
> +	{ .compatible =3D "marvell,orion-spi", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, spi_orion_of_match_table);
#endif

>  static struct platform_driver orion_spi_driver =3D {
>  	.driver =3D {
>  		.name	=3D DRIVER_NAME,
>  		.owner	=3D THIS_MODULE,
> +		.of_match_table =3D of_match_ptr(spi_orion_of_match_table),
>  	},
>  	.remove		=3D __exit_p(orion_spi_remove),
>  };


-- =

Michael
