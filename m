Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E610EC2BB1D
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 11:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEE94206E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 11:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PEFvEniF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgCMLLE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 07:11:04 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45992 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbgCMLLD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Mar 2020 07:11:03 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02DBAwcg116563;
        Fri, 13 Mar 2020 06:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584097858;
        bh=sJFt24S9nyZn/OcvEed5MuhzZXLXYk43H3d4DOhzcIg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PEFvEniFPdY8WeQ+/5qi5B24O5seYNBjDjUVP0UDWFBu6OztYc75hVeDe2KPxas9R
         70hkF0Tfx1KSHM5xMrJV3dgosFr0ULJhY8ZepBMiC+W8WuCNmln8ZS2TBVswGSeQbf
         Vh8Y2NSw3rO6YNCnS8LLmUmdpJ3cqca0fq4zws5M=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02DBAwwt079753
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Mar 2020 06:10:58 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Mar 2020 06:10:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Mar 2020 06:10:58 -0500
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02DBAtbS108801;
        Fri, 13 Mar 2020 06:10:55 -0500
Subject: Re: [PATCH 1/2] phy: cadence: salvo: add salvo phy driver
To:     Peter Chen <peter.chen@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "aniljoy@cadence.com" <aniljoy@cadence.com>,
        Jun Li <jun.li@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20200227062754.19131-1-peter.chen@nxp.com>
 <VI1PR04MB5327384B8FE2CC716FDFFFD78BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <42ffb1db-2aaa-0a68-5bc5-b69cd1edc9e9@ti.com>
Date:   Fri, 13 Mar 2020 16:45:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB5327384B8FE2CC716FDFFFD78BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Peter,

On 12/03/20 3:46 pm, Peter Chen wrote:
>  
>>
>> Cadence SALVO PHY is a 28nm product, and is only used for USB3 & USB2.
>> According to the Cadence, this PHY is a legacy Module, and Sierra and Torrent are
>> later evolutions from it, and their sequence overlap is minimal, meaning we cannot
>> reuse either (Sierra & Torrent) of the PHY drivers.
>>
>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> 
> A gentle ping...

I need Ack from Rob on the dt-binding to merge this.

Thanks
Kishon

> 
> Peter
> 
>> ---
>>  drivers/phy/cadence/Kconfig             |   9 +
>>  drivers/phy/cadence/Makefile            |   1 +
>>  drivers/phy/cadence/phy-cadence-salvo.c | 316 ++++++++++++++++++++++++
>>  3 files changed, 326 insertions(+)
>>  create mode 100644 drivers/phy/cadence/phy-cadence-salvo.c
>>
>> diff --git a/drivers/phy/cadence/Kconfig b/drivers/phy/cadence/Kconfig index
>> b2db916db64b..eca272b227b7 100644
>> --- a/drivers/phy/cadence/Kconfig
>> +++ b/drivers/phy/cadence/Kconfig
>> @@ -27,3 +27,12 @@ config PHY_CADENCE_SIERRA
>>  	select GENERIC_PHY
>>  	help
>>  	  Enable this to support the Cadence Sierra PHY driver
>> +
>> +config PHY_CADENCE_SALVO
>> +	tristate "Cadence Salvo PHY Driver"
>> +	depends on OF && HAS_IOMEM
>> +	select GENERIC_PHY
>> +	help
>> +	  Enable this to support the Cadence SALVO PHY driver,
>> +	  this PHY is a legacy PHY, and only are used for USB3
>> +	  and USB2.
>> diff --git a/drivers/phy/cadence/Makefile b/drivers/phy/cadence/Makefile index
>> 8f89560f1711..7c7d13c0c647 100644
>> --- a/drivers/phy/cadence/Makefile
>> +++ b/drivers/phy/cadence/Makefile
>> @@ -2,3 +2,4 @@
>>  obj-$(CONFIG_PHY_CADENCE_DP)	+= phy-cadence-dp.o
>>  obj-$(CONFIG_PHY_CADENCE_DPHY)	+= cdns-dphy.o
>>  obj-$(CONFIG_PHY_CADENCE_SIERRA)	+= phy-cadence-sierra.o
>> +obj-$(CONFIG_PHY_CADENCE_SALVO)	+= phy-cadence-salvo.o
>> diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-
>> cadence-salvo.c
>> new file mode 100644
>> index 000000000000..fa666527356d
>> --- /dev/null
>> +++ b/drivers/phy/cadence/phy-cadence-salvo.c
>> @@ -0,0 +1,316 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Salvo PHY is a 28nm PHY, it is a legacy PHY, and only
>> + * for USB3 and USB2.
>> + *
>> + * Copyright (c) 2019-2020 NXP
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/delay.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +
>> +/* PHY register definition */
>> +#define PHY_PMA_CMN_CTRL1			0xC800
>> +#define TB_ADDR_CMN_DIAG_HSCLK_SEL		0x01e0
>> +#define TB_ADDR_CMN_PLL0_VCOCAL_INIT_TMR	0x0084
>> +#define TB_ADDR_CMN_PLL0_VCOCAL_ITER_TMR	0x0085
>> +#define TB_ADDR_CMN_PLL0_INTDIV	                0x0094
>> +#define TB_ADDR_CMN_PLL0_FRACDIV		0x0095
>> +#define TB_ADDR_CMN_PLL0_HIGH_THR		0x0096
>> +#define TB_ADDR_CMN_PLL0_SS_CTRL1		0x0098
>> +#define TB_ADDR_CMN_PLL0_SS_CTRL2		0x0099
>> +#define TB_ADDR_CMN_PLL0_DSM_DIAG		0x0097
>> +#define TB_ADDR_CMN_DIAG_PLL0_OVRD		0x01c2
>> +#define TB_ADDR_CMN_DIAG_PLL0_FBH_OVRD		0x01c0
>> +#define TB_ADDR_CMN_DIAG_PLL0_FBL_OVRD		0x01c1
>> +#define TB_ADDR_CMN_DIAG_PLL0_V2I_TUNE          0x01C5
>> +#define TB_ADDR_CMN_DIAG_PLL0_CP_TUNE           0x01C6
>> +#define TB_ADDR_CMN_DIAG_PLL0_LF_PROG           0x01C7
>> +#define TB_ADDR_CMN_DIAG_PLL0_TEST_MODE		0x01c4
>> +#define TB_ADDR_CMN_PSM_CLK_CTRL		0x0061
>> +#define TB_ADDR_XCVR_DIAG_RX_LANE_CAL_RST_TMR	0x40ea
>> +#define TB_ADDR_XCVR_PSM_RCTRL	                0x4001
>> +#define TB_ADDR_TX_PSC_A0		        0x4100
>> +#define TB_ADDR_TX_PSC_A1		        0x4101
>> +#define TB_ADDR_TX_PSC_A2		        0x4102
>> +#define TB_ADDR_TX_PSC_A3		        0x4103
>> +#define TB_ADDR_TX_DIAG_ECTRL_OVRD		0x41f5
>> +#define TB_ADDR_TX_PSC_CAL		        0x4106
>> +#define TB_ADDR_TX_PSC_RDY		        0x4107
>> +#define TB_ADDR_RX_PSC_A0	                0x8000
>> +#define TB_ADDR_RX_PSC_A1	                0x8001
>> +#define TB_ADDR_RX_PSC_A2	                0x8002
>> +#define TB_ADDR_RX_PSC_A3	                0x8003
>> +#define TB_ADDR_RX_PSC_CAL	                0x8006
>> +#define TB_ADDR_RX_PSC_RDY	                0x8007
>> +#define TB_ADDR_TX_TXCC_MGNLS_MULT_000		0x4058
>> +#define TB_ADDR_TX_DIAG_BGREF_PREDRV_DELAY	0x41e7
>> +#define TB_ADDR_RX_SLC_CU_ITER_TMR		0x80e3
>> +#define TB_ADDR_RX_SIGDET_HL_FILT_TMR		0x8090
>> +#define TB_ADDR_RX_SAMP_DAC_CTRL		0x8058
>> +#define TB_ADDR_RX_DIAG_SIGDET_TUNE		0x81dc
>> +#define TB_ADDR_RX_DIAG_LFPSDET_TUNE2		0x81df
>> +#define TB_ADDR_RX_DIAG_BS_TM	                0x81f5
>> +#define TB_ADDR_RX_DIAG_DFE_CTRL1		0x81d3
>> +#define TB_ADDR_RX_DIAG_ILL_IQE_TRIM4		0x81c7
>> +#define TB_ADDR_RX_DIAG_ILL_E_TRIM0		0x81c2
>> +#define TB_ADDR_RX_DIAG_ILL_IQ_TRIM0		0x81c1
>> +#define TB_ADDR_RX_DIAG_ILL_IQE_TRIM6		0x81c9
>> +#define TB_ADDR_RX_DIAG_RXFE_TM3		0x81f8
>> +#define TB_ADDR_RX_DIAG_RXFE_TM4		0x81f9
>> +#define TB_ADDR_RX_DIAG_LFPSDET_TUNE		0x81dd
>> +#define TB_ADDR_RX_DIAG_DFE_CTRL3		0x81d5
>> +#define TB_ADDR_RX_DIAG_SC2C_DELAY		0x81e1
>> +#define TB_ADDR_RX_REE_VGA_GAIN_NODFE		0x81bf
>> +#define TB_ADDR_XCVR_PSM_CAL_TMR		0x4002
>> +#define TB_ADDR_XCVR_PSM_A0BYP_TMR		0x4004
>> +#define TB_ADDR_XCVR_PSM_A0IN_TMR		0x4003
>> +#define TB_ADDR_XCVR_PSM_A1IN_TMR		0x4005
>> +#define TB_ADDR_XCVR_PSM_A2IN_TMR		0x4006
>> +#define TB_ADDR_XCVR_PSM_A3IN_TMR		0x4007
>> +#define TB_ADDR_XCVR_PSM_A4IN_TMR		0x4008
>> +#define TB_ADDR_XCVR_PSM_A5IN_TMR		0x4009
>> +#define TB_ADDR_XCVR_PSM_A0OUT_TMR		0x400a
>> +#define TB_ADDR_XCVR_PSM_A1OUT_TMR		0x400b
>> +#define TB_ADDR_XCVR_PSM_A2OUT_TMR		0x400c
>> +#define TB_ADDR_XCVR_PSM_A3OUT_TMR		0x400d
>> +#define TB_ADDR_XCVR_PSM_A4OUT_TMR		0x400e
>> +#define TB_ADDR_XCVR_PSM_A5OUT_TMR		0x400f
>> +#define TB_ADDR_TX_RCVDET_EN_TMR	        0x4122
>> +#define TB_ADDR_TX_RCVDET_ST_TMR	        0x4123
>> +#define TB_ADDR_XCVR_DIAG_LANE_FCM_EN_MGN_TMR	0x40f2
>> +#define TB_ADDR_TX_RCVDETSC_CTRL	        0x4124
>> +
>> +/* TB_ADDR_TX_RCVDETSC_CTRL */
>> +#define RXDET_IN_P3_32KHZ			BIT(1)
>> +
>> +struct cdns_reg_pairs {
>> +	u16 val;
>> +	u32 off;
>> +};
>> +
>> +struct cdns_salvo_data {
>> +	u8 reg_offset_shift;
>> +	struct cdns_reg_pairs *init_sequence_val;
>> +	u8 init_sequence_length;
>> +};
>> +
>> +struct cdns_salvo_phy {
>> +	struct phy *phy;
>> +	struct clk *clk;
>> +	void __iomem *base;
>> +	struct cdns_salvo_data *data;
>> +};
>> +
>> +static const struct of_device_id cdns_salvo_phy_of_match[]; static u16
>> +cdns_salvo_read(struct cdns_salvo_phy *salvo_phy, u32 reg) {
>> +	return (u16)readl(salvo_phy->base +
>> +		reg * (1 << salvo_phy->data->reg_offset_shift));
>> +}
>> +
>> +static void cdns_salvo_write(struct cdns_salvo_phy *salvo_phy,
>> +		u32 reg, u16 val)
>> +{
>> +	writel(val, salvo_phy->base +
>> +		reg * (1 << salvo_phy->data->reg_offset_shift));
>> +}
>> +
>> +/*
>> + * Below bringup sequence pair are from Cadence PHY's User Guide
>> + * and NXP platform tuning results.
>> + */
>> +static struct cdns_reg_pairs cdns_nxp_sequence_pair[] = {
>> +	{0x0830, PHY_PMA_CMN_CTRL1},
>> +	{0x0010, TB_ADDR_CMN_DIAG_HSCLK_SEL},
>> +	{0x00f0, TB_ADDR_CMN_PLL0_VCOCAL_INIT_TMR},
>> +	{0x0018, TB_ADDR_CMN_PLL0_VCOCAL_ITER_TMR},
>> +	{0x00d0, TB_ADDR_CMN_PLL0_INTDIV},
>> +	{0x4aaa, TB_ADDR_CMN_PLL0_FRACDIV},
>> +	{0x0034, TB_ADDR_CMN_PLL0_HIGH_THR},
>> +	{0x01ee, TB_ADDR_CMN_PLL0_SS_CTRL1},
>> +	{0x7f03, TB_ADDR_CMN_PLL0_SS_CTRL2},
>> +	{0x0020, TB_ADDR_CMN_PLL0_DSM_DIAG},
>> +	{0x0000, TB_ADDR_CMN_DIAG_PLL0_OVRD},
>> +	{0x0000, TB_ADDR_CMN_DIAG_PLL0_FBH_OVRD},
>> +	{0x0000, TB_ADDR_CMN_DIAG_PLL0_FBL_OVRD},
>> +	{0x0007, TB_ADDR_CMN_DIAG_PLL0_V2I_TUNE},
>> +	{0x0027, TB_ADDR_CMN_DIAG_PLL0_CP_TUNE},
>> +	{0x0008, TB_ADDR_CMN_DIAG_PLL0_LF_PROG},
>> +	{0x0022, TB_ADDR_CMN_DIAG_PLL0_TEST_MODE},
>> +	{0x000a, TB_ADDR_CMN_PSM_CLK_CTRL},
>> +	{0x0139, TB_ADDR_XCVR_DIAG_RX_LANE_CAL_RST_TMR},
>> +	{0xbefc, TB_ADDR_XCVR_PSM_RCTRL},
>> +
>> +	{0x7799, TB_ADDR_TX_PSC_A0},
>> +	{0x7798, TB_ADDR_TX_PSC_A1},
>> +	{0x509b, TB_ADDR_TX_PSC_A2},
>> +	{0x0003, TB_ADDR_TX_DIAG_ECTRL_OVRD},
>> +	{0x509b, TB_ADDR_TX_PSC_A3},
>> +	{0x2090, TB_ADDR_TX_PSC_CAL},
>> +	{0x2090, TB_ADDR_TX_PSC_RDY},
>> +
>> +	{0xA6FD, TB_ADDR_RX_PSC_A0},
>> +	{0xA6FD, TB_ADDR_RX_PSC_A1},
>> +	{0xA410, TB_ADDR_RX_PSC_A2},
>> +	{0x2410, TB_ADDR_RX_PSC_A3},
>> +
>> +	{0x23FF, TB_ADDR_RX_PSC_CAL},
>> +	{0x2010, TB_ADDR_RX_PSC_RDY},
>> +
>> +	{0x0020, TB_ADDR_TX_TXCC_MGNLS_MULT_000},
>> +	{0x00ff, TB_ADDR_TX_DIAG_BGREF_PREDRV_DELAY},
>> +	{0x0002, TB_ADDR_RX_SLC_CU_ITER_TMR},
>> +	{0x0013, TB_ADDR_RX_SIGDET_HL_FILT_TMR},
>> +	{0x0000, TB_ADDR_RX_SAMP_DAC_CTRL},
>> +	{0x1004, TB_ADDR_RX_DIAG_SIGDET_TUNE},
>> +	{0x4041, TB_ADDR_RX_DIAG_LFPSDET_TUNE2},
>> +	{0x0480, TB_ADDR_RX_DIAG_BS_TM},
>> +	{0x8006, TB_ADDR_RX_DIAG_DFE_CTRL1},
>> +	{0x003f, TB_ADDR_RX_DIAG_ILL_IQE_TRIM4},
>> +	{0x543f, TB_ADDR_RX_DIAG_ILL_E_TRIM0},
>> +	{0x543f, TB_ADDR_RX_DIAG_ILL_IQ_TRIM0},
>> +	{0x0000, TB_ADDR_RX_DIAG_ILL_IQE_TRIM6},
>> +	{0x8000, TB_ADDR_RX_DIAG_RXFE_TM3},
>> +	{0x0003, TB_ADDR_RX_DIAG_RXFE_TM4},
>> +	{0x2408, TB_ADDR_RX_DIAG_LFPSDET_TUNE},
>> +	{0x05ca, TB_ADDR_RX_DIAG_DFE_CTRL3},
>> +	{0x0258, TB_ADDR_RX_DIAG_SC2C_DELAY},
>> +	{0x1fff, TB_ADDR_RX_REE_VGA_GAIN_NODFE},
>> +
>> +	{0x02c6, TB_ADDR_XCVR_PSM_CAL_TMR},
>> +	{0x0002, TB_ADDR_XCVR_PSM_A0BYP_TMR},
>> +	{0x02c6, TB_ADDR_XCVR_PSM_A0IN_TMR},
>> +	{0x0010, TB_ADDR_XCVR_PSM_A1IN_TMR},
>> +	{0x0010, TB_ADDR_XCVR_PSM_A2IN_TMR},
>> +	{0x0010, TB_ADDR_XCVR_PSM_A3IN_TMR},
>> +	{0x0010, TB_ADDR_XCVR_PSM_A4IN_TMR},
>> +	{0x0010, TB_ADDR_XCVR_PSM_A5IN_TMR},
>> +
>> +	{0x0002, TB_ADDR_XCVR_PSM_A0OUT_TMR},
>> +	{0x0002, TB_ADDR_XCVR_PSM_A1OUT_TMR},
>> +	{0x0002, TB_ADDR_XCVR_PSM_A2OUT_TMR},
>> +	{0x0002, TB_ADDR_XCVR_PSM_A3OUT_TMR},
>> +	{0x0002, TB_ADDR_XCVR_PSM_A4OUT_TMR},
>> +	{0x0002, TB_ADDR_XCVR_PSM_A5OUT_TMR},
>> +	/* Change rx detect parameter */
>> +	{0x0960, TB_ADDR_TX_RCVDET_EN_TMR},
>> +	{0x01e0, TB_ADDR_TX_RCVDET_ST_TMR},
>> +	{0x0090, TB_ADDR_XCVR_DIAG_LANE_FCM_EN_MGN_TMR},
>> +};
>> +
>> +
>> +static int cdns_salvo_phy_power_on(struct phy *phy) {
>> +	struct cdns_salvo_phy *salvo_phy = phy_get_drvdata(phy);
>> +	struct cdns_salvo_data *data = salvo_phy->data;
>> +	int ret, i;
>> +	u16 value;
>> +
>> +	ret = clk_prepare_enable(salvo_phy->clk);
>> +	if (ret)
>> +		return ret;
>> +
>> +	for (i = 0; i < data->init_sequence_length; i++) {
>> +		struct cdns_reg_pairs *reg_pair = data->init_sequence_val + i;
>> +
>> +		cdns_salvo_write(salvo_phy, reg_pair->off, reg_pair->val);
>> +	}
>> +
>> +	/* RXDET_IN_P3_32KHZ, Receiver detect slow clock enable */
>> +	value = cdns_salvo_read(salvo_phy, TB_ADDR_TX_RCVDETSC_CTRL);
>> +	value |= RXDET_IN_P3_32KHZ;
>> +	cdns_salvo_write(salvo_phy, TB_ADDR_TX_RCVDETSC_CTRL,
>> +			RXDET_IN_P3_32KHZ);
>> +
>> +	udelay(10);
>> +
>> +	return ret;
>> +}
>> +
>> +static int cdns_salvo_phy_power_off(struct phy *phy) {
>> +	struct cdns_salvo_phy *salvo_phy = phy_get_drvdata(phy);
>> +
>> +	clk_disable_unprepare(salvo_phy->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static struct phy_ops cdns_salvo_phy_ops = {
>> +	.power_on	= cdns_salvo_phy_power_on,
>> +	.power_off	= cdns_salvo_phy_power_off,
>> +	.owner		= THIS_MODULE,
>> +};
>> +
>> +static int cdns_salvo_phy_probe(struct platform_device *pdev) {
>> +	struct phy_provider *phy_provider;
>> +	struct device *dev = &pdev->dev;
>> +	struct cdns_salvo_phy *salvo_phy;
>> +	struct resource *res;
>> +	const struct of_device_id *match;
>> +	struct cdns_salvo_data *data;
>> +
>> +	match = of_match_device(cdns_salvo_phy_of_match, dev);
>> +	if (!match)
>> +		return -EINVAL;
>> +
>> +	data = (struct cdns_salvo_data *)match->data;
>> +	salvo_phy = devm_kzalloc(dev, sizeof(*salvo_phy), GFP_KERNEL);
>> +	if (!salvo_phy)
>> +		return -ENOMEM;
>> +
>> +	salvo_phy->data = data;
>> +	salvo_phy->clk = devm_clk_get_optional(dev, "salvo_phy_clk");
>> +	if (IS_ERR(salvo_phy->clk))
>> +		return PTR_ERR(salvo_phy->clk);
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	salvo_phy->base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(salvo_phy->base))
>> +		return PTR_ERR(salvo_phy->base);
>> +
>> +	salvo_phy->phy = devm_phy_create(dev, NULL, &cdns_salvo_phy_ops);
>> +	if (IS_ERR(salvo_phy->phy))
>> +		return PTR_ERR(salvo_phy->phy);
>> +
>> +	phy_set_drvdata(salvo_phy->phy, salvo_phy);
>> +
>> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +	return PTR_ERR_OR_ZERO(phy_provider);
>> +}
>> +
>> +static const struct cdns_salvo_data cdns_nxp_salvo_data = {
>> +	2,
>> +	cdns_nxp_sequence_pair,
>> +	ARRAY_SIZE(cdns_nxp_sequence_pair),
>> +};
>> +
>> +static const struct of_device_id cdns_salvo_phy_of_match[] = {
>> +	{
>> +		.compatible = "nxp,salvo-phy",
>> +		.data = &cdns_nxp_salvo_data,
>> +	},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, cdns_salvo_phy_of_match);
>> +
>> +static struct platform_driver cdns_salvo_phy_driver = {
>> +	.probe	= cdns_salvo_phy_probe,
>> +	.driver = {
>> +		.name	= "cdns-salvo-phy",
>> +		.of_match_table	= cdns_salvo_phy_of_match,
>> +	}
>> +};
>> +module_platform_driver(cdns_salvo_phy_driver);
>> +
>> +MODULE_AUTHOR("Peter Chen <peter.chen@nxp.com>");
>> MODULE_LICENSE("GPL
>> +v2"); MODULE_DESCRIPTION("Cadence SALVO PHY Driver");
>> --
>> 2.17.1
> 
