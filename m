Return-Path: <SRS0=h1RO=FZ=codeaurora.org=kramasub@kernel.org>
Subject: Re: [PATCH v3 2/4] soc: qcom: Add GENI based QUP Wrapper driver
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-3-git-send-email-kramasub@codeaurora.org>
 <152002326567.108663.16836885081217739460@swboyd.mtv.corp.google.com>
From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Message-ID: <4ac213a6-081f-72c1-c9c8-6994786285c9@codeaurora.org>
Date: Fri, 2 Mar 2018 17:58:23 -0700
MIME-Version: 1.0
In-Reply-To: <152002326567.108663.16836885081217739460@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@chromium.org>, andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>



On 3/2/2018 1:41 PM, Stephen Boyd wrote:
> Quoting Karthikeyan Ramasubramanian (2018-02-27 17:38:07)
>> This driver manages the Generic Interface (GENI) firmware based Qualcomm
>> Universal Peripheral (QUP) Wrapper. GENI based QUP is the next generation
>> programmable module composed of multiple Serial Engines (SE) and supports
>> a wide range of serial interfaces like UART, SPI, I2C, I3C, etc. This
>> driver also enables managing the serial interface independent aspects of
>> Serial Engines.
>>
>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
>> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
>> ---
>>   drivers/soc/qcom/Kconfig        |   9 +
>>   drivers/soc/qcom/Makefile       |   1 +
>>   drivers/soc/qcom/qcom-geni-se.c | 971 ++++++++++++++++++++++++++++++++++++++++
>>   include/linux/qcom-geni-se.h    | 247 ++++++++++
>>   4 files changed, 1228 insertions(+)
>>   create mode 100644 drivers/soc/qcom/qcom-geni-se.c
>>   create mode 100644 include/linux/qcom-geni-se.h
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index e050eb8..cc460d0 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -3,6 +3,15 @@
>>   #
>>   menu "Qualcomm SoC drivers"
>>   
>> +config QCOM_GENI_SE
>> +       tristate "QCOM GENI Serial Engine Driver"
>> +       depends on ARCH_QCOM
> 
> Add || COMPILE_TEST?
Ok.
> 
>> +       help
>> +         This module is used to manage Generic Interface (GENI) firmware based
> 
> s/module/driver?
> 
>> +         Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
>> +         module is also used to manage the common aspects of multiple Serial
> s/module/driver?
Ok.
> 
>> +         Engines present in the QUP.
>> +
>>   config QCOM_GLINK_SSR
>>          tristate "Qualcomm Glink SSR driver"
>>          depends on RPMSG
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> new file mode 100644
>> index 0000000..61335b8
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -0,0 +1,971 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> +
>> +#include <linux/clk.h>
>> +#include <linux/slab.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/qcom-geni-se.h>
> 
> #include <linux/platform_device.h>
Ok
> 
>> +
>> +/**
>> + * DOC: Overview
>> + *
>> + * Generic Interface (GENI) Serial Engine (SE) Wrapper driver is introduced
>> + * to manage GENI firmware based Qualcomm Universal Peripheral (QUP) Wrapper
>> + * controller. QUP Wrapper is designed to support various serial bus protocols
>> + * like UART, SPI, I2C, I3C, etc.
>> + */
>> +
>> +/**
>> + * DOC: Hardware description
>> + *
>> + * GENI based QUP is a highly-flexible and programmable module for supporting
>> + * a wide range of serial interfaces like UART, SPI, I2C, I3C, etc. A single
>> + * QUP module can provide upto 8 Serial Interfaces, using its internal
>> + * Serial Engines. The actual configuration is determined by the target
>> + * platform configuration. The protocol supported by each interface is
>> + * determined by the firmware loaded to the Serial Engine. Each SE consists
>> + * of a DMA Engine and GENI sub modules which enable Serial Engines to
>> + * support FIFO and DMA modes of operation.
>> + *
>> + *
>> + *                      +-----------------------------------------+
>> + *                      |QUP Wrapper                              |
>> + *                      |         +----------------------------+  |
>> + *   --QUP & SE Clocks-->         | Serial Engine N            |  +-IO------>
>> + *                      |         | ...                        |  | Interface
>> + *   <---Clock Perf.----+    +----+-----------------------+    |  |
>> + *     State Interface  |    | Serial Engine 1            |    |  |
>> + *                      |    |                            |    |  |
>> + *                      |    |                            |    |  |
>> + *   <--------AHB------->    |                            |    |  |
>> + *                      |    |                            +----+  |
>> + *                      |    |                            |       |
>> + *                      |    |                            |       |
>> + *   <------SE IRQ------+    +----------------------------+       |
>> + *                      |                                         |
>> + *                      +-----------------------------------------+
>> + *
>> + *                         Figure 1: GENI based QUP Wrapper
> 
> The code talks about primary and secondary sequencers, but this hardware
> description doesn't talk about it. Can you add some more information
> here about that aspect too?
Ok.
> 
>> + */
>> +
>> +/**
>> + * DOC: Software description
>> + *
>> + * GENI SE Wrapper driver is structured into 2 parts:
>> + *
>> + * geni_wrapper represents QUP Wrapper controller. This part of the driver
>> + * manages QUP Wrapper information such as hardware version, clock
>> + * performance table that is common to all the internal Serial Engines.
>> + *
>> + * geni_se represents Serial Engine. This part of the driver manages Serial
>> + * Engine information such as clocks, containing QUP Wrapper etc. This part
> 
> Insert a comma here                                           ^
Ok.
> 
>> + * of driver also supports operations(eg. initialize the concerned Serial
> 
> Space
Ok.
                                    ^
> 
>> + * Engine, select between FIFO and DMA mode of operation etc.) that are
>> + * common to all the Serial Engines and are independent of Serial Interfaces.
> 
> Why are Serial Interfaces and Serial Engine always capitalized?
No special reason. I will change it to small letter.
> 
>> + */
>> +
>> +#define MAX_CLK_PERF_LEVEL 32
>> +#define NUM_AHB_CLKS 2
>> +static const char m_ahb_clk[] = "m-ahb";
>> +static const char s_ahb_clk[] = "s-ahb";
> 
> These are used in one place. Inline them?
Ok.
> 
>> +
>> +/**
>> + * @struct geni_wrapper - Data structure to represent the QUP Wrapper Core
>> + * @dev:               Device pointer of the QUP wrapper core.
>> + * @base:              Base address of this instance of QUP wrapper core.
>> + * @ahb_clks:          Handle to the primary & secondary AHB clocks.
>> + * @lock:              Lock to protect the device elements.
> 
> What does 'device elements' mean?
It means members of geni_wrapper structure. I will document that way.
> 
>> + * @num_clk_levels:    Number of valid clock levels in clk_perf_tbl.
>> + * @clk_perf_tbl:      Table of clock frequency input to Serial Engine clock.
> 
> Kernel-doc normally doesn't have a full-stop on member descriptions.
Ok. I will remove the full-stop.
> 
>> + */
>> +struct geni_wrapper {
>> +       struct device *dev;
>> +       void __iomem *base;
>> +       struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
>> +       struct mutex lock;
>> +       unsigned int num_clk_levels;
>> +       unsigned long *clk_perf_tbl;
>> +};
>> +
>> +/* Offset of QUP Hardware Version Register */
> 
> Useless comment?
I will remove it.
> 
>> +#define QUP_HW_VER_REG                 0x4
>> +
>> +#define HW_VER_MAJOR_MASK              GENMASK(31, 28)
>> +#define HW_VER_MAJOR_SHFT              28
>> +#define HW_VER_MINOR_MASK              GENMASK(27, 16)
>> +#define HW_VER_MINOR_SHFT              16
>> +#define HW_VER_STEP_MASK               GENMASK(15, 0)
>> +
>> +/* Common SE registers */
>> +#define GENI_INIT_CFG_REVISION         0x0
>> +#define GENI_S_INIT_CFG_REVISION       0x4
>> +#define GENI_OUTPUT_CTRL               0x24
>> +#define GENI_CGC_CTRL                  0x28
>> +#define GENI_CLK_CTRL_RO               0x60
>> +#define GENI_IF_DISABLE_RO             0x64
>> +#define GENI_FW_REVISION_RO            0x68
>> +#define GENI_FW_S_REVISION_RO          0x6c
>> +#define SE_GENI_BYTE_GRAN              0x254
>> +#define SE_GENI_TX_PACKING_CFG0                0x260
>> +#define SE_GENI_TX_PACKING_CFG1                0x264
>> +#define SE_GENI_RX_PACKING_CFG0                0x284
>> +#define SE_GENI_RX_PACKING_CFG1                0x288
>> +#define SE_GENI_M_GP_LENGTH            0x910
>> +#define SE_GENI_S_GP_LENGTH            0x914
>> +#define SE_DMA_TX_PTR_L                        0xc30
>> +#define SE_DMA_TX_PTR_H                        0xc34
>> +#define SE_DMA_TX_ATTR                 0xc38
>> +#define SE_DMA_TX_LEN                  0xc3c
>> +#define SE_DMA_TX_IRQ_EN               0xc48
>> +#define SE_DMA_TX_IRQ_EN_SET           0xc4c
>> +#define SE_DMA_TX_IRQ_EN_CLR           0xc50
>> +#define SE_DMA_TX_LEN_IN               0xc54
>> +#define SE_DMA_TX_MAX_BURST            0xc5c
>> +#define SE_DMA_RX_PTR_L                        0xd30
>> +#define SE_DMA_RX_PTR_H                        0xd34
>> +#define SE_DMA_RX_ATTR                 0xd38
>> +#define SE_DMA_RX_LEN                  0xd3c
>> +#define SE_DMA_RX_IRQ_EN               0xd48
>> +#define SE_DMA_RX_IRQ_EN_SET           0xd4c
>> +#define SE_DMA_RX_IRQ_EN_CLR           0xd50
>> +#define SE_DMA_RX_LEN_IN               0xd54
>> +#define SE_DMA_RX_MAX_BURST            0xd5c
>> +#define SE_DMA_RX_FLUSH                        0xd60
>> +#define SE_GSI_EVENT_EN                        0xe18
>> +#define SE_IRQ_EN                      0xe1c
>> +#define SE_HW_PARAM_0                  0xe24
>> +#define SE_HW_PARAM_1                  0xe28
>> +#define SE_DMA_GENERAL_CFG             0xe30
>> +
>> +/* GENI_OUTPUT_CTRL fields */
>> +#define DEFAULT_IO_OUTPUT_CTRL_MSK     GENMASK(6, 0)
>> +
>> +/* GENI_CGC_CTRL fields */
>> +#define CFG_AHB_CLK_CGC_ON             BIT(0)
>> +#define CFG_AHB_WR_ACLK_CGC_ON         BIT(1)
>> +#define DATA_AHB_CLK_CGC_ON            BIT(2)
>> +#define SCLK_CGC_ON                    BIT(3)
>> +#define TX_CLK_CGC_ON                  BIT(4)
>> +#define RX_CLK_CGC_ON                  BIT(5)
>> +#define EXT_CLK_CGC_ON                 BIT(6)
>> +#define PROG_RAM_HCLK_OFF              BIT(8)
>> +#define PROG_RAM_SCLK_OFF              BIT(9)
>> +#define DEFAULT_CGC_EN                 GENMASK(6, 0)
>> +
>> +/* FW_REVISION_RO fields */
>> +#define FW_REV_PROTOCOL_MSK            GENMASK(15, 8)
>> +#define FW_REV_PROTOCOL_SHFT           8
>> +
>> +/* SE_GSI_EVENT_EN fields */
>> +#define DMA_RX_EVENT_EN                        BIT(0)
>> +#define DMA_TX_EVENT_EN                        BIT(1)
>> +#define GENI_M_EVENT_EN                        BIT(2)
>> +#define GENI_S_EVENT_EN                        BIT(3)
>> +
>> +/* SE_IRQ_EN fields */
>> +#define DMA_RX_IRQ_EN                  BIT(0)
>> +#define DMA_TX_IRQ_EN                  BIT(1)
>> +#define GENI_M_IRQ_EN                  BIT(2)
>> +#define GENI_S_IRQ_EN                  BIT(3)
>> +
>> +/* SE_HW_PARAM_0 fields */
>> +#define TX_FIFO_WIDTH_MSK              GENMASK(29, 24)
>> +#define TX_FIFO_WIDTH_SHFT             24
>> +#define TX_FIFO_DEPTH_MSK              GENMASK(21, 16)
>> +#define TX_FIFO_DEPTH_SHFT             16
>> +
>> +/* SE_HW_PARAM_1 fields */
>> +#define RX_FIFO_WIDTH_MSK              GENMASK(29, 24)
>> +#define RX_FIFO_WIDTH_SHFT             24
>> +#define RX_FIFO_DEPTH_MSK              GENMASK(21, 16)
>> +#define RX_FIFO_DEPTH_SHFT             16
>> +
>> +/* SE_DMA_GENERAL_CFG */
>> +#define DMA_RX_CLK_CGC_ON              BIT(0)
>> +#define DMA_TX_CLK_CGC_ON              BIT(1)
>> +#define DMA_AHB_SLV_CFG_ON             BIT(2)
>> +#define AHB_SEC_SLV_CLK_CGC_ON         BIT(3)
>> +#define DUMMY_RX_NON_BUFFERABLE                BIT(4)
>> +#define RX_DMA_ZERO_PADDING_EN         BIT(5)
>> +#define RX_DMA_IRQ_DELAY_MSK           GENMASK(8, 6)
>> +#define RX_DMA_IRQ_DELAY_SHFT          6
>> +
>> +/**
>> + * geni_se_get_qup_hw_version() - Read the QUP wrapper Hardware version
>> + * @se:                        Pointer to the corresponding Serial Engine.
>> + * @major:             Buffer for Major Version field.
>> + * @minor:             Buffer for Minor Version field.
>> + * @step:              Buffer for Step Version field.
>> + */
>> +void geni_se_get_qup_hw_version(struct geni_se *se, unsigned int *major,
>> +                               unsigned int *minor, unsigned int *step)
>> +{
>> +       unsigned int version;
>> +       struct geni_wrapper *wrapper = se->wrapper;
>> +
>> +       version = readl_relaxed(wrapper->base + QUP_HW_VER_REG);
>> +       *major = (version & HW_VER_MAJOR_MASK) >> HW_VER_MAJOR_SHFT;
>> +       *minor = (version & HW_VER_MINOR_MASK) >> HW_VER_MINOR_SHFT;
>> +       *step = version & HW_VER_STEP_MASK;
>> +}
>> +EXPORT_SYMBOL(geni_se_get_qup_hw_version);
> 
> Is this used?
SPI controller driver uses this API and it will be uploaded sooner.
> 
>> +
>> +/**
>> + * geni_se_read_proto() - Read the protocol configured for a Serial Engine
>> + * @se:        Pointer to the concerned Serial Engine.
>> + *
>> + * Return: Protocol value as configured in the serial engine.
>> + */
>> +u32 geni_se_read_proto(struct geni_se *se)
>> +{
>> +       u32 val;
>> +
>> +       val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
>> +
>> +       return (val & FW_REV_PROTOCOL_MSK) >> FW_REV_PROTOCOL_SHFT;
>> +}
>> +EXPORT_SYMBOL(geni_se_read_proto);
> 
> Is this API really needed outside of this file? It would seem like the
> drivers that implement the protocol, which are child devices, would only
> use this API to confirm that the protocol chosen is for their particular
> protocol.
No, this API is meant for the protocol drivers to confirm that the 
serial engine is programmed with the firmware for the concerned protocol 
before using the serial engine. If the check fails, the protocol drivers 
stop using the serial engine.
> 
> 
>> +
>> +static void geni_se_io_set_mode(void __iomem *base)
>> +{
>> +       u32 val;
>> +
>> +       val = readl_relaxed(base + SE_IRQ_EN);
>> +       val |= (GENI_M_IRQ_EN | GENI_S_IRQ_EN);
>> +       val |= (DMA_TX_IRQ_EN | DMA_RX_IRQ_EN);
> 
> Drop useless parenthesis please.
Ok.
> 
>> +       writel_relaxed(val, base + SE_IRQ_EN);
>> +
>> +       val = readl_relaxed(base + SE_GENI_DMA_MODE_EN);
>> +       val &= ~GENI_DMA_MODE_EN;
>> +       writel_relaxed(val, base + SE_GENI_DMA_MODE_EN);
>> +
>> +       writel_relaxed(0, base + SE_GSI_EVENT_EN);
>> +}
>> +
>> +static void geni_se_io_init(void __iomem *base)
>> +{
>> +       u32 val;
>> +
>> +       val = readl_relaxed(base + GENI_CGC_CTRL);
>> +       val |= DEFAULT_CGC_EN;
>> +       writel_relaxed(val, base + GENI_CGC_CTRL);
>> +
>> +       val = readl_relaxed(base + SE_DMA_GENERAL_CFG);
>> +       val |= AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CFG_ON;
>> +       val |= DMA_TX_CLK_CGC_ON | DMA_RX_CLK_CGC_ON;
>> +       writel_relaxed(val, base + SE_DMA_GENERAL_CFG);
>> +
>> +       writel_relaxed(DEFAULT_IO_OUTPUT_CTRL_MSK, base + GENI_OUTPUT_CTRL);
>> +       writel_relaxed(FORCE_DEFAULT, base + GENI_FORCE_DEFAULT_REG);
>> +}
>> +
>> +/**
>> + * geni_se_init() - Initialize the GENI Serial Engine
>> + * @se:                Pointer to the concerned Serial Engine.
>> + * @rx_wm:     Receive watermark, in units of FIFO words.
>> + * @rx_rfr_wm: Ready-for-receive watermark, in units of FIFO words.
>> + *
>> + * This function is used to initialize the GENI serial engine, configure
>> + * receive watermark and ready-for-receive watermarks.
>> + *
>> + * Return: 0 on success, standard Linux error codes on failure/error.
> 
> It never returns an error. Change to void?
Ok.
> 
>> + */
>> +int geni_se_init(struct geni_se *se, u32 rx_wm, u32 rx_rfr)
>> +{
>> +       u32 val;
>> +
>> +       geni_se_io_init(se->base);
>> +       geni_se_io_set_mode(se->base);
>> +
>> +       writel_relaxed(rx_wm, se->base + SE_GENI_RX_WATERMARK_REG);
>> +       writel_relaxed(rx_rfr, se->base + SE_GENI_RX_RFR_WATERMARK_REG);
>> +
>> +       val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
>> +       val |= M_COMMON_GENI_M_IRQ_EN;
>> +       writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
>> +
>> +       val = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
>> +       val |= S_COMMON_GENI_S_IRQ_EN;
>> +       writel_relaxed(val, se->base + SE_GENI_S_IRQ_EN);
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(geni_se_init);
>> +
>> +static void geni_se_select_fifo_mode(struct geni_se *se)
>> +{
>> +       u32 proto = geni_se_read_proto(se);
>> +       u32 val;
>> +
>> +       writel_relaxed(0, se->base + SE_GSI_EVENT_EN);
>> +       writel_relaxed(0xffffffff, se->base + SE_GENI_M_IRQ_CLEAR);
>> +       writel_relaxed(0xffffffff, se->base + SE_GENI_S_IRQ_CLEAR);
>> +       writel_relaxed(0xffffffff, se->base + SE_DMA_TX_IRQ_CLR);
>> +       writel_relaxed(0xffffffff, se->base + SE_DMA_RX_IRQ_CLR);
>> +       writel_relaxed(0xffffffff, se->base + SE_IRQ_EN);
>> +
>> +       val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
>> +       if (proto != GENI_SE_UART) {
>> +               val |= M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN;
>> +               val |= M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN;
>> +       }
>> +       writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
>> +
>> +       val = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
>> +       if (proto != GENI_SE_UART)
>> +               val |= S_CMD_DONE_EN;
>> +       writel_relaxed(val, se->base + SE_GENI_S_IRQ_EN);
>> +
>> +       val = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
>> +       val &= ~GENI_DMA_MODE_EN;
>> +       writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
>> +}
>> +
>> +static void geni_se_select_dma_mode(struct geni_se *se)
>> +{
>> +       u32 val;
>> +
>> +       writel_relaxed(0, se->base + SE_GSI_EVENT_EN);
>> +       writel_relaxed(0xffffffff, se->base + SE_GENI_M_IRQ_CLEAR);
>> +       writel_relaxed(0xffffffff, se->base + SE_GENI_S_IRQ_CLEAR);
>> +       writel_relaxed(0xffffffff, se->base + SE_DMA_TX_IRQ_CLR);
>> +       writel_relaxed(0xffffffff, se->base + SE_DMA_RX_IRQ_CLR);
>> +       writel_relaxed(0xffffffff, se->base + SE_IRQ_EN);
>> +
>> +       val = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
>> +       val |= GENI_DMA_MODE_EN;
>> +       writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
>> +}
>> +
>> +/**
>> + * geni_se_select_mode() - Select the serial engine transfer mode
>> + * @se:                Pointer to the concerned Serial Engine.
>> + * @mode:      Transfer mode to be selected.
>> + */
>> +void geni_se_select_mode(struct geni_se *se, int mode)
> 
> enum mode?
Ok.
> 
>> +{
>> +       WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA);
>> +
>> +       switch (mode) {
>> +       case GENI_SE_FIFO:
>> +               geni_se_select_fifo_mode(se);
>> +               break;
>> +       case GENI_SE_DMA:
>> +               geni_se_select_dma_mode(se);
>> +               break;
>> +       }
>> +}
>> +EXPORT_SYMBOL(geni_se_select_mode);
>> +
>> +/**
>> + * geni_se_setup_m_cmd() - Setup the primary sequencer
>> + * @se:                Pointer to the concerned Serial Engine.
>> + * @cmd:       Command/Operation to setup in the primary sequencer.
>> + * @params:    Parameter for the sequencer command.
>> + *
>> + * This function is used to configure the primary sequencer with the
>> + * command and its associated parameters.
>> + */
>> +void geni_se_setup_m_cmd(struct geni_se *se, u32 cmd, u32 params)
>> +{
>> +       u32 m_cmd;
>> +
>> +       m_cmd = (cmd << M_OPCODE_SHFT) | (params & M_PARAMS_MSK);
>> +       writel_relaxed(m_cmd, se->base + SE_GENI_M_CMD0);
>> +}
>> +EXPORT_SYMBOL(geni_se_setup_m_cmd);
>> +
>> +/**
>> + * geni_se_setup_s_cmd() - Setup the secondary sequencer
>> + * @se:                Pointer to the concerned Serial Engine.
>> + * @cmd:       Command/Operation to setup in the secondary sequencer.
>> + * @params:    Parameter for the sequencer command.
>> + *
>> + * This function is used to configure the secondary sequencer with the
>> + * command and its associated parameters.
>> + */
>> +void geni_se_setup_s_cmd(struct geni_se *se, u32 cmd, u32 params)
>> +{
>> +       u32 s_cmd;
>> +
>> +       s_cmd = readl_relaxed(se->base + SE_GENI_S_CMD0);
>> +       s_cmd &= ~(S_OPCODE_MSK | S_PARAMS_MSK);
>> +       s_cmd |= (cmd << S_OPCODE_SHFT);
>> +       s_cmd |= (params & S_PARAMS_MSK);
>> +       writel_relaxed(s_cmd, se->base + SE_GENI_S_CMD0);
>> +}
>> +EXPORT_SYMBOL(geni_se_setup_s_cmd);
>> +
>> +/**
>> + * geni_se_cancel_m_cmd() - Cancel the command configured in the primary
>> + *                          sequencer
>> + * @se:        Pointer to the concerned Serial Engine.
>> + *
>> + * This function is used to cancel the currently configured command in the
>> + * primary sequencer.
>> + */
>> +void geni_se_cancel_m_cmd(struct geni_se *se)
>> +{
>> +       writel_relaxed(M_GENI_CMD_CANCEL, se->base + SE_GENI_M_CMD_CTRL_REG);
>> +}
>> +EXPORT_SYMBOL(geni_se_cancel_m_cmd);
>> +
>> +/**
>> + * geni_se_cancel_s_cmd() - Cancel the command configured in the secondary
>> + *                          sequencer
>> + * @se:        Pointer to the concerned Serial Engine.
>> + *
>> + * This function is used to cancel the currently configured command in the
>> + * secondary sequencer.
>> + */
>> +void geni_se_cancel_s_cmd(struct geni_se *se)
>> +{
>> +       writel_relaxed(S_GENI_CMD_CANCEL, se->base + SE_GENI_S_CMD_CTRL_REG);
>> +}
>> +EXPORT_SYMBOL(geni_se_cancel_s_cmd);
>> +
>> +/**
>> + * geni_se_abort_m_cmd() - Abort the command configured in the primary sequencer
>> + * @se:        Pointer to the concerned Serial Engine.
>> + *
>> + * This function is used to force abort the currently configured command in the
>> + * primary sequencer.
>> + */
>> +void geni_se_abort_m_cmd(struct geni_se *se)
>> +{
>> +       writel_relaxed(M_GENI_CMD_ABORT, se->base + SE_GENI_M_CMD_CTRL_REG);
>> +}
>> +EXPORT_SYMBOL(geni_se_abort_m_cmd);
>> +
>> +/**
>> + * geni_se_abort_s_cmd() - Abort the command configured in the secondary
>> + *                         sequencer
>> + * @se:        Pointer to the concerned Serial Engine.
>> + *
>> + * This function is used to force abort the currently configured command in the
>> + * secondary sequencer.
>> + */
>> +void geni_se_abort_s_cmd(struct geni_se *se)
>> +{
>> +       writel_relaxed(S_GENI_CMD_ABORT, se->base + SE_GENI_S_CMD_CTRL_REG);
>> +}
>> +EXPORT_SYMBOL(geni_se_abort_s_cmd);
> 
> Can these one-liners go into the header file and be marked static
> inline? I would guess call-sites already have se->base in hand, so
> registers might be reused more efficiently and it may result in a single
> store instruction instead of a branch and load/store.
Ok.
> 
>> +
>> +/**
>> + * geni_se_get_tx_fifo_depth() - Get the TX fifo depth of the serial engine
>> + * @se:        Pointer to the concerned Serial Engine.
>> + *
>> + * This function is used to get the depth i.e. number of elements in the
>> + * TX fifo of the serial engine.
>> + *
>> + * Return: TX fifo depth in units of FIFO words.
>> + */
>> +u32 geni_se_get_tx_fifo_depth(struct geni_se *se)
>> +{
>> +       u32 val;
>> +
>> +       val = readl_relaxed(se->base + SE_HW_PARAM_0);
>> +
>> +       return (val & TX_FIFO_DEPTH_MSK) >> TX_FIFO_DEPTH_SHFT;
>> +}
>> +EXPORT_SYMBOL(geni_se_get_tx_fifo_depth);
>> +
>> +/**
>> + * geni_se_get_tx_fifo_width() - Get the TX fifo width of the serial engine
>> + * @se:        Pointer to the concerned Serial Engine.
>> + *
>> + * This function is used to get the width i.e. word size per element in the
>> + * TX fifo of the serial engine.
>> + *
>> + * Return: TX fifo width in bits
>> + */
>> +u32 geni_se_get_tx_fifo_width(struct geni_se *se)
>> +{
>> +       u32 val;
>> +
>> +       val = readl_relaxed(se->base + SE_HW_PARAM_0);
>> +
>> +       return (val & TX_FIFO_WIDTH_MSK) >> TX_FIFO_WIDTH_SHFT;
>> +}
>> +EXPORT_SYMBOL(geni_se_get_tx_fifo_width);
>> +
>> +/**
>> + * geni_se_get_rx_fifo_depth() - Get the RX fifo depth of the serial engine
>> + * @se:        Pointer to the concerned Serial Engine.
>> + *
>> + * This function is used to get the depth i.e. number of elements in the
>> + * RX fifo of the serial engine.
>> + *
>> + * Return: RX fifo depth in units of FIFO words
>> + */
>> +u32 geni_se_get_rx_fifo_depth(struct geni_se *se)
>> +{
>> +       u32 val;
>> +
>> +       val = readl_relaxed(se->base + SE_HW_PARAM_1);
>> +
>> +       return (val & RX_FIFO_DEPTH_MSK) >> RX_FIFO_DEPTH_SHFT;
>> +}
>> +EXPORT_SYMBOL(geni_se_get_rx_fifo_depth);
> 
> These ones too, can probably just be static inline.
Ok. Just for my knowledge - is there any reference guideline regarding 
when to use static inline myself and when to let the compiler do the 
clever thing?
> 
>> +
>> +/**
>> + * DOC: Overview
>> + *
>> + * GENI FIFO packing is highly configurable. TX/RX packing/unpacking consist
>> + * of up to 4 operations, each operation represented by 4 configuration vectors
>> + * of 10 bits programmed in GENI_TX_PACKING_CFG0 and GENI_TX_PACKING_CFG1 for
>> + * TX FIFO and in GENI_RX_PACKING_CFG0 and GENI_RX_PACKING_CFG1 for RX FIFO.
>> + * Refer to below examples for detailed bit-field description.
>> + *
>> + * Example 1: word_size = 7, packing_mode = 4 x 8, msb_to_lsb = 1
>> + *
>> + *        +-----------+-------+-------+-------+-------+
>> + *        |           | vec_0 | vec_1 | vec_2 | vec_3 |
>> + *        +-----------+-------+-------+-------+-------+
>> + *        | start     | 0x6   | 0xe   | 0x16  | 0x1e  |
>> + *        | direction | 1     | 1     | 1     | 1     |
>> + *        | length    | 6     | 6     | 6     | 6     |
>> + *        | stop      | 0     | 0     | 0     | 1     |
>> + *        +-----------+-------+-------+-------+-------+
>> + *
>> + * Example 2: word_size = 15, packing_mode = 2 x 16, msb_to_lsb = 0
>> + *
>> + *        +-----------+-------+-------+-------+-------+
>> + *        |           | vec_0 | vec_1 | vec_2 | vec_3 |
>> + *        +-----------+-------+-------+-------+-------+
>> + *        | start     | 0x0   | 0x8   | 0x10  | 0x18  |
>> + *        | direction | 0     | 0     | 0     | 0     |
>> + *        | length    | 7     | 6     | 7     | 6     |
>> + *        | stop      | 0     | 0     | 0     | 1     |
>> + *        +-----------+-------+-------+-------+-------+
>> + *
>> + * Example 3: word_size = 23, packing_mode = 1 x 32, msb_to_lsb = 1
>> + *
>> + *        +-----------+-------+-------+-------+-------+
>> + *        |           | vec_0 | vec_1 | vec_2 | vec_3 |
>> + *        +-----------+-------+-------+-------+-------+
>> + *        | start     | 0x16  | 0xe   | 0x6   | 0x0   |
>> + *        | direction | 1     | 1     | 1     | 1     |
>> + *        | length    | 7     | 7     | 6     | 0     |
>> + *        | stop      | 0     | 0     | 1     | 0     |
>> + *        +-----------+-------+-------+-------+-------+
>> + *
>> + */
>> +
>> +#define NUM_PACKING_VECTORS 4
>> +#define PACKING_START_SHIFT 5
>> +#define PACKING_DIR_SHIFT 4
>> +#define PACKING_LEN_SHIFT 1
>> +#define PACKING_STOP_BIT BIT(0)
>> +#define PACKING_VECTOR_SHIFT 10
>> +/**
>> + * geni_se_config_packing() - Packing configuration of the serial engine
>> + * @se:                Pointer to the concerned Serial Engine
>> + * @bpw:       Bits of data per transfer word.
>> + * @pack_words:        Number of words per fifo element.
>> + * @msb_to_lsb:        Transfer from MSB to LSB or vice-versa.
>> + * @tx_cfg:    Flag to configure the TX Packing.
>> + * @rx_cfg:    Flag to configure the RX Packing.
>> + *
>> + * This function is used to configure the packing rules for the current
>> + * transfer.
>> + */
>> +void geni_se_config_packing(struct geni_se *se, int bpw, int pack_words,
>> +                           bool msb_to_lsb, bool tx_cfg, bool rx_cfg)
>> +{
>> +       u32 cfg0, cfg1, cfg[NUM_PACKING_VECTORS] = {0};
>> +       int len;
>> +       int temp_bpw = bpw;
>> +       int idx_start = msb_to_lsb ? bpw - 1 : 0;
>> +       int idx = idx_start;
>> +       int idx_delta = msb_to_lsb ? -BITS_PER_BYTE : BITS_PER_BYTE;
>> +       int ceil_bpw = (bpw + (BITS_PER_BYTE - 1)) & ~(BITS_PER_BYTE - 1);
> 
> ALIGN(bpw, BITS_PER_BYTE)?
Ok.
> 
>> +       int iter = (ceil_bpw * pack_words) / BITS_PER_BYTE;
>> +       int i;
>> +
>> +       if (iter <= 0 || iter > NUM_PACKING_VECTORS)
>> +               return;
>> +
>> +       for (i = 0; i < iter; i++) {
>> +               if (temp_bpw < BITS_PER_BYTE)
>> +                       len = temp_bpw - 1;
>> +               else
>> +                       len = BITS_PER_BYTE - 1;
> 
> len = min(temp_bpw, BITS_PER_BYTE) - 1;
Ok.
> 
>> +
>> +               cfg[i] = idx << PACKING_START_SHIFT;
>> +               cfg[i] |= msb_to_lsb << PACKING_DIR_SHIFT;
>> +               cfg[i] |= len << PACKING_LEN_SHIFT;
>> +
>> +               if (temp_bpw <= BITS_PER_BYTE) {
>> +                       idx = ((i + 1) * BITS_PER_BYTE) + idx_start;
>> +                       temp_bpw = bpw;
>> +               } else {
>> +                       idx = idx + idx_delta;
>> +                       temp_bpw = temp_bpw - BITS_PER_BYTE;
>> +               }
>> +       }
>> +       cfg[iter - 1] |= PACKING_STOP_BIT;
>> +       cfg0 = cfg[0] | (cfg[1] << PACKING_VECTOR_SHIFT);
>> +       cfg1 = cfg[2] | (cfg[3] << PACKING_VECTOR_SHIFT);
>> +
>> +       if (tx_cfg) {
>> +               writel_relaxed(cfg0, se->base + SE_GENI_TX_PACKING_CFG0);
>> +               writel_relaxed(cfg1, se->base + SE_GENI_TX_PACKING_CFG1);
>> +       }
>> +       if (rx_cfg) {
>> +               writel_relaxed(cfg0, se->base + SE_GENI_RX_PACKING_CFG0);
>> +               writel_relaxed(cfg1, se->base + SE_GENI_RX_PACKING_CFG1);
>> +       }
>> +
>> +       /*
>> +        * Number of protocol words in each FIFO entry
>> +        * 0 - 4x8, four words in each entry, max word size of 8 bits
>> +        * 1 - 2x16, two words in each entry, max word size of 16 bits
>> +        * 2 - 1x32, one word in each entry, max word size of 32 bits
>> +        * 3 - undefined
>> +        */
>> +       if (pack_words || bpw == 32)
>> +               writel_relaxed(bpw / 16, se->base + SE_GENI_BYTE_GRAN);
>> +}
>> +EXPORT_SYMBOL(geni_se_config_packing);
>> +
>> +static void geni_se_clks_off(struct geni_se *se)
>> +{
>> +       struct geni_wrapper *wrapper = se->wrapper;
>> +
>> +       clk_disable_unprepare(se->clk);
>> +       clk_bulk_disable_unprepare(ARRAY_SIZE(wrapper->ahb_clks),
>> +                                               wrapper->ahb_clks);
>> +}
>> +
>> +/**
>> + * geni_se_resources_off() - Turn off resources associated with the serial
>> + *                           engine
>> + * @se:        Pointer to the concerned Serial Engine.
>> + *
>> + * Return: 0 on success, standard Linux error codes on failure/error.
>> + */
>> +int geni_se_resources_off(struct geni_se *se)
>> +{
>> +       int ret;
>> +
>> +       ret = pinctrl_pm_select_sleep_state(se->dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       geni_se_clks_off(se);
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(geni_se_resources_off);
>> +
>> +static int geni_se_clks_on(struct geni_se *se)
>> +{
>> +       int ret;
>> +       struct geni_wrapper *wrapper = se->wrapper;
>> +
>> +       ret = clk_bulk_prepare_enable(ARRAY_SIZE(wrapper->ahb_clks),
>> +                                               wrapper->ahb_clks);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = clk_prepare_enable(se->clk);
>> +       if (ret)
>> +               clk_bulk_disable_unprepare(ARRAY_SIZE(wrapper->ahb_clks),
>> +                                                       wrapper->ahb_clks);
>> +       return ret;
>> +}
>> +
>> +/**
>> + * geni_se_resources_on() - Turn on resources associated with the serial
>> + *                          engine
>> + * @se:        Pointer to the concerned Serial Engine.
>> + *
>> + * Return: 0 on success, standard Linux error codes on failure/error.
>> + */
>> +int geni_se_resources_on(struct geni_se *se)
>> +{
>> +       int ret = 0;
> 
> Don't assign variables and then reassign them on the next line.
Ok.
> 
>> +
>> +       ret = geni_se_clks_on(se);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = pinctrl_pm_select_default_state(se->dev);
>> +       if (ret)
>> +               geni_se_clks_off(se);
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(geni_se_resources_on);
> 
> IS there a reason why we can't use runtime PM or normal linux PM
> infrastructure to power on the wrapper and keep it powered while the
> protocol driver is active?
Besides turning on the clocks & pinctrl settings, wrapper also has to do 
the bus scaling votes. The bus scaling votes depend on the individual 
serial interface bandwidth requirements. The bus scaling votes is not 
present currently. But once the support comes in, this function enables 
adding it.
> 
>> +
>> +/**
>> + * geni_se_clk_tbl_get() - Get the clock table to program DFS
>> + * @se:                Pointer to the concerned Serial Engine.
>> + * @tbl:       Table in which the output is returned.
>> + *
>> + * This function is called by the protocol drivers to determine the different
>> + * clock frequencies supported by Serial Engine Core Clock. The protocol
>> + * drivers use the output to determine the clock frequency index to be
>> + * programmed into DFS.
>> + *
>> + * Return: number of valid performance levels in the table on success,
>> + *        standard Linux error codes on failure.
>> + */
>> +int geni_se_clk_tbl_get(struct geni_se *se, unsigned long **tbl)
>> +{
>> +       struct geni_wrapper *wrapper = se->wrapper;
>> +       unsigned long freq = 0;
>> +       int i;
>> +       int ret = 0;
>> +
>> +       mutex_lock(&wrapper->lock);
>> +       if (wrapper->clk_perf_tbl) {
>> +               *tbl = wrapper->clk_perf_tbl;
>> +               ret = wrapper->num_clk_levels;
>> +               goto out_unlock;
>> +       }
>> +
>> +       wrapper->clk_perf_tbl = kcalloc(MAX_CLK_PERF_LEVEL,
>> +                                       sizeof(*wrapper->clk_perf_tbl),
>> +                                       GFP_KERNEL);
>> +       if (!wrapper->clk_perf_tbl) {
>> +               ret = -ENOMEM;
>> +               goto out_unlock;
>> +       }
>> +
>> +       for (i = 0; i < MAX_CLK_PERF_LEVEL; i++) {
>> +               freq = clk_round_rate(se->clk, freq + 1);
>> +               if (!freq || freq == wrapper->clk_perf_tbl[i - 1])
>> +                       break;
>> +               wrapper->clk_perf_tbl[i] = freq;
>> +       }
>> +       wrapper->num_clk_levels = i;
>> +       *tbl = wrapper->clk_perf_tbl;
>> +       ret = wrapper->num_clk_levels;
>> +out_unlock:
>> +       mutex_unlock(&wrapper->lock);
> 
> Is this lock actually protecting anything? I mean to say, is any more
> than one geni protocol driver calling this function at a time? Or is
> the same geni protocol driver calling this from multiple threads at the
> same time? The lock looks almost useless.
Yes, there is a possibility of multiple I2C instances within the same 
wrapper trying to get this table simultaneously.

As Evan mentioned in the other thread, Bjorn had the comment to move it 
to the probe and remove the lock. I looked into the possibility of it. 
 From the hardware perspective, this table belongs to the wrapper and is 
shared by all the serial engines within the wrapper. But due to software 
implementation reasons, clk_round_rate can be be performed only on the 
clocks that are tagged as DFS compatible and only the serial engine 
clocks are tagged so. At least this was the understanding based on our 
earlier discussion with the concerned folks. We will revisit it and 
check if anything has changed recently.
> 
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(geni_se_clk_tbl_get);
>> +
>> +/**
>> + * geni_se_clk_freq_match() - Get the matching or closest SE clock frequency
>> + * @se:                Pointer to the concerned Serial Engine.
>> + * @req_freq:  Requested clock frequency.
>> + * @index:     Index of the resultant frequency in the table.
>> + * @res_freq:  Resultant frequency which matches or is closer to the
>> + *             requested frequency.
>> + * @exact:     Flag to indicate exact multiple requirement of the requested
>> + *             frequency.
>> + *
>> + * This function is called by the protocol drivers to determine the matching
>> + * or exact multiple of the requested frequency, as provided by the Serial
>> + * Engine clock in order to meet the performance requirements. If there is
>> + * no matching or exact multiple of the requested frequency found, then it
>> + * selects the closest floor frequency, if exact flag is not set.
>> + *
>> + * Return: 0 on success, standard Linux error codes on failure.
>> + */
>> +int geni_se_clk_freq_match(struct geni_se *se, unsigned long req_freq,
>> +                          unsigned int *index, unsigned long *res_freq,
>> +                          bool exact)
>> +{
>> +       unsigned long *tbl;
>> +       int num_clk_levels;
>> +       int i;
>> +
>> +       num_clk_levels = geni_se_clk_tbl_get(se, &tbl);
>> +       if (num_clk_levels < 0)
>> +               return num_clk_levels;
>> +
>> +       if (num_clk_levels == 0)
>> +               return -EFAULT;
> 
> I believe this would mean userspace thought the syscall faulted.
> Perhaps -EINVAL instead?
Ok.
> 
>> +
>> +       *res_freq = 0;
>> +       for (i = 0; i < num_clk_levels; i++) {
>> +               if (!(tbl[i] % req_freq)) {
>> +                       *index = i;
>> +                       *res_freq = tbl[i];
>> +                       return 0;
>> +               }
>> +
>> +               if (!(*res_freq) || ((tbl[i] > *res_freq) &&
>> +                                    (tbl[i] < req_freq))) {
>> +                       *index = i;
>> +                       *res_freq = tbl[i];
>> +               }
>> +       }
>> +
>> +       if (exact)
>> +               return -ENOKEY;
> 
> Interesting error code. Doubtful this is correct because it seems to be
> related to crypto keys.
Ok.
> 
>> +
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(geni_se_clk_freq_match);
>> +
>> +#define GENI_SE_DMA_DONE_EN BIT(0)
>> +#define GENI_SE_DMA_EOT_EN BIT(1)
>> +#define GENI_SE_DMA_AHB_ERR_EN BIT(2)
>> +#define GENI_SE_DMA_EOT_BUF BIT(0)
>> +/**
>> + * geni_se_tx_dma_prep() - Prepare the Serial Engine for TX DMA transfer
>> + * @se:                        Pointer to the concerned Serial Engine.
>> + * @buf:               Pointer to the TX buffer.
>> + * @len:               Length of the TX buffer.
>> + *
>> + * This function is used to prepare the buffers for DMA TX.
>> + *
>> + * Return: Mapped DMA Address of the buffer on success, NULL on failure.
>> + */
>> +dma_addr_t geni_se_tx_dma_prep(struct geni_se *se, void *buf, size_t len)
>> +{
>> +       dma_addr_t iova;
>> +       struct geni_wrapper *wrapper = se->wrapper;
>> +       u32 val;
>> +
>> +       iova = dma_map_single(wrapper->dev, buf, len, DMA_TO_DEVICE);
>> +       if (dma_mapping_error(wrapper->dev, iova))
>> +               return (dma_addr_t)NULL;
>> +
>> +       val = GENI_SE_DMA_DONE_EN;
>> +       val |= GENI_SE_DMA_EOT_EN;
>> +       val |= GENI_SE_DMA_AHB_ERR_EN;
>> +       writel_relaxed(val, se->base + SE_DMA_TX_IRQ_EN_SET);
>> +       writel_relaxed((u32)iova, se->base + SE_DMA_TX_PTR_L);
> 
> lower_32_bits()
Ok.
> 
>> +       writel_relaxed((u32)(iova >> 32), se->base + SE_DMA_TX_PTR_H);
> 
> upper_32_bits()
Ok.
> 
>> +       writel_relaxed(GENI_SE_DMA_EOT_BUF, se->base + SE_DMA_TX_ATTR);
>> +       writel_relaxed((u32)len, se->base + SE_DMA_TX_LEN);
> 
> Useless cast.
I will remove the casting.
> 
>> +       return iova;
>> +}
>> +EXPORT_SYMBOL(geni_se_tx_dma_prep);
>> +
>> +/**
>> + * geni_se_rx_dma_prep() - Prepare the Serial Engine for RX DMA transfer
>> + * @se:                        Pointer to the concerned Serial Engine.
>> + * @buf:               Pointer to the RX buffer.
>> + * @len:               Length of the RX buffer.
>> + *
>> + * This function is used to prepare the buffers for DMA RX.
>> + *
>> + * Return: Mapped DMA Address of the buffer on success, NULL on failure.
>> + */
>> +dma_addr_t geni_se_rx_dma_prep(struct geni_se *se, void *buf, size_t len)
>> +{
>> +       dma_addr_t iova;
>> +       struct geni_wrapper *wrapper = se->wrapper;
>> +       u32 val;
>> +
>> +       iova = dma_map_single(wrapper->dev, buf, len, DMA_FROM_DEVICE);
>> +       if (dma_mapping_error(wrapper->dev, iova))
>> +               return (dma_addr_t)NULL;
> 
> Can't return a dma_mapping_error address to the caller and have them
> figure it out?
Earlier we used to return the DMA_ERROR_CODE which has been removed 
recently in arm64 architecture. If we return the dma_mapping_error, then 
the caller also needs the device which encountered the mapping error. 
The serial interface drivers can use their parent currently to resolve 
the mapping error. Once the wrapper starts mapping using IOMMU context 
bank, then the serial interface drivers do not know which device to use 
to know if there is an error.

Having said that, the dma_ops suggestion might help with handling this 
situation. I will look into it further.
> 
>> +
>> +       val = GENI_SE_DMA_DONE_EN;
>> +       val |= GENI_SE_DMA_EOT_EN;
>> +       val |= GENI_SE_DMA_AHB_ERR_EN;
>> +       writel_relaxed(val, se->base + SE_DMA_RX_IRQ_EN_SET);
>> +       writel_relaxed((u32)iova, se->base + SE_DMA_RX_PTR_L);
>> +       writel_relaxed((u32)(iova >> 32), se->base + SE_DMA_RX_PTR_H);
> 
> upper/lower macros again.
Ok.
> 
>> +       /* RX does not have EOT buffer type bit. So just reset RX_ATTR */
>> +       writel_relaxed(0, se->base + SE_DMA_RX_ATTR);
>> +       writel_relaxed((u32)len, se->base + SE_DMA_RX_LEN);
> 
> Drop cast?
Ok.
> 
>> +       return iova;
>> +}
>> +EXPORT_SYMBOL(geni_se_rx_dma_prep);
>> +
>> +/**
>> + * geni_se_tx_dma_unprep() - Unprepare the Serial Engine after TX DMA transfer
>> + * @se:                        Pointer to the concerned Serial Engine.
>> + * @iova:              DMA address of the TX buffer.
>> + * @len:               Length of the TX buffer.
>> + *
>> + * This function is used to unprepare the DMA buffers after DMA TX.
>> + */
>> +void geni_se_tx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
>> +{
>> +       struct geni_wrapper *wrapper = se->wrapper;
>> +
>> +       if (iova)
>> +               dma_unmap_single(wrapper->dev, iova, len, DMA_TO_DEVICE);
>> +}
>> +EXPORT_SYMBOL(geni_se_tx_dma_unprep);
>> +
>> +/**
>> + * geni_se_rx_dma_unprep() - Unprepare the Serial Engine after RX DMA transfer
>> + * @se:                        Pointer to the concerned Serial Engine.
>> + * @iova:              DMA address of the RX buffer.
>> + * @len:               Length of the RX buffer.
>> + *
>> + * This function is used to unprepare the DMA buffers after DMA RX.
>> + */
>> +void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
>> +{
>> +       struct geni_wrapper *wrapper = se->wrapper;
>> +
>> +       if (iova)
>> +               dma_unmap_single(wrapper->dev, iova, len, DMA_FROM_DEVICE);
>> +}
>> +EXPORT_SYMBOL(geni_se_rx_dma_unprep);
> 
> Instead of having the functions exported, could we set the dma_ops on
> all child devices of the wrapper that this driver populates and then
> implement the DMA ops for those devices here? I assume that there's
> never another DMA master between the wrapper and the serial engine, so I
> think it would work.
This suggestion looks like it will work.
> 
>> +
>> +static int geni_se_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct resource *res;
>> +       struct geni_wrapper *wrapper;
>> +       int ret;
>> +
>> +       wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
>> +       if (!wrapper)
>> +               return -ENOMEM;
>> +
>> +       wrapper->dev = dev;
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       wrapper->base = devm_ioremap_resource(dev, res);
>> +       if (IS_ERR(wrapper->base)) {
>> +               dev_err(dev, "%s: Error mapping the resource\n", __func__);
> 
> Drop error message, devm_ioremap_resource() already does it.
Ok.
> 
>> +               return -EFAULT;
> 
> return PTR_ERR(wrapper->base);
> 
>> +       }
>> +
>> +       wrapper->ahb_clks[0].id = m_ahb_clk;
>> +       wrapper->ahb_clks[1].id = s_ahb_clk;
>> +       ret = devm_clk_bulk_get(dev, NUM_AHB_CLKS, wrapper->ahb_clks);
>> +       if (ret) {
>> +               dev_err(dev, "Err getting AHB clks %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       mutex_init(&wrapper->lock);
>> +       dev_set_drvdata(dev, wrapper);
>> +       dev_dbg(dev, "GENI SE Driver probed\n");
>> +       return devm_of_platform_populate(dev);
>> +}
>> +
>> +static int geni_se_remove(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct geni_wrapper *wrapper = dev_get_drvdata(dev);
>> +
>> +       kfree(wrapper->clk_perf_tbl);
> 
> Why not devm_kzalloc() this?
I will check it.
> 
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id geni_se_dt_match[] = {
>> +       { .compatible = "qcom,geni-se-qup", },
>> +       {}
>> +};
>> +MODULE_DEVICE_TABLE(of, geni_se_dt_match);
>> +
>> +static struct platform_driver geni_se_driver = {
>> +       .driver = {
>> +               .name = "geni_se_qup",
>> +               .of_match_table = geni_se_dt_match,
>> +       },
>> +       .probe = geni_se_probe,
>> +       .remove = geni_se_remove,
>> +};
>> +module_platform_driver(geni_se_driver);
>> +
>> +MODULE_DESCRIPTION("GENI Serial Engine Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
>> new file mode 100644
>> index 0000000..4996de7
>> --- /dev/null
>> +++ b/include/linux/qcom-geni-se.h
>> @@ -0,0 +1,247 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/*
>> + * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef _LINUX_QCOM_GENI_SE
>> +#define _LINUX_QCOM_GENI_SE
>> +#include <linux/clk.h>
> 
> Please forward declare struct clk and drop this include here.
Ok.
> 
>> +#include <linux/dma-direction.h>
> 
> Drop?
There was a map function which got dropped in v3 patch series. I will 
drop including this header file.
> 
>> +
>> +/* Transfer mode supported by GENI Serial Engines */
>> +enum geni_se_xfer_mode {
>> +       GENI_SE_INVALID,
>> +       GENI_SE_FIFO,
>> +       GENI_SE_DMA,
>> +};
>> +
>> +/* Protocols supported by GENI Serial Engines */
>> +enum geni_se_protocol_types {
>> +       GENI_SE_NONE,
>> +       GENI_SE_SPI,
>> +       GENI_SE_UART,
>> +       GENI_SE_I2C,
>> +       GENI_SE_I3C,
>> +};
>> +
>> +/**
>> + * struct geni_se - GENI Serial Engine
>> + * @base:              Base Address of the Serial Engine's register block.
>> + * @dev:               Pointer to the Serial Engine device.
>> + * @wrapper:           Pointer to the parent QUP Wrapper core.
>> + * @clk:               Handle to the core serial engine clock.
>> + */
>> +struct geni_se {
>> +       void __iomem *base;
>> +       struct device *dev;
>> +       void *wrapper;
> 
> Can this get the geni_wrapper type? It could be opaque if you like.
I am not sure if it is ok to have the children know the details of the 
parent. That is why it is kept as opaque.
> 
>> +       struct clk *clk;
>> +};
>> +
Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
