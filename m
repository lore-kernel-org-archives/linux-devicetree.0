From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/4] clk: meson: meson8b: use a sparate clock table for
 Meson8m2
Date: Wed, 20 Mar 2019 09:15:00 +0100
Message-ID: <1d52f584-1a5d-8b0d-ecd0-8c041f2b9c18@baylibre.com>
References: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
 <20190319215121.29340-3-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190319215121.29340-3-martin.blumenstingl@googlemail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

There is a typo in the subject "s/sparate/separate/" !

On 19/03/2019 22:51, Martin Blumenstingl wrote:
> Meson8, Meson8b and Meson8m2 implement a similar clock controller.
> However, there are a few differences between the three actual IP blocks.
> 
> One example where Meson8m2 differs from Meson8b is the VPU clock setup:
> - the VPU input mux can choose between "fclk_div4", "fclk_div3",
>   "fclk_div5" and "fclk_div7" on Meson8b
> - however, on Meson8m2 it can choose between "fclk_div4", "fclk_div3",
>   "fclk_div5" and "gp_pll" (GP_PLL only exists on Meson8m2, it's the
>   predecessor of the GP0_PLL clock on GXBB/GXL/GXM))

By curiosity, what is the default (maximum) setup ? On GX & G12A, fclk_div3 is the default/max setup.

> 
> Add a separate clk_hw_onecell_data table for Meson8m2 so these
> differences can be implemented in our clock controller driver. For now
> meson8m2_hw_onecell_data is a clone of our existing
> meson8b_hw_onecell_data.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 193 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 192 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 576ad42252d0..c9e6ec67d649 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -2157,6 +2157,192 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
>  	.num = CLK_NR_CLKS,
>  };
>  
> +static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
> +	.hws = {
> +		[CLKID_XTAL] = &meson8b_xtal.hw,
> +		[CLKID_PLL_FIXED] = &meson8b_fixed_pll.hw,
> +		[CLKID_PLL_VID] = &meson8b_vid_pll.hw,
> +		[CLKID_PLL_SYS] = &meson8b_sys_pll.hw,
> +		[CLKID_FCLK_DIV2] = &meson8b_fclk_div2.hw,
> +		[CLKID_FCLK_DIV3] = &meson8b_fclk_div3.hw,
> +		[CLKID_FCLK_DIV4] = &meson8b_fclk_div4.hw,
> +		[CLKID_FCLK_DIV5] = &meson8b_fclk_div5.hw,
> +		[CLKID_FCLK_DIV7] = &meson8b_fclk_div7.hw,
> +		[CLKID_CPUCLK] = &meson8b_cpu_clk.hw,
> +		[CLKID_MPEG_SEL] = &meson8b_mpeg_clk_sel.hw,
> +		[CLKID_MPEG_DIV] = &meson8b_mpeg_clk_div.hw,
> +		[CLKID_CLK81] = &meson8b_clk81.hw,
> +		[CLKID_DDR]		    = &meson8b_ddr.hw,
> +		[CLKID_DOS]		    = &meson8b_dos.hw,
> +		[CLKID_ISA]		    = &meson8b_isa.hw,
> +		[CLKID_PL301]		    = &meson8b_pl301.hw,
> +		[CLKID_PERIPHS]		    = &meson8b_periphs.hw,
> +		[CLKID_SPICC]		    = &meson8b_spicc.hw,
> +		[CLKID_I2C]		    = &meson8b_i2c.hw,
> +		[CLKID_SAR_ADC]		    = &meson8b_sar_adc.hw,
> +		[CLKID_SMART_CARD]	    = &meson8b_smart_card.hw,
> +		[CLKID_RNG0]		    = &meson8b_rng0.hw,
> +		[CLKID_UART0]		    = &meson8b_uart0.hw,
> +		[CLKID_SDHC]		    = &meson8b_sdhc.hw,
> +		[CLKID_STREAM]		    = &meson8b_stream.hw,
> +		[CLKID_ASYNC_FIFO]	    = &meson8b_async_fifo.hw,
> +		[CLKID_SDIO]		    = &meson8b_sdio.hw,
> +		[CLKID_ABUF]		    = &meson8b_abuf.hw,
> +		[CLKID_HIU_IFACE]	    = &meson8b_hiu_iface.hw,
> +		[CLKID_ASSIST_MISC]	    = &meson8b_assist_misc.hw,
> +		[CLKID_SPI]		    = &meson8b_spi.hw,
> +		[CLKID_I2S_SPDIF]	    = &meson8b_i2s_spdif.hw,
> +		[CLKID_ETH]		    = &meson8b_eth.hw,
> +		[CLKID_DEMUX]		    = &meson8b_demux.hw,
> +		[CLKID_AIU_GLUE]	    = &meson8b_aiu_glue.hw,
> +		[CLKID_IEC958]		    = &meson8b_iec958.hw,
> +		[CLKID_I2S_OUT]		    = &meson8b_i2s_out.hw,
> +		[CLKID_AMCLK]		    = &meson8b_amclk.hw,
> +		[CLKID_AIFIFO2]		    = &meson8b_aififo2.hw,
> +		[CLKID_MIXER]		    = &meson8b_mixer.hw,
> +		[CLKID_MIXER_IFACE]	    = &meson8b_mixer_iface.hw,
> +		[CLKID_ADC]		    = &meson8b_adc.hw,
> +		[CLKID_BLKMV]		    = &meson8b_blkmv.hw,
> +		[CLKID_AIU]		    = &meson8b_aiu.hw,
> +		[CLKID_UART1]		    = &meson8b_uart1.hw,
> +		[CLKID_G2D]		    = &meson8b_g2d.hw,
> +		[CLKID_USB0]		    = &meson8b_usb0.hw,
> +		[CLKID_USB1]		    = &meson8b_usb1.hw,
> +		[CLKID_RESET]		    = &meson8b_reset.hw,
> +		[CLKID_NAND]		    = &meson8b_nand.hw,
> +		[CLKID_DOS_PARSER]	    = &meson8b_dos_parser.hw,
> +		[CLKID_USB]		    = &meson8b_usb.hw,
> +		[CLKID_VDIN1]		    = &meson8b_vdin1.hw,
> +		[CLKID_AHB_ARB0]	    = &meson8b_ahb_arb0.hw,
> +		[CLKID_EFUSE]		    = &meson8b_efuse.hw,
> +		[CLKID_BOOT_ROM]	    = &meson8b_boot_rom.hw,
> +		[CLKID_AHB_DATA_BUS]	    = &meson8b_ahb_data_bus.hw,
> +		[CLKID_AHB_CTRL_BUS]	    = &meson8b_ahb_ctrl_bus.hw,
> +		[CLKID_HDMI_INTR_SYNC]	    = &meson8b_hdmi_intr_sync.hw,
> +		[CLKID_HDMI_PCLK]	    = &meson8b_hdmi_pclk.hw,
> +		[CLKID_USB1_DDR_BRIDGE]	    = &meson8b_usb1_ddr_bridge.hw,
> +		[CLKID_USB0_DDR_BRIDGE]	    = &meson8b_usb0_ddr_bridge.hw,
> +		[CLKID_MMC_PCLK]	    = &meson8b_mmc_pclk.hw,
> +		[CLKID_DVIN]		    = &meson8b_dvin.hw,
> +		[CLKID_UART2]		    = &meson8b_uart2.hw,
> +		[CLKID_SANA]		    = &meson8b_sana.hw,
> +		[CLKID_VPU_INTR]	    = &meson8b_vpu_intr.hw,
> +		[CLKID_SEC_AHB_AHB3_BRIDGE] = &meson8b_sec_ahb_ahb3_bridge.hw,
> +		[CLKID_CLK81_A9]	    = &meson8b_clk81_a9.hw,
> +		[CLKID_VCLK2_VENCI0]	    = &meson8b_vclk2_venci0.hw,
> +		[CLKID_VCLK2_VENCI1]	    = &meson8b_vclk2_venci1.hw,
> +		[CLKID_VCLK2_VENCP0]	    = &meson8b_vclk2_vencp0.hw,
> +		[CLKID_VCLK2_VENCP1]	    = &meson8b_vclk2_vencp1.hw,
> +		[CLKID_GCLK_VENCI_INT]	    = &meson8b_gclk_venci_int.hw,
> +		[CLKID_GCLK_VENCP_INT]	    = &meson8b_gclk_vencp_int.hw,
> +		[CLKID_DAC_CLK]		    = &meson8b_dac_clk.hw,
> +		[CLKID_AOCLK_GATE]	    = &meson8b_aoclk_gate.hw,
> +		[CLKID_IEC958_GATE]	    = &meson8b_iec958_gate.hw,
> +		[CLKID_ENC480P]		    = &meson8b_enc480p.hw,
> +		[CLKID_RNG1]		    = &meson8b_rng1.hw,
> +		[CLKID_GCLK_VENCL_INT]	    = &meson8b_gclk_vencl_int.hw,
> +		[CLKID_VCLK2_VENCLMCC]	    = &meson8b_vclk2_venclmcc.hw,
> +		[CLKID_VCLK2_VENCL]	    = &meson8b_vclk2_vencl.hw,
> +		[CLKID_VCLK2_OTHER]	    = &meson8b_vclk2_other.hw,
> +		[CLKID_EDP]		    = &meson8b_edp.hw,
> +		[CLKID_AO_MEDIA_CPU]	    = &meson8b_ao_media_cpu.hw,
> +		[CLKID_AO_AHB_SRAM]	    = &meson8b_ao_ahb_sram.hw,
> +		[CLKID_AO_AHB_BUS]	    = &meson8b_ao_ahb_bus.hw,
> +		[CLKID_AO_IFACE]	    = &meson8b_ao_iface.hw,
> +		[CLKID_MPLL0]		    = &meson8b_mpll0.hw,
> +		[CLKID_MPLL1]		    = &meson8b_mpll1.hw,
> +		[CLKID_MPLL2]		    = &meson8b_mpll2.hw,
> +		[CLKID_MPLL0_DIV]	    = &meson8b_mpll0_div.hw,
> +		[CLKID_MPLL1_DIV]	    = &meson8b_mpll1_div.hw,
> +		[CLKID_MPLL2_DIV]	    = &meson8b_mpll2_div.hw,
> +		[CLKID_CPU_IN_SEL]	    = &meson8b_cpu_in_sel.hw,
> +		[CLKID_CPU_IN_DIV2]	    = &meson8b_cpu_in_div2.hw,
> +		[CLKID_CPU_IN_DIV3]	    = &meson8b_cpu_in_div3.hw,
> +		[CLKID_CPU_SCALE_DIV]	    = &meson8b_cpu_scale_div.hw,
> +		[CLKID_CPU_SCALE_OUT_SEL]   = &meson8b_cpu_scale_out_sel.hw,
> +		[CLKID_MPLL_PREDIV]	    = &meson8b_mpll_prediv.hw,
> +		[CLKID_FCLK_DIV2_DIV]	    = &meson8b_fclk_div2_div.hw,
> +		[CLKID_FCLK_DIV3_DIV]	    = &meson8b_fclk_div3_div.hw,
> +		[CLKID_FCLK_DIV4_DIV]	    = &meson8b_fclk_div4_div.hw,
> +		[CLKID_FCLK_DIV5_DIV]	    = &meson8b_fclk_div5_div.hw,
> +		[CLKID_FCLK_DIV7_DIV]	    = &meson8b_fclk_div7_div.hw,
> +		[CLKID_NAND_SEL]	    = &meson8b_nand_clk_sel.hw,
> +		[CLKID_NAND_DIV]	    = &meson8b_nand_clk_div.hw,
> +		[CLKID_NAND_CLK]	    = &meson8b_nand_clk_gate.hw,
> +		[CLKID_PLL_FIXED_DCO]	    = &meson8b_fixed_pll_dco.hw,
> +		[CLKID_HDMI_PLL_DCO]	    = &meson8b_hdmi_pll_dco.hw,
> +		[CLKID_PLL_SYS_DCO]	    = &meson8b_sys_pll_dco.hw,
> +		[CLKID_CPU_CLK_DIV2]	    = &meson8b_cpu_clk_div2.hw,
> +		[CLKID_CPU_CLK_DIV3]	    = &meson8b_cpu_clk_div3.hw,
> +		[CLKID_CPU_CLK_DIV4]	    = &meson8b_cpu_clk_div4.hw,
> +		[CLKID_CPU_CLK_DIV5]	    = &meson8b_cpu_clk_div5.hw,
> +		[CLKID_CPU_CLK_DIV6]	    = &meson8b_cpu_clk_div6.hw,
> +		[CLKID_CPU_CLK_DIV7]	    = &meson8b_cpu_clk_div7.hw,
> +		[CLKID_CPU_CLK_DIV8]	    = &meson8b_cpu_clk_div8.hw,
> +		[CLKID_APB_SEL]		    = &meson8b_apb_clk_sel.hw,
> +		[CLKID_APB]		    = &meson8b_apb_clk_gate.hw,
> +		[CLKID_PERIPH_SEL]	    = &meson8b_periph_clk_sel.hw,
> +		[CLKID_PERIPH]		    = &meson8b_periph_clk_gate.hw,
> +		[CLKID_AXI_SEL]		    = &meson8b_axi_clk_sel.hw,
> +		[CLKID_AXI]		    = &meson8b_axi_clk_gate.hw,
> +		[CLKID_L2_DRAM_SEL]	    = &meson8b_l2_dram_clk_sel.hw,
> +		[CLKID_L2_DRAM]		    = &meson8b_l2_dram_clk_gate.hw,
> +		[CLKID_HDMI_PLL_LVDS_OUT]   = &meson8b_hdmi_pll_lvds_out.hw,
> +		[CLKID_HDMI_PLL_HDMI_OUT]   = &meson8b_hdmi_pll_hdmi_out.hw,
> +		[CLKID_VID_PLL_IN_SEL]	    = &meson8b_vid_pll_in_sel.hw,
> +		[CLKID_VID_PLL_IN_EN]	    = &meson8b_vid_pll_in_en.hw,
> +		[CLKID_VID_PLL_PRE_DIV]	    = &meson8b_vid_pll_pre_div.hw,
> +		[CLKID_VID_PLL_POST_DIV]    = &meson8b_vid_pll_post_div.hw,
> +		[CLKID_VID_PLL_FINAL_DIV]   = &meson8b_vid_pll_final_div.hw,
> +		[CLKID_VCLK_IN_SEL]	    = &meson8b_vclk_in_sel.hw,
> +		[CLKID_VCLK_IN_EN]	    = &meson8b_vclk_in_en.hw,
> +		[CLKID_VCLK_DIV1]	    = &meson8b_vclk_div1_gate.hw,
> +		[CLKID_VCLK_DIV2_DIV]	    = &meson8b_vclk_div2_div.hw,
> +		[CLKID_VCLK_DIV2]	    = &meson8b_vclk_div2_div_gate.hw,
> +		[CLKID_VCLK_DIV4_DIV]	    = &meson8b_vclk_div4_div.hw,
> +		[CLKID_VCLK_DIV4]	    = &meson8b_vclk_div4_div_gate.hw,
> +		[CLKID_VCLK_DIV6_DIV]	    = &meson8b_vclk_div6_div.hw,
> +		[CLKID_VCLK_DIV6]	    = &meson8b_vclk_div6_div_gate.hw,
> +		[CLKID_VCLK_DIV12_DIV]	    = &meson8b_vclk_div12_div.hw,
> +		[CLKID_VCLK_DIV12]	    = &meson8b_vclk_div12_div_gate.hw,
> +		[CLKID_VCLK2_IN_SEL]	    = &meson8b_vclk2_in_sel.hw,
> +		[CLKID_VCLK2_IN_EN]	    = &meson8b_vclk2_clk_in_en.hw,
> +		[CLKID_VCLK2_DIV1]	    = &meson8b_vclk2_div1_gate.hw,
> +		[CLKID_VCLK2_DIV2_DIV]	    = &meson8b_vclk2_div2_div.hw,
> +		[CLKID_VCLK2_DIV2]	    = &meson8b_vclk2_div2_div_gate.hw,
> +		[CLKID_VCLK2_DIV4_DIV]	    = &meson8b_vclk2_div4_div.hw,
> +		[CLKID_VCLK2_DIV4]	    = &meson8b_vclk2_div4_div_gate.hw,
> +		[CLKID_VCLK2_DIV6_DIV]	    = &meson8b_vclk2_div6_div.hw,
> +		[CLKID_VCLK2_DIV6]	    = &meson8b_vclk2_div6_div_gate.hw,
> +		[CLKID_VCLK2_DIV12_DIV]	    = &meson8b_vclk2_div12_div.hw,
> +		[CLKID_VCLK2_DIV12]	    = &meson8b_vclk2_div12_div_gate.hw,
> +		[CLKID_CTS_ENCT_SEL]	    = &meson8b_cts_enct_sel.hw,
> +		[CLKID_CTS_ENCT]	    = &meson8b_cts_enct.hw,
> +		[CLKID_CTS_ENCP_SEL]	    = &meson8b_cts_encp_sel.hw,
> +		[CLKID_CTS_ENCP]	    = &meson8b_cts_encp.hw,
> +		[CLKID_CTS_ENCI_SEL]	    = &meson8b_cts_enci_sel.hw,
> +		[CLKID_CTS_ENCI]	    = &meson8b_cts_enci.hw,
> +		[CLKID_HDMI_TX_PIXEL_SEL]   = &meson8b_hdmi_tx_pixel_sel.hw,
> +		[CLKID_HDMI_TX_PIXEL]	    = &meson8b_hdmi_tx_pixel.hw,
> +		[CLKID_CTS_ENCL_SEL]	    = &meson8b_cts_encl_sel.hw,
> +		[CLKID_CTS_ENCL]	    = &meson8b_cts_encl.hw,
> +		[CLKID_CTS_VDAC0_SEL]	    = &meson8b_cts_vdac0_sel.hw,
> +		[CLKID_CTS_VDAC0]	    = &meson8b_cts_vdac0.hw,
> +		[CLKID_HDMI_SYS_SEL]	    = &meson8b_hdmi_sys_sel.hw,
> +		[CLKID_HDMI_SYS_DIV]	    = &meson8b_hdmi_sys_div.hw,
> +		[CLKID_HDMI_SYS]	    = &meson8b_hdmi_sys.hw,
> +		[CLKID_MALI_0_SEL]	    = &meson8b_mali_0_sel.hw,
> +		[CLKID_MALI_0_DIV]	    = &meson8b_mali_0_div.hw,
> +		[CLKID_MALI_0]		    = &meson8b_mali_0.hw,
> +		[CLKID_MALI_1_SEL]	    = &meson8b_mali_1_sel.hw,
> +		[CLKID_MALI_1_DIV]	    = &meson8b_mali_1_div.hw,
> +		[CLKID_MALI_1]		    = &meson8b_mali_1.hw,
> +		[CLKID_MALI]		    = &meson8b_mali.hw,
> +		[CLK_NR_CLKS]		    = NULL,
> +	},
> +	.num = CLK_NR_CLKS,
> +};
> +
>  static struct clk_regmap *const meson8b_clk_regmaps[] = {
>  	&meson8b_clk81,
>  	&meson8b_ddr,
> @@ -2558,9 +2744,14 @@ static void __init meson8b_clkc_init(struct device_node *np)
>  	return meson8b_clkc_init_common(np, &meson8b_hw_onecell_data);
>  }
>  
> +static void __init meson8m2_clkc_init(struct device_node *np)
> +{
> +	return meson8b_clkc_init_common(np, &meson8m2_hw_onecell_data);
> +}
> +
>  CLK_OF_DECLARE_DRIVER(meson8_clkc, "amlogic,meson8-clkc",
>  		      meson8_clkc_init);
>  CLK_OF_DECLARE_DRIVER(meson8b_clkc, "amlogic,meson8b-clkc",
>  		      meson8b_clkc_init);
>  CLK_OF_DECLARE_DRIVER(meson8m2_clkc, "amlogic,meson8m2-clkc",
> -		      meson8b_clkc_init);
> +		      meson8m2_clkc_init);
> 

Apart the typo in the subject,
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
