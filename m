From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3] dt-bindings: reset: meson: add g12a bindings
Date: Thu, 7 Feb 2019 14:10:19 +0100
Message-ID: <6bdabea0-9870-66d1-a737-9695067ba8e6@baylibre.com>
References: <20190201125003.25022-1-jbrunet@baylibre.com>
 <1549535746.4557.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549535746.4557.3.camel@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On 07/02/2019 11:35, Philipp Zabel wrote:
> Hi Jerome,
> 
> is there any public documentation for the G12A reset controller?
> 
> On Fri, 2019-02-01 at 13:50 +0100, Jerome Brunet wrote:
>> Add device tree bindings for the reset controller of g12a SoC family.
>>
>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>
>> Changes since v2 [0]:
>> * Dropped useless g12a compatible
> 
> What if in the future somebody notices that a g12a specific workaround
> needs to be added to the driver? I agree that we don't have to list all
> compatibles in the driver, but unless you are certain that the reset
> controller is identical to the one from another SoC, it would be better
> to have a SoC specific compatible in the device tree, even if the driver
> only matches to a more generic compatible. For example:
> 
> 	compatible = "amlogic,meson-g12a-reset", "amlogic,meson8b-reset";
> 
> if the reset controller behaves identical to the one in meson8b.

The controller is the exact same as Meson8, GXBB, and AXG.

We had doubts since the previous datasheets were not clear, but for G12A we
are sure it's 100% same to at least GXBB and AXG, thus using the same
compatible as AXG since they share most of same architecture.

Neil

> 
>> [0]: https://lkml.kernel.org/r/20190128181316.30814-1-jbrunet@baylibre.com
>>
>>  .../reset/amlogic,meson-g12a-reset.h          | 134 ++++++++++++++++++
>>  1 file changed, 134 insertions(+)
>>  create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>>
>> diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> new file mode 100644
>> index 000000000000..8063e8314eef
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> @@ -0,0 +1,134 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
>> +/*
>> + * Copyright (c) 2019 BayLibre, SAS.
>> + * Author: Jerome Brunet <jbrunet@baylibre.com>
>> + *
>> + */
>> +
>> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_G12A_RESET_H
>> +#define _DT_BINDINGS_AMLOGIC_MESON_G12A_RESET_H
>> +
>> +/*	RESET0					*/
>> +#define RESET_HIU			0
>> +/*					1	*/
>> +#define RESET_DOS			2
>> +/*					3-4	*/
>> +#define RESET_VIU			5
>> +#define RESET_AFIFO			6
>> +#define RESET_VID_PLL_DIV		7
>> +/*					8-9	*/
>> +#define RESET_VENC			10
>> +#define RESET_ASSIST			11
>> +#define RESET_PCIE_CTRL_A		12
>> +#define RESET_VCBUS			13
>> +#define RESET_PCIE_PHY			14
>> +#define RESET_PCIE_APB			15
>> +#define RESET_GIC			16
>> +#define RESET_CAPB3_DECODE		17
>> +/*					18	*/
>> +#define RESET_HDMITX_CAPB3		19
>> +#define RESET_DVALIN_CAPB3		20
>> +#define RESET_DOS_CAPB3			21
>> +/*					22	*/
>> +#define RESET_CBUS_CAPB3		23
>> +#define RESET_AHB_CNTL			24
>> +#define RESET_AHB_DATA			25
>> +#define RESET_VCBUS_CLK81		26
>> +/*					27-31	*/
>> +/*	RESET1					*/
>> +/*					32	*/
>> +#define RESET_DEMUX			33
>> +#define RESET_USB			34
>> +#define RESET_DDR			35
>> +/*					36	*/
>> +#define RESET_BT656			37
>> +#define RESET_AHB_SRAM			38
>> +/*					39	*/
>> +#define RESET_PARSER			40
>> +/*					41	*/
>> +#define RESET_ISA			42
>> +#define RESET_ETHERNET			43
>> +#define RESET_SD_EMMC_A			44
>> +#define RESET_SD_EMMC_B			45
>> +#define RESET_SD_EMMC_C			46
>> +/*					47-60 */
>> +#define RESET_AUDIO_CODEC		61
>> +/*					62-63	*/
>> +/*	RESET2					*/
>> +/*					64	*/
>> +#define RESET_AUDIO			65
>> +#define RESET_HDMITX_PHY		66
>> +/*					67	*/
>> +#define RESET_MIPI_DSI_HOST		68
>> +#define RESET_ALOCKER			69
>> +#define RESET_GE2D			70
>> +#define RESET_PARSER_REG		71
>> +#define RESET_PARSER_FETCH		72
>> +#define RESET_CTL			73
>> +#define RESET_PARSER_TOP		74
>> +/*					75-77	*/
>> +#define RESET_DVALIN			78
>> +#define RESET_HDMITX			79
>> +/*					80-95	*/
>> +/*	RESET3					*/
>> +/*					96-95	*/
>> +#define RESET_DEMUX_TOP			105
>> +#define RESET_DEMUX_DES_PL		106
>> +#define RESET_DEMUX_S2P_0		107
>> +#define RESET_DEMUX_S2P_1		108
>> +#define RESET_DEMUX_0			109
>> +#define RESET_DEMUX_1			110
>> +#define RESET_DEMUX_2			111
>> +/*					112-127	*/
>> +/*	RESET4					*/
>> +/*					128-129	*/
>> +#define RESET_MIPI_DSI_PHY		130
>> +/*					131-132	*/
>> +#define RESET_RDMA			133
>> +#define RESET_VENCI			134
>> +#define RESET_VENCP			135
>> +/*					136	*/
>> +#define RESET_VDAC			137
>> +/*					138-139 */
>> +#define RESET_VDI6			140
>> +#define RESET_VENCL			141
>> +#define RESET_I2C_M1			142
>> +#define RESET_I2C_M2			143
>> +/*					144-159	*/
>> +/*	RESET5					*/
>> +/*					160-191	*/
>> +/*	RESET6					*/
>> +#define RESET_GEN			192
>> +#define RESET_SPICC0			193
>> +#define RESET_SC			194
>> +#define RESET_SANA_3			195
>> +#define RESET_I2C_M0			196
>> +#define RESET_TS_PLL			197
>> +#define RESET_SPICC1			198
>> +#define RESET_STREAM			199
>> +#define RESET_TS_CPU			200
>> +#define RESET_UART0			201
>> +#define RESET_UART1_2			202
>> +#define RESET_ASYNC0			203
>> +#define RESET_ASYNC1			204
>> +#define RESET_SPIFC0			205
>> +#define RESET_I2C_M3			206
>> +/*					207-223	*/
>> +/*	RESET7					*/
>> +#define RESET_USB_DDR_0			224
>> +#define RESET_USB_DDR_1			225
>> +#define RESET_USB_DDR_2			226
>> +#define RESET_USB_DDR_3			227
>> +#define RESET_TS_GPU			228
>> +#define RESET_DEVICE_MMC_ARB		229
>> +#define RESET_DVALIN_DMC_PIPL		230
>> +#define RESET_VID_LOCK			231
>> +#define RESET_NIC_DMC_PIPL		232
>> +#define RESET_DMC_VPU_PIPL		233
>> +#define RESET_GE2D_DMC_PIPL		234
>> +#define RESET_HCODEC_DMC_PIPL		235
>> +#define RESET_WAVE420_DMC_PIPL		236
>> +#define RESET_HEVCF_DMC_PIPL		237
>> +/*					238-255	*/
>> +
>> +#endif
> 
> regards
> Philipp
> 
