From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: meson: add g12a bindings
Date: Mon, 28 Jan 2019 15:16:26 +0100
Message-ID: <c5bdc421-1afa-f0d3-65d6-2d062f06267e@baylibre.com>
References: <20190128141330.21927-1-jbrunet@baylibre.com>
 <20190128141330.21927-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190128141330.21927-2-jbrunet@baylibre.com>
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
To: Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 28/01/2019 15:13, Jerome Brunet wrote:
> Add device tree bindings for the reset controller of g12a SoC family.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/reset/amlogic,meson-reset.txt    |   7 +-
>  .../reset/amlogic,meson-g12a-reset.h          | 134 ++++++++++++++++++
>  2 files changed, 139 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
> index 28ef6c295c76..053cb1322ee3 100644
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
> @@ -5,8 +5,11 @@ Please also refer to reset.txt in this directory for common reset
>  controller binding usage.
>  
>  Required properties:
> -- compatible: Should be "amlogic,meson8b-reset", "amlogic,meson-gxbb-reset" or
> -	"amlogic,meson-axg-reset".
> +- compatible: Should be
> + * "amlogic,meson8b-reset" or
> + * "amlogic,meson-gxbb-reset" or
> + * "amlogic,meson-axg-reset" or
> + * "amlogic,meson-g12a-reset"
>  - reg: should contain the register address base
>  - #reset-cells: 1, see below
>  
> diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> new file mode 100644
> index 000000000000..8063e8314eef
> --- /dev/null
> +++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> @@ -0,0 +1,134 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
> +/*
> + * Copyright (c) 2019 BayLibre, SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_G12A_RESET_H
> +#define _DT_BINDINGS_AMLOGIC_MESON_G12A_RESET_H
> +
> +/*	RESET0					*/
> +#define RESET_HIU			0
> +/*					1	*/
> +#define RESET_DOS			2
> +/*					3-4	*/
> +#define RESET_VIU			5
> +#define RESET_AFIFO			6
> +#define RESET_VID_PLL_DIV		7
> +/*					8-9	*/
> +#define RESET_VENC			10
> +#define RESET_ASSIST			11
> +#define RESET_PCIE_CTRL_A		12
> +#define RESET_VCBUS			13
> +#define RESET_PCIE_PHY			14
> +#define RESET_PCIE_APB			15
> +#define RESET_GIC			16
> +#define RESET_CAPB3_DECODE		17
> +/*					18	*/
> +#define RESET_HDMITX_CAPB3		19
> +#define RESET_DVALIN_CAPB3		20
> +#define RESET_DOS_CAPB3			21
> +/*					22	*/
> +#define RESET_CBUS_CAPB3		23
> +#define RESET_AHB_CNTL			24
> +#define RESET_AHB_DATA			25
> +#define RESET_VCBUS_CLK81		26
> +/*					27-31	*/
> +/*	RESET1					*/
> +/*					32	*/
> +#define RESET_DEMUX			33
> +#define RESET_USB			34
> +#define RESET_DDR			35
> +/*					36	*/
> +#define RESET_BT656			37
> +#define RESET_AHB_SRAM			38
> +/*					39	*/
> +#define RESET_PARSER			40
> +/*					41	*/
> +#define RESET_ISA			42
> +#define RESET_ETHERNET			43
> +#define RESET_SD_EMMC_A			44
> +#define RESET_SD_EMMC_B			45
> +#define RESET_SD_EMMC_C			46
> +/*					47-60 */
> +#define RESET_AUDIO_CODEC		61
> +/*					62-63	*/
> +/*	RESET2					*/
> +/*					64	*/
> +#define RESET_AUDIO			65
> +#define RESET_HDMITX_PHY		66
> +/*					67	*/
> +#define RESET_MIPI_DSI_HOST		68
> +#define RESET_ALOCKER			69
> +#define RESET_GE2D			70
> +#define RESET_PARSER_REG		71
> +#define RESET_PARSER_FETCH		72
> +#define RESET_CTL			73
> +#define RESET_PARSER_TOP		74
> +/*					75-77	*/
> +#define RESET_DVALIN			78
> +#define RESET_HDMITX			79
> +/*					80-95	*/
> +/*	RESET3					*/
> +/*					96-95	*/
> +#define RESET_DEMUX_TOP			105
> +#define RESET_DEMUX_DES_PL		106
> +#define RESET_DEMUX_S2P_0		107
> +#define RESET_DEMUX_S2P_1		108
> +#define RESET_DEMUX_0			109
> +#define RESET_DEMUX_1			110
> +#define RESET_DEMUX_2			111
> +/*					112-127	*/
> +/*	RESET4					*/
> +/*					128-129	*/
> +#define RESET_MIPI_DSI_PHY		130
> +/*					131-132	*/
> +#define RESET_RDMA			133
> +#define RESET_VENCI			134
> +#define RESET_VENCP			135
> +/*					136	*/
> +#define RESET_VDAC			137
> +/*					138-139 */
> +#define RESET_VDI6			140
> +#define RESET_VENCL			141
> +#define RESET_I2C_M1			142
> +#define RESET_I2C_M2			143
> +/*					144-159	*/
> +/*	RESET5					*/
> +/*					160-191	*/
> +/*	RESET6					*/
> +#define RESET_GEN			192
> +#define RESET_SPICC0			193
> +#define RESET_SC			194
> +#define RESET_SANA_3			195
> +#define RESET_I2C_M0			196
> +#define RESET_TS_PLL			197
> +#define RESET_SPICC1			198
> +#define RESET_STREAM			199
> +#define RESET_TS_CPU			200
> +#define RESET_UART0			201
> +#define RESET_UART1_2			202
> +#define RESET_ASYNC0			203
> +#define RESET_ASYNC1			204
> +#define RESET_SPIFC0			205
> +#define RESET_I2C_M3			206
> +/*					207-223	*/
> +/*	RESET7					*/
> +#define RESET_USB_DDR_0			224
> +#define RESET_USB_DDR_1			225
> +#define RESET_USB_DDR_2			226
> +#define RESET_USB_DDR_3			227
> +#define RESET_TS_GPU			228
> +#define RESET_DEVICE_MMC_ARB		229
> +#define RESET_DVALIN_DMC_PIPL		230
> +#define RESET_VID_LOCK			231
> +#define RESET_NIC_DMC_PIPL		232
> +#define RESET_DMC_VPU_PIPL		233
> +#define RESET_GE2D_DMC_PIPL		234
> +#define RESET_HCODEC_DMC_PIPL		235
> +#define RESET_WAVE420_DMC_PIPL		236
> +#define RESET_HEVCF_DMC_PIPL		237
> +/*					238-255	*/
> +
> +#endif
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
