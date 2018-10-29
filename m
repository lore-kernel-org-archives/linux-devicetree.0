From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
Date: Mon, 29 Oct 2018 10:22:13 +0100
Message-ID: <20181029102213.4ccfc336@xps13>
References: <1537199260-7280-1-git-send-email-christophe.kerello@st.com>
 <1537199260-7280-3-git-send-email-christophe.kerello@st.com>
 <20180922154819.015dcca7@xps13>
 <6df8455e-2fb2-e65c-a492-fba42a9453f3@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6df8455e-2fb2-e65c-a492-fba42a9453f3@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Kerello <christophe.kerello@st.com>
Cc: boris.brezillon@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Christophe,

Sorry for the delay, here are some answers from my previous comments.
Maybe you already addressed them, in this case please ignore them.

Also, please run and correct 'checkpatch.pl --strict' issues (mostly
uses of uint8_t instead of u8 but also a warning about the compatible).

Overall the driver is in a pretty good shape and should enter the next
release. I'll apply the patches after -rc1 once I'll have your v3+ with
everything corrected.

[...]

> >> index c7efc31..863662c 100644
> >> --- a/drivers/mtd/nand/raw/Kconfig
> >> +++ b/drivers/mtd/nand/raw/Kconfig
> >> @@ -541,4 +541,13 @@ config MTD_NAND_TEGRA
> >>   	  is supported. Extra OOB bytes when using HW ECC are currently
> >>   	  not supported.  
> >>   >> +config MTD_NAND_STM32_FMC2  
> >> +	tristate "Support for NAND controller on STM32MP SoCs"
> >> +	depends on MACH_STM32MP157 || COMPILE_TEST
> >> +	help
> >> +	  Enables support for NAND Flash chips on SoCs containing the FMC2
> >> +	  NAND controller. This controller is found on STM32MP SoCs.
> >> +	  The driver supports a maximum 8k page size. HW ECC is enabled and
> >> +	  supports a maximum 8-bit correction error per sector of 512 bytes.
> > > HW ECC should not be enabled by default. 8-bit/512B of correctability  
> > is good but not that high and people might want to use software ECC in
> > conjunction with raw accesses.  
> 
> Yes, I agree. The driver only supports NAND_ECC_HW mode. NAND_ECC_SOFT mode was not requested by customers and was not implemented. The driver could be improved later to support mode like NAND_ECC_SOFT or NAND_ECC_ON_DIE. Should I remove "HW ECC is enabled" from Kconfig description?

Yes, please.

[...]

> >> +/* Select function */
> >> +static void stm32_fmc2_select_chip(struct nand_chip *chip, int chipnr)
> >> +{
> >> +	struct stm32_fmc2 *fmc2 = nand_get_controller_data(chip);
> >> +	struct dma_slave_config dma_cfg;
> >> +
> >> +	if (chipnr < 0 || chipnr >= fmc2->ncs)
> >> +		return;
> >> +
> >> +	if (fmc2->cs_used[chipnr] == fmc2->cs_sel)
> >> +		return;
> >> +
> >> +	fmc2->cs_sel = fmc2->cs_used[chipnr];
> >> +
> >> +	if (fmc2->dma_tx_ch && fmc2->dma_rx_ch) {
> >> +		memset(&dma_cfg, 0, sizeof(dma_cfg));
> >> +		dma_cfg.src_addr = fmc2->data_phys_addr[fmc2->cs_sel];
> >> +		dma_cfg.dst_addr = fmc2->data_phys_addr[fmc2->cs_sel];
> >> +		dma_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> >> +		dma_cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> >> +		dma_cfg.src_maxburst = 32;
> >> +		dma_cfg.dst_maxburst = 32;
> >> +
> >> +		if (dmaengine_slave_config(fmc2->dma_tx_ch, &dma_cfg))
> >> +			dev_warn(fmc2->dev, "tx DMA engine slave config failed\n");
> >> +
> >> +		if (dmaengine_slave_config(fmc2->dma_rx_ch, &dma_cfg))
> >> +			dev_warn(fmc2->dev, "rx DMA engine slave config failed\n");
> >> +	}
> > > What if there are two NAND chips using different timing modes? You  
> > should probably reconfigure the timings registers, unless there are
> > already a set of timing registers per CS?  
> 
> Yes, it's true. In case of 2 NAND chips, timings and pcr registers should have been reconfigured. But, the driver only supports one NAND chip connected to 1 or 2 CS. There was no requirement on our side to support 2 different NAND chips. I do not have a board to test such configuration, so i do not want to deliver this support without being able to test it on my side. The driver will be improved later to support 2 different NAND chips, in case this configuration is requested by customers.

Sure, I'm not requesting you to support 2 NAND chips, I'm just
requesting to write this driver in a manner so that adding support for a
2nd NAND chip would be easy thanks to a better software design. That's
actually something that is done in the marvell_nand.c driver if you
need inspiration.


[...]

> >> +
> >> +void stm32_fmc2_read_data(struct nand_chip *chip, void *buf,
> >> +			  unsigned int len, bool force_8bit)
> >> +{
> >> +	struct stm32_fmc2 *fmc2 = nand_get_controller_data(chip);
> >> +	void __iomem *io_addr_r = fmc2->data_base[fmc2->cs_sel];
> >> +	u8 *p = buf;
> >> +	unsigned int i;
> >> +
> >> +	if (force_8bit)
> >> +		goto read_8bit;
> >> +
> >> +	if (IS_ALIGNED((u32)buf, sizeof(u32)) && IS_ALIGNED(len, sizeof(u32))) {
> > > If you selected BOUNCE_BUFFER in the options, buf is supposedly  
> > aligned, or am I missing something?  
> 
> 2 FMC2 internal modes can be used:
>   - Sequencer mode (Patch 2/3): dmas are used and NAND_USE_BOUNCE_BUFFER option is selected.
>   - Manual mode (Patch 3/3): no dma channel is used and NAND_USE_BOUNCE_BUFFER is not selected.
> Should i select NAND_USE_BOUNCE_BUFFER for sequencer and manual mode, and remove IS_ALIGNED test on buf?

If it's only useful in manual mode after patch 3/3, then the logic for
it should be in patch 3 also.

Anyway, unless numbers show a significant drop off in the throughput
(but I suppose the sequencer mode is faster anyway?) I think this is a
good idea to always use the bounce buffer and keep the code simple.

[...]

> >> +static int stm32_fmc2_parse_dt(struct device *dev,
> >> +			       struct stm32_fmc2 *fmc2)
> >> +{
> >> +	struct device_node *dn = dev->of_node;
> >> +	struct device_node *child;
> >> +	int nchips = of_get_child_count(dn);
> >> +	int ret = 0;
> >> +
> >> +	if (!nchips) {
> >> +		dev_err(dev, "NAND chip not defined\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	if (nchips > 1) {
> > > If you have two CS, can't you have two NAND chips connected?  
> >   
> No HW board has been designed with 2 NAND chips connected. I am not able to test this configuration. The driver will be improved when i will be able to test such configuration.
> 

Ok.


Thanks,
Miquèl
