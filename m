From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 2/2] mtd: spi-nor: cadence-quadspi: disable the DMA,
 DAC and auto poll
Date: Thu, 22 Aug 2019 14:33:18 +0530
Message-ID: <53dcc9a9-6adb-a1de-cfb4-11a68e5d3d4c@ti.com>
References: <20190819115424.41479-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190819115424.41479-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190819115424.41479-2-vadivel.muruganx.ramuthevar@linux.intel.com>
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
To: "Ramuthevar, Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>, linux-mtd@lists.infradead.org
Cc: devicetree@vger.kernel.org, boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@atmel.com, linux-kernel@vger.kernel.org, jwboyer@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org, david.oberhollenzer@sigma-star.at
List-Id: devicetree@vger.kernel.org

Hi,

On 19/08/19 5:24 PM, Ramuthevar, Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> On Intel Lightening Mountain(LGM) SoCs QSPI controller do not use

s/Lightening/Lightning

> Direct Memory Access(DMA), Direct Access Controller(DAC) and
> auto-poll features. This patch introduces to properly disable DMA,
> DAC for data transfer instead it uses indirect data transfer.
> and also auto polling.
> 

Please split into two patch, one disabling DAC mode and DMA and other
disabling auto polling feature.

> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/Kconfig           |  2 +-
>  drivers/mtd/spi-nor/cadence-quadspi.c | 62 ++++++++++++++++++++++++++++++-----
>  2 files changed, 55 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 6de83277ce8b..ba2e372ae514 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -34,7 +34,7 @@ config SPI_ASPEED_SMC
>  
>  config SPI_CADENCE_QUADSPI
>  	tristate "Cadence Quad SPI controller"
> -	depends on OF && (ARM || ARM64 || COMPILE_TEST)
> +	depends on OF && (ARM || ARM64 || COMPILE_TEST || X86)
>  	help
>  	  Enable support for the Cadence Quad SPI Flash controller.
>  
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 67f15a1f16fd..83ae28e055f4 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -67,6 +67,7 @@ struct cqspi_st {
>  
>  	void __iomem		*iobase;
>  	void __iomem		*ahb_base;
> +	resource_size_t		ahb_phy_addr;

What does this represent? trigger address to be programmed in
CQSPI_REG_INDIRECTTRIGGER reg? If so why not use cdns,trigger-address
property?

>  	resource_size_t		ahb_size;
>  	struct completion	transfer_complete;
>  	struct mutex		bus_mutex;
> @@ -134,6 +135,8 @@ struct cqspi_driver_platdata {
>  #define CQSPI_REG_RD_INSTR_TYPE_DATA_MASK	0x3
>  #define CQSPI_REG_RD_INSTR_DUMMY_MASK		0x1F
>  
> +#define CQSPI_REG_WR_COMPLETION_CTRL	0x38
> +#define CQSPI_REG_WR_COMPLETION_DISABLE_AUTO_POLL	BIT(14)
>  #define CQSPI_REG_WR_INSTR			0x08
>  #define CQSPI_REG_WR_INSTR_OPCODE_LSB		0
>  #define CQSPI_REG_WR_INSTR_TYPE_ADDR_LSB	12
> @@ -214,6 +217,7 @@ struct cqspi_driver_platdata {
>  #define CQSPI_REG_INDIRECTWRWATERMARK		0x74
>  #define CQSPI_REG_INDIRECTWRSTARTADDR		0x78
>  #define CQSPI_REG_INDIRECTWRBYTES		0x7C
> +#define CQSPI_REG_INDIRECTTRIGGERADDRRANGE	0x80
>  

Where is this used? Lets not add defines without a code snippet using it.

>  #define CQSPI_REG_CMDADDRESS			0x94
>  #define CQSPI_REG_CMDREADDATALOWER		0xA0
> @@ -470,6 +474,18 @@ static int cqspi_command_write_addr(struct spi_nor *nor,
>  	return cqspi_exec_flash_cmd(cqspi, reg);
>  }
>  
> +static int cqspi_disable_auto_poll(struct cqspi_st *cqspi)
> +{
> +	void __iomem *reg_base = cqspi->iobase;
> +	unsigned int reg;
> +
> +	reg = readl(reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
> +	reg |= CQSPI_REG_WR_COMPLETION_DISABLE_AUTO_POLL;
> +	writel(reg, reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
> +
> +	return 0;
> +}
> +
>  static int cqspi_read_setup(struct spi_nor *nor)
>  {
>  	struct cqspi_flash_pdata *f_pdata = nor->priv;
> @@ -507,6 +523,11 @@ static int cqspi_read_setup(struct spi_nor *nor)
>  	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
>  	reg |= (nor->addr_width - 1);
>  	writel(reg, reg_base + CQSPI_REG_SIZE);
> +
> +	/* Disable auto-polling */
> +	if (!f_pdata->use_direct_mode)
> +		cqspi_disable_auto_poll(cqspi);
> +

This is a one time setup. So move this to cqspi_controller_init(). More
comments at the end of the patch

>  	return 0;
>  }
>  
> @@ -517,12 +538,16 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor, u8 *rxbuf,
>  	struct cqspi_st *cqspi = f_pdata->cqspi;
>  	void __iomem *reg_base = cqspi->iobase;
>  	void __iomem *ahb_base = cqspi->ahb_base;
> +	resource_size_t ahb_phy_addr = cqspi->ahb_phy_addr;
>  	unsigned int remaining = n_rx;
>  	unsigned int mod_bytes = n_rx % 4;
>  	unsigned int bytes_to_read = 0;
>  	u8 *rxbuf_end = rxbuf + n_rx;
>  	int ret = 0;
>  
> +	if (!f_pdata->use_direct_mode)
> +		writel(ahb_phy_addr, reg_base + CQSPI_REG_INDIRECTTRIGGER);
> +

Drop this and use cdns,trigger-address DT property which takes care of
programming CQSPI_REG_INDIRECTTRIGGER in cqspi_controller_init()

>  	writel(from_addr, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
>  	writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
>  
> @@ -609,6 +634,14 @@ static int cqspi_write_setup(struct spi_nor *nor)
>  	struct cqspi_st *cqspi = f_pdata->cqspi;
>  	void __iomem *reg_base = cqspi->iobase;
>  
> +	/* Disable the DMA and direct access controller */
> +	if (!f_pdata->use_direct_mode) {
> +		reg = readl(reg_base + CQSPI_REG_CONFIG);
> +		reg &= ~CQSPI_REG_CONFIG_ENB_DIR_ACC_CTRL;
> +		reg &= ~CQSPI_REG_CONFIG_DMA_MASK;

DMA is disabled by default right? No need to clear it explicitly.

> +		writel(reg, reg_base + CQSPI_REG_CONFIG);
> +	}
> +

And Move this hunk to cqspi_controller_init()

>  	/* Set opcode. */
>  	reg = nor->program_opcode << CQSPI_REG_WR_INSTR_OPCODE_LSB;
>  	writel(reg, reg_base + CQSPI_REG_WR_INSTR);
> @@ -619,6 +652,11 @@ static int cqspi_write_setup(struct spi_nor *nor)
>  	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
>  	reg |= (nor->addr_width - 1);
>  	writel(reg, reg_base + CQSPI_REG_SIZE);
> +
> +	/* Disable auto-polling */
> +	if (!f_pdata->use_direct_mode)
> +		cqspi_disable_auto_poll(cqspi);
> +
>  	return 0;
>  }
>  
> @@ -1165,13 +1203,16 @@ static int cqspi_of_get_pdata(struct platform_device *pdev)
>  		return -ENXIO;
>  	}
>  
> -	if (of_property_read_u32(np, "cdns,trigger-address",
> -				 &cqspi->trigger_address)) {
> -		dev_err(&pdev->dev, "couldn't determine trigger-address\n");
> -		return -ENXIO;
> -	}
> +	if (!of_device_is_compatible(np, "intel,lgm-qspi")) {
> +		if (of_property_read_u32(np, "cdns,trigger-address",
> +					 &cqspi->trigger_address)) {
> +			dev_err(&pdev->dev,
> +				"couldn't determine trigger-address\n");
> +			return -ENXIO;
> +		}
>  

Why? Can you populate cdns,trigger-address with same address as
res_ahb->start? That should eliminate need for cqspi->ahb_phy_addr

> -	cqspi->rclk_en = of_property_read_bool(np, "cdns,rclk-en");
> +		cqspi->rclk_en = of_property_read_bool(np, "cdns,rclk-en");
> +	}
>  
>  	return 0;
>  }
> @@ -1301,7 +1342,8 @@ static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  		f_pdata->registered = true;
>  
>  		if (mtd->size <= cqspi->ahb_size) {
> -			f_pdata->use_direct_mode = true;
> +			f_pdata->use_direct_mode =
> +				!(of_device_is_compatible(np, "intel,lgm-qspi"));

Instead, introduce a new quirk (similar to CQSPI_NEEDS_WR_DELAY) and
then use the flag to determine when to set use_direct_mode flag. Flag
can also be used to disable DAC mode in cqspi_controller_init().

And also use cqspi_driver_platdata to populate quirks for the  compatible

>  			dev_dbg(nor->dev, "using direct mode for %s\n",
>  				mtd->name);
>  
> @@ -1347,7 +1389,10 @@ static int cqspi_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Obtain QSPI clock. */
> -	cqspi->clk = devm_clk_get(dev, NULL);
> +	if (of_device_is_compatible(np, "intel,lgm-qspi"))
> +		cqspi->clk = devm_clk_get(dev, "qspi");
> +	else
> +		cqspi->clk = devm_clk_get(dev, NULL);

Does IP have more than 1 clock input? If yes, please document all input
clk names in Documentation/devicetree/bindings/mtd/cadence-quadspi.txt.

Also,  can be simplified to:

	cqspi->clk = devm_clk_get(dev, "qspi");
	if (IS_ERR(cqspi->clk))
		/* Try w/o clk id */
		cqspi->clk = devm_clk_get(dev, NULL);

If there is only one clk input in DT, then just drop above code.

>  	if (IS_ERR(cqspi->clk)) {
>  		dev_err(dev, "Cannot claim QSPI clock.\n");
>  		return PTR_ERR(cqspi->clk);
> @@ -1369,6 +1414,7 @@ static int cqspi_probe(struct platform_device *pdev)
>  		return PTR_ERR(cqspi->ahb_base);
>  	}
>  	cqspi->mmap_phys_base = (dma_addr_t)res_ahb->start;
> +	cqspi->ahb_phy_addr = res_ahb->start;
>  	cqspi->ahb_size = resource_size(res_ahb);
>  
>  	init_completion(&cqspi->transfer_complete);
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
