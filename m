From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v10] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Wed, 27 Apr 2016 09:38:50 -0600
Message-ID: <20160427153850.GE25981@localhost>
References: <1461050839-24644-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461050839-24644-1-git-send-email-xuejiancheng@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com, jteki@openedev.com, ezequiel@vanguardiasur.com.ar, juhosg@openwrt.org, furquan@google.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com, hermit.wangheming@hisilicon.com, jiangheng@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Jiancheng,

Cyrille hit on one of my concerns; if posible we'd like not to have you
sniffing the opcodes in read_reg()/write_reg(). But let's keep the
discussion on that thread.

Two other comments below.

On Tue, Apr 19, 2016 at 03:27:19PM +0800, Jiancheng Xue wrote:
> From: Jiancheng Xue <xuejiancheng@huawei.com>
> 
> Add hisilicon spi-nor flash controller driver
> 
> Signed-off-by: Binquan Peng <pengbinquan@hisilicon.com>
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
> change log
> v10:
> Fixed issues pointed by Marek Vasut.
> 1)Droped the underscores in the argument names of some macros' definition.
> 2)Changed some varibles to correct type.
> 3)Rewrote hisi_spi_nor_read/write for readability.
> 4)Added new functions hisi_spi_nor_register/unregister_all
> 5)Changed to dynamically allocation for spi_nor embeded in hifmc_host.
> Fixed issues pointed by Brian Norris.
> 1)Replaced some headers with more accurate ones.
> v9:
> Fixed issues pointed by Jagan Teki.
> v8:
> Fixed issues pointed by Ezequiel Garcia and Brian Norris.
> Moved dts binding file to mtd directory.
> Changed the compatible string more specific.
> v7:
> Rebased to v4.5-rc3.
> Fixed issues pointed by Ezequiel Garcia.
> v6:
> Based on v4.5-rc2
> Fixed issues pointed by Ezequiel Garcia.
> v5:
> Fixed a compile error.
> v4:
> Rebased to v4.5-rc1
> v3:
> Added a compatible string "hisilicon,hi3519-sfc".
> v2:
> Fixed some compiling warings.
> 
>  .../bindings/mtd/hisilicon,fmc-spi-nor.txt         |  24 +
>  drivers/mtd/spi-nor/Kconfig                        |   7 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/hisi-sfc.c                     | 539 +++++++++++++++++++++
>  4 files changed, 571 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
>  create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c
> 
> diff --git a/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt b/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
> new file mode 100644
> index 0000000..7498152
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt
> @@ -0,0 +1,24 @@
> +HiSilicon SPI-NOR Flash Controller
> +
> +Required properties:
> +- compatible : Should be "hisilicon,fmc-spi-nor" and one of the following strings:
> +		"hisilicon,hi3519-spi-nor"
> +- address-cells : Should be 1.
> +- size-cells : Should be 0.
> +- reg : Offset and length of the register set for the controller device.
> +- reg-names : Must include the following two entries: "control", "memory".
> +- clocks : handle to spi-nor flash controller clock.
> +
> +Example:
> +spi-nor-controller@10000000 {
> +	compatible = "hisilicon,hi3519-spi-nor", "hisilicon,fmc-spi-nor";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x10000000 0x1000>, <0x14000000 0x1000000>;
> +	reg-names = "control", "memory";
> +	clocks = <&clock HI3519_FMC_CLK>;
> +	spi-nor@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +	};
> +};
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index d42c98e..b9ff675 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -38,6 +38,13 @@ config SPI_FSL_QUADSPI
>  	  This controller does not support generic SPI. It only supports
>  	  SPI NOR.
>  
> +config SPI_HISI_SFC
> +	tristate "Hisilicon SPI-NOR Flash Controller(SFC)"
> +	depends on ARCH_HISI || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	help
> +	  This enables support for hisilicon SPI-NOR flash controller.
> +
>  config SPI_NXP_SPIFI
>  	tristate "NXP SPI Flash Interface (SPIFI)"
>  	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 0bf3a7f8..8a6fa69 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
>  obj-$(CONFIG_SPI_FSL_QUADSPI)	+= fsl-quadspi.o
> +obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
>  obj-$(CONFIG_MTD_MT81xx_NOR)    += mtk-quadspi.o
>  obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
> new file mode 100644
> index 0000000..942dafd
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
> @@ -0,0 +1,539 @@

[...]

> +static void hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t start_off,
> +		dma_addr_t dma_buf, size_t len, u8 op_type)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	u8 if_type = 0, dummy = 0;
> +	u8 w_cmd = 0, r_cmd = 0;
> +	u32 reg;
> +
> +	writel(start_off, host->regbase + FMC_ADDRL);
> +
> +	if (op_type == FMC_OP_READ) {
> +		if_type = get_if_type(nor->flash_read);
> +		dummy = nor->read_dummy >> 3;
> +		r_cmd = nor->read_opcode;
> +	} else {
> +		w_cmd = nor->program_opcode;
> +	}
> +
> +	reg = OP_CFG_FM_CS(priv->chipselect)
> +		| OP_CFG_MEM_IF_TYPE(if_type)
> +		| OP_CFG_ADDR_NUM(nor->addr_width)
> +		| OP_CFG_DUMMY_NUM(dummy);
> +	writel(reg, host->regbase + FMC_OP_CFG);
> +
> +	reg = FMC_DMA_LEN_SET(len);
> +	writel(reg, host->regbase + FMC_DMA_LEN);
> +	writel(dma_buf, host->regbase + FMC_DMA_SADDR_D0);
> +
> +	reg = OP_CTRL_RD_OPCODE(r_cmd)
> +		| OP_CTRL_WR_OPCODE(w_cmd)
> +		| OP_CTRL_RW_OP(op_type)
> +		| OP_CTRL_DMA_OP_READY;
> +	writel(0xff, host->regbase + FMC_INT_CLR);
> +	writel(reg, host->regbase + FMC_OP_DMA);
> +	wait_op_finish(host);

Do you want to return the status here, so we can handle errors?

> +}
> +
> +static int hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
> +		size_t *retlen, u_char *read_buf)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +	int offset;
> +
> +	/* read all bytes in only one read */
> +	if (len <= HIFMC_DMA_MAX_LEN) {
> +		hisi_spi_nor_dma_transfer(nor, from, host->dma_buffer,
> +				len, FMC_OP_READ);
> +		memcpy(read_buf, host->buffer, len);

Why do you have a special case for "all in one read"? This is just a
basic loop...

> +	} else {
> +		/* read HIFMC_DMA_MAX_LEN bytes at a time */
> +		for (offset = 0; offset < len; offset += HIFMC_DMA_MAX_LEN) {
> +			hisi_spi_nor_dma_transfer(nor, from + offset,
> +				host->dma_buffer,
> +				HIFMC_DMA_MAX_LEN, FMC_OP_READ);
> +			memcpy(read_buf + offset,
> +				host->buffer, HIFMC_DMA_MAX_LEN);
> +		}
> +		/* read remaining bytes */
> +		offset -= HIFMC_DMA_MAX_LEN;
> +		hisi_spi_nor_dma_transfer(nor, from + offset, host->dma_buffer,
> +				len - offset, FMC_OP_READ);
> +		memcpy(read_buf + offset, host->buffer, len - offset);
> +	}

I think the entire if/else can be rewritten as:

	for (offset = 0; offset < len; offset += HIFMC_DMA_MAX_LEN) {
		size_t trans = min(HIFMC_DMA_MAX_LEN, len - offset);

		hisi_spi_nor_dma_transfer(nor, from + offset, host->dma_buffer,
					  trans, FMC_OP_READ);
		memcpy(read_buf + offset, host->buffer, trans);
	}

> +	*retlen = len;
> +
> +	return 0;
> +}
> +
> +static void hisi_spi_nor_write(struct spi_nor *nor, loff_t to,
> +			size_t len, size_t *retlen, const u_char *write_buf)
> +{
> +	struct hifmc_priv *priv = nor->priv;
> +	struct hifmc_host *host = priv->host;
> +
> +	/* len is smaller than HIFMC_DMA_MAX_LEN*/

Where do you get that assumption? This function must handle whatever
'len' is passed to it, and that may be large. (I suspect your error is
inspired by the fact that mtd-utils *usually* does smaller write
transfers.)

By the way, you might be helped by this series:

http://lists.infradead.org/pipermail/linux-mtd/2015-December/063865.html

It got dropped on the floor, but I'm rewriting it to resend soon.

> +	memcpy(host->buffer, write_buf, len);
> +	hisi_spi_nor_dma_transfer(nor, to, host->dma_buffer, len,
> +					FMC_OP_WRITE);
> +
> +	*retlen = len;
> +}

[...]

Brian
