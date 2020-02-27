Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A20AC4BA06
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 06:28:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5033C24683
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 06:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="YZ22QCnR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgB0G2V (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 01:28:21 -0500
Received: from mail-eopbgr60052.outbound.protection.outlook.com ([40.107.6.52]:50496
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725906AbgB0G2V (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 27 Feb 2020 01:28:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3VoPpeab+YsjyCZhcxd+jqU0JrdQaN9vGKtsvTBv90+xY3lUd9eoeySx2edf7LwvzTsoH8jDocHKGPc6XwWrhqQ/pFDKfJETPteCMdxo/t7TaaykbK55Mv5cJxSWaoKCkxQsyEUFw2VrdSAqVzlxGqPz03G7sXoRpOb/MChp6muC3eDsUYaqhnfxEgka0QozxcGoxTFCBzouTFrIGzgTTz9VLWfWivjLuFTBq2r0Salyy6BQtJH9HINo88PhEZACfoMnIyXYwXVuV7QkcY1yi7Vh4Lct2R1GjO+HTXtHpCGqRwIGYf+QgCxDdc1G6q3EjbsZILrZZ1Hbh22boRZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJ7SCE2oYp9NvSQ8W/h12zW8xyyQ+1uOiveVXXgH/Tc=;
 b=SGqSnc+pwTlxPGYk1eR4b5eSzp8myVptbiyWrZa8ZoJVnmyIkeT8A2AhlQvTg0sE9pG8/DqwgSvr756pHST7zB2yH/6Do3gVKXAIbMcl+TFLbhCdr/1bCNiVHikCtzMd++kzfI+5QKUk+WAyv/DDTEHTLCEY/WuwEk0JWWvxEQmKs22yhixaHiZqsoyiEayqsj9OAEbUeYparBFwgG8J1Cy9FYHnak0yIJ9q/6KYOnHCRSmMqH4ZPMZeTyPFK8uY3/arNpB/oVicCBT1bv78sZi1G+2LAQgybm2S/tCO3ohFsNXFx3R4jTqZprdTljlj3EG44q3bjvV7aW/OGVFeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJ7SCE2oYp9NvSQ8W/h12zW8xyyQ+1uOiveVXXgH/Tc=;
 b=YZ22QCnRZP9CLg1kcwQSdxiz3QNxXDz20O2KW60b6aO5B6cFKBAkXtmvJegjbG5vpKl/Zvl6cnUzUMi5aAq3uoZO4tYm6PcJMH5pHau+6ywT1T/6daeQdybTFYWQ0lfmu+fm/uHobjPXTH8TyKCAZn2tRGgnYEZWosiyq7HBwwc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4653.eurprd04.prod.outlook.com (20.177.56.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Thu, 27 Feb 2020 06:28:14 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2750.021; Thu, 27 Feb 2020
 06:28:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     kishon@ti.com, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, aniljoy@cadence.com,
        jun.li@nxp.com, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/2] phy: cadence: salvo: add salvo phy driver
Date:   Thu, 27 Feb 2020 14:27:53 +0800
Message-Id: <20200227062754.19131-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25)
 To VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend Transport; Thu, 27 Feb 2020 06:28:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a8220a54-a475-45f2-25cc-08d7bb4e396f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4653:|VI1PR04MB4653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB465340FB757335BA02A4408D8BEB0@VI1PR04MB4653.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(199004)(189003)(86362001)(5660300002)(16526019)(186003)(26005)(6506007)(30864003)(44832011)(36756003)(6512007)(6486002)(52116002)(1076003)(66946007)(66476007)(2616005)(956004)(81156014)(81166006)(8676002)(478600001)(6666004)(8936002)(4326008)(316002)(2906002)(66556008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4653;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hNDBtu379OrbPckJ1/XEBgy8CIrYUcmEaWQpwNcz8K9ZTjRYrc8AxXkEVSgFBM4nYwGo2VjTT78Gd7DuoVw3yWxC+lZRQnYRtVJyoITT+hSUCL8DE9N9N6+VdmYbfZyu3s2vfeYL24LZ8KG1916L7KJR36o2KWIpxXQjmNwaXICKl1opbkZeXddkvVnx7a9tPXF5vzat05CmdwhDifmE/Zfo0uq0BaAZgY7Hu+uh+qc/V25WJGZfcV8pTKG0+ic2lXSam+sDraJM7nWmQNtpGmuxYpfSqKp2lXLE5gqPP/xUDOY++kbttoz/mjrokpL9HheFMyZbej/KdMnduGKXR7q0m8iM7sqCrgmy+ZjxoMzRulVEj0vOUk7wjzw9VmkMyCuTbOxRY8YwiC0tH3uBuBcJYlwLLoHlEPqZBMG1wPuHpHwqfJ8206JEl5M855cy
X-MS-Exchange-AntiSpam-MessageData: Y2zpk/Pxfc9viHMHEnfheYhB0CmervzcvihQ9uM/sxw1UIu27uZyuHZQeXEeVZ40/2fL9Oz7K0KwPS2hDWI2KnMXUj+bgP5kpcMvt0XR3/2Hs6Brfto7XbNkFq3IeeQ4Y2L/BeOs7YYPpyhT4VOLrA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8220a54-a475-45f2-25cc-08d7bb4e396f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2020 06:28:14.5540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMCeGujKAZPxgAfvFthVSVyMIU+Wx1b0T3oOOq0jOQIGOxp7VM3lkNeyZ+4jQN8F0c7jxVCFphtlFRFZUXNhFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4653
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Cadence SALVO PHY is a 28nm product, and is only used for USB3 & USB2.
According to the Cadence, this PHY is a legacy Module, and Sierra and
Torrent are later evolutions from it, and their sequence overlap is
minimal, meaning we cannot reuse either (Sierra & Torrent) of the PHY
drivers.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/phy/cadence/Kconfig             |   9 +
 drivers/phy/cadence/Makefile            |   1 +
 drivers/phy/cadence/phy-cadence-salvo.c | 316 ++++++++++++++++++++++++
 3 files changed, 326 insertions(+)
 create mode 100644 drivers/phy/cadence/phy-cadence-salvo.c

diff --git a/drivers/phy/cadence/Kconfig b/drivers/phy/cadence/Kconfig
index b2db916db64b..eca272b227b7 100644
--- a/drivers/phy/cadence/Kconfig
+++ b/drivers/phy/cadence/Kconfig
@@ -27,3 +27,12 @@ config PHY_CADENCE_SIERRA
 	select GENERIC_PHY
 	help
 	  Enable this to support the Cadence Sierra PHY driver
+
+config PHY_CADENCE_SALVO
+	tristate "Cadence Salvo PHY Driver"
+	depends on OF && HAS_IOMEM
+	select GENERIC_PHY
+	help
+	  Enable this to support the Cadence SALVO PHY driver,
+	  this PHY is a legacy PHY, and only are used for USB3
+	  and USB2.
diff --git a/drivers/phy/cadence/Makefile b/drivers/phy/cadence/Makefile
index 8f89560f1711..7c7d13c0c647 100644
--- a/drivers/phy/cadence/Makefile
+++ b/drivers/phy/cadence/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_PHY_CADENCE_DP)	+= phy-cadence-dp.o
 obj-$(CONFIG_PHY_CADENCE_DPHY)	+= cdns-dphy.o
 obj-$(CONFIG_PHY_CADENCE_SIERRA)	+= phy-cadence-sierra.o
+obj-$(CONFIG_PHY_CADENCE_SALVO)	+= phy-cadence-salvo.o
diff --git a/drivers/phy/cadence/phy-cadence-salvo.c b/drivers/phy/cadence/phy-cadence-salvo.c
new file mode 100644
index 000000000000..fa666527356d
--- /dev/null
+++ b/drivers/phy/cadence/phy-cadence-salvo.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Salvo PHY is a 28nm PHY, it is a legacy PHY, and only
+ * for USB3 and USB2.
+ *
+ * Copyright (c) 2019-2020 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/delay.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+
+/* PHY register definition */
+#define PHY_PMA_CMN_CTRL1			0xC800
+#define TB_ADDR_CMN_DIAG_HSCLK_SEL		0x01e0
+#define TB_ADDR_CMN_PLL0_VCOCAL_INIT_TMR	0x0084
+#define TB_ADDR_CMN_PLL0_VCOCAL_ITER_TMR	0x0085
+#define TB_ADDR_CMN_PLL0_INTDIV	                0x0094
+#define TB_ADDR_CMN_PLL0_FRACDIV		0x0095
+#define TB_ADDR_CMN_PLL0_HIGH_THR		0x0096
+#define TB_ADDR_CMN_PLL0_SS_CTRL1		0x0098
+#define TB_ADDR_CMN_PLL0_SS_CTRL2		0x0099
+#define TB_ADDR_CMN_PLL0_DSM_DIAG		0x0097
+#define TB_ADDR_CMN_DIAG_PLL0_OVRD		0x01c2
+#define TB_ADDR_CMN_DIAG_PLL0_FBH_OVRD		0x01c0
+#define TB_ADDR_CMN_DIAG_PLL0_FBL_OVRD		0x01c1
+#define TB_ADDR_CMN_DIAG_PLL0_V2I_TUNE          0x01C5
+#define TB_ADDR_CMN_DIAG_PLL0_CP_TUNE           0x01C6
+#define TB_ADDR_CMN_DIAG_PLL0_LF_PROG           0x01C7
+#define TB_ADDR_CMN_DIAG_PLL0_TEST_MODE		0x01c4
+#define TB_ADDR_CMN_PSM_CLK_CTRL		0x0061
+#define TB_ADDR_XCVR_DIAG_RX_LANE_CAL_RST_TMR	0x40ea
+#define TB_ADDR_XCVR_PSM_RCTRL	                0x4001
+#define TB_ADDR_TX_PSC_A0		        0x4100
+#define TB_ADDR_TX_PSC_A1		        0x4101
+#define TB_ADDR_TX_PSC_A2		        0x4102
+#define TB_ADDR_TX_PSC_A3		        0x4103
+#define TB_ADDR_TX_DIAG_ECTRL_OVRD		0x41f5
+#define TB_ADDR_TX_PSC_CAL		        0x4106
+#define TB_ADDR_TX_PSC_RDY		        0x4107
+#define TB_ADDR_RX_PSC_A0	                0x8000
+#define TB_ADDR_RX_PSC_A1	                0x8001
+#define TB_ADDR_RX_PSC_A2	                0x8002
+#define TB_ADDR_RX_PSC_A3	                0x8003
+#define TB_ADDR_RX_PSC_CAL	                0x8006
+#define TB_ADDR_RX_PSC_RDY	                0x8007
+#define TB_ADDR_TX_TXCC_MGNLS_MULT_000		0x4058
+#define TB_ADDR_TX_DIAG_BGREF_PREDRV_DELAY	0x41e7
+#define TB_ADDR_RX_SLC_CU_ITER_TMR		0x80e3
+#define TB_ADDR_RX_SIGDET_HL_FILT_TMR		0x8090
+#define TB_ADDR_RX_SAMP_DAC_CTRL		0x8058
+#define TB_ADDR_RX_DIAG_SIGDET_TUNE		0x81dc
+#define TB_ADDR_RX_DIAG_LFPSDET_TUNE2		0x81df
+#define TB_ADDR_RX_DIAG_BS_TM	                0x81f5
+#define TB_ADDR_RX_DIAG_DFE_CTRL1		0x81d3
+#define TB_ADDR_RX_DIAG_ILL_IQE_TRIM4		0x81c7
+#define TB_ADDR_RX_DIAG_ILL_E_TRIM0		0x81c2
+#define TB_ADDR_RX_DIAG_ILL_IQ_TRIM0		0x81c1
+#define TB_ADDR_RX_DIAG_ILL_IQE_TRIM6		0x81c9
+#define TB_ADDR_RX_DIAG_RXFE_TM3		0x81f8
+#define TB_ADDR_RX_DIAG_RXFE_TM4		0x81f9
+#define TB_ADDR_RX_DIAG_LFPSDET_TUNE		0x81dd
+#define TB_ADDR_RX_DIAG_DFE_CTRL3		0x81d5
+#define TB_ADDR_RX_DIAG_SC2C_DELAY		0x81e1
+#define TB_ADDR_RX_REE_VGA_GAIN_NODFE		0x81bf
+#define TB_ADDR_XCVR_PSM_CAL_TMR		0x4002
+#define TB_ADDR_XCVR_PSM_A0BYP_TMR		0x4004
+#define TB_ADDR_XCVR_PSM_A0IN_TMR		0x4003
+#define TB_ADDR_XCVR_PSM_A1IN_TMR		0x4005
+#define TB_ADDR_XCVR_PSM_A2IN_TMR		0x4006
+#define TB_ADDR_XCVR_PSM_A3IN_TMR		0x4007
+#define TB_ADDR_XCVR_PSM_A4IN_TMR		0x4008
+#define TB_ADDR_XCVR_PSM_A5IN_TMR		0x4009
+#define TB_ADDR_XCVR_PSM_A0OUT_TMR		0x400a
+#define TB_ADDR_XCVR_PSM_A1OUT_TMR		0x400b
+#define TB_ADDR_XCVR_PSM_A2OUT_TMR		0x400c
+#define TB_ADDR_XCVR_PSM_A3OUT_TMR		0x400d
+#define TB_ADDR_XCVR_PSM_A4OUT_TMR		0x400e
+#define TB_ADDR_XCVR_PSM_A5OUT_TMR		0x400f
+#define TB_ADDR_TX_RCVDET_EN_TMR	        0x4122
+#define TB_ADDR_TX_RCVDET_ST_TMR	        0x4123
+#define TB_ADDR_XCVR_DIAG_LANE_FCM_EN_MGN_TMR	0x40f2
+#define TB_ADDR_TX_RCVDETSC_CTRL	        0x4124
+
+/* TB_ADDR_TX_RCVDETSC_CTRL */
+#define RXDET_IN_P3_32KHZ			BIT(1)
+
+struct cdns_reg_pairs {
+	u16 val;
+	u32 off;
+};
+
+struct cdns_salvo_data {
+	u8 reg_offset_shift;
+	struct cdns_reg_pairs *init_sequence_val;
+	u8 init_sequence_length;
+};
+
+struct cdns_salvo_phy {
+	struct phy *phy;
+	struct clk *clk;
+	void __iomem *base;
+	struct cdns_salvo_data *data;
+};
+
+static const struct of_device_id cdns_salvo_phy_of_match[];
+static u16 cdns_salvo_read(struct cdns_salvo_phy *salvo_phy, u32 reg)
+{
+	return (u16)readl(salvo_phy->base +
+		reg * (1 << salvo_phy->data->reg_offset_shift));
+}
+
+static void cdns_salvo_write(struct cdns_salvo_phy *salvo_phy,
+		u32 reg, u16 val)
+{
+	writel(val, salvo_phy->base +
+		reg * (1 << salvo_phy->data->reg_offset_shift));
+}
+
+/*
+ * Below bringup sequence pair are from Cadence PHY's User Guide
+ * and NXP platform tuning results.
+ */
+static struct cdns_reg_pairs cdns_nxp_sequence_pair[] = {
+	{0x0830, PHY_PMA_CMN_CTRL1},
+	{0x0010, TB_ADDR_CMN_DIAG_HSCLK_SEL},
+	{0x00f0, TB_ADDR_CMN_PLL0_VCOCAL_INIT_TMR},
+	{0x0018, TB_ADDR_CMN_PLL0_VCOCAL_ITER_TMR},
+	{0x00d0, TB_ADDR_CMN_PLL0_INTDIV},
+	{0x4aaa, TB_ADDR_CMN_PLL0_FRACDIV},
+	{0x0034, TB_ADDR_CMN_PLL0_HIGH_THR},
+	{0x01ee, TB_ADDR_CMN_PLL0_SS_CTRL1},
+	{0x7f03, TB_ADDR_CMN_PLL0_SS_CTRL2},
+	{0x0020, TB_ADDR_CMN_PLL0_DSM_DIAG},
+	{0x0000, TB_ADDR_CMN_DIAG_PLL0_OVRD},
+	{0x0000, TB_ADDR_CMN_DIAG_PLL0_FBH_OVRD},
+	{0x0000, TB_ADDR_CMN_DIAG_PLL0_FBL_OVRD},
+	{0x0007, TB_ADDR_CMN_DIAG_PLL0_V2I_TUNE},
+	{0x0027, TB_ADDR_CMN_DIAG_PLL0_CP_TUNE},
+	{0x0008, TB_ADDR_CMN_DIAG_PLL0_LF_PROG},
+	{0x0022, TB_ADDR_CMN_DIAG_PLL0_TEST_MODE},
+	{0x000a, TB_ADDR_CMN_PSM_CLK_CTRL},
+	{0x0139, TB_ADDR_XCVR_DIAG_RX_LANE_CAL_RST_TMR},
+	{0xbefc, TB_ADDR_XCVR_PSM_RCTRL},
+
+	{0x7799, TB_ADDR_TX_PSC_A0},
+	{0x7798, TB_ADDR_TX_PSC_A1},
+	{0x509b, TB_ADDR_TX_PSC_A2},
+	{0x0003, TB_ADDR_TX_DIAG_ECTRL_OVRD},
+	{0x509b, TB_ADDR_TX_PSC_A3},
+	{0x2090, TB_ADDR_TX_PSC_CAL},
+	{0x2090, TB_ADDR_TX_PSC_RDY},
+
+	{0xA6FD, TB_ADDR_RX_PSC_A0},
+	{0xA6FD, TB_ADDR_RX_PSC_A1},
+	{0xA410, TB_ADDR_RX_PSC_A2},
+	{0x2410, TB_ADDR_RX_PSC_A3},
+
+	{0x23FF, TB_ADDR_RX_PSC_CAL},
+	{0x2010, TB_ADDR_RX_PSC_RDY},
+
+	{0x0020, TB_ADDR_TX_TXCC_MGNLS_MULT_000},
+	{0x00ff, TB_ADDR_TX_DIAG_BGREF_PREDRV_DELAY},
+	{0x0002, TB_ADDR_RX_SLC_CU_ITER_TMR},
+	{0x0013, TB_ADDR_RX_SIGDET_HL_FILT_TMR},
+	{0x0000, TB_ADDR_RX_SAMP_DAC_CTRL},
+	{0x1004, TB_ADDR_RX_DIAG_SIGDET_TUNE},
+	{0x4041, TB_ADDR_RX_DIAG_LFPSDET_TUNE2},
+	{0x0480, TB_ADDR_RX_DIAG_BS_TM},
+	{0x8006, TB_ADDR_RX_DIAG_DFE_CTRL1},
+	{0x003f, TB_ADDR_RX_DIAG_ILL_IQE_TRIM4},
+	{0x543f, TB_ADDR_RX_DIAG_ILL_E_TRIM0},
+	{0x543f, TB_ADDR_RX_DIAG_ILL_IQ_TRIM0},
+	{0x0000, TB_ADDR_RX_DIAG_ILL_IQE_TRIM6},
+	{0x8000, TB_ADDR_RX_DIAG_RXFE_TM3},
+	{0x0003, TB_ADDR_RX_DIAG_RXFE_TM4},
+	{0x2408, TB_ADDR_RX_DIAG_LFPSDET_TUNE},
+	{0x05ca, TB_ADDR_RX_DIAG_DFE_CTRL3},
+	{0x0258, TB_ADDR_RX_DIAG_SC2C_DELAY},
+	{0x1fff, TB_ADDR_RX_REE_VGA_GAIN_NODFE},
+
+	{0x02c6, TB_ADDR_XCVR_PSM_CAL_TMR},
+	{0x0002, TB_ADDR_XCVR_PSM_A0BYP_TMR},
+	{0x02c6, TB_ADDR_XCVR_PSM_A0IN_TMR},
+	{0x0010, TB_ADDR_XCVR_PSM_A1IN_TMR},
+	{0x0010, TB_ADDR_XCVR_PSM_A2IN_TMR},
+	{0x0010, TB_ADDR_XCVR_PSM_A3IN_TMR},
+	{0x0010, TB_ADDR_XCVR_PSM_A4IN_TMR},
+	{0x0010, TB_ADDR_XCVR_PSM_A5IN_TMR},
+
+	{0x0002, TB_ADDR_XCVR_PSM_A0OUT_TMR},
+	{0x0002, TB_ADDR_XCVR_PSM_A1OUT_TMR},
+	{0x0002, TB_ADDR_XCVR_PSM_A2OUT_TMR},
+	{0x0002, TB_ADDR_XCVR_PSM_A3OUT_TMR},
+	{0x0002, TB_ADDR_XCVR_PSM_A4OUT_TMR},
+	{0x0002, TB_ADDR_XCVR_PSM_A5OUT_TMR},
+	/* Change rx detect parameter */
+	{0x0960, TB_ADDR_TX_RCVDET_EN_TMR},
+	{0x01e0, TB_ADDR_TX_RCVDET_ST_TMR},
+	{0x0090, TB_ADDR_XCVR_DIAG_LANE_FCM_EN_MGN_TMR},
+};
+
+
+static int cdns_salvo_phy_power_on(struct phy *phy)
+{
+	struct cdns_salvo_phy *salvo_phy = phy_get_drvdata(phy);
+	struct cdns_salvo_data *data = salvo_phy->data;
+	int ret, i;
+	u16 value;
+
+	ret = clk_prepare_enable(salvo_phy->clk);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < data->init_sequence_length; i++) {
+		struct cdns_reg_pairs *reg_pair = data->init_sequence_val + i;
+
+		cdns_salvo_write(salvo_phy, reg_pair->off, reg_pair->val);
+	}
+
+	/* RXDET_IN_P3_32KHZ, Receiver detect slow clock enable */
+	value = cdns_salvo_read(salvo_phy, TB_ADDR_TX_RCVDETSC_CTRL);
+	value |= RXDET_IN_P3_32KHZ;
+	cdns_salvo_write(salvo_phy, TB_ADDR_TX_RCVDETSC_CTRL,
+			RXDET_IN_P3_32KHZ);
+
+	udelay(10);
+
+	return ret;
+}
+
+static int cdns_salvo_phy_power_off(struct phy *phy)
+{
+	struct cdns_salvo_phy *salvo_phy = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(salvo_phy->clk);
+
+	return 0;
+}
+
+static struct phy_ops cdns_salvo_phy_ops = {
+	.power_on	= cdns_salvo_phy_power_on,
+	.power_off	= cdns_salvo_phy_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static int cdns_salvo_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct cdns_salvo_phy *salvo_phy;
+	struct resource *res;
+	const struct of_device_id *match;
+	struct cdns_salvo_data *data;
+
+	match = of_match_device(cdns_salvo_phy_of_match, dev);
+	if (!match)
+		return -EINVAL;
+
+	data = (struct cdns_salvo_data *)match->data;
+	salvo_phy = devm_kzalloc(dev, sizeof(*salvo_phy), GFP_KERNEL);
+	if (!salvo_phy)
+		return -ENOMEM;
+
+	salvo_phy->data = data;
+	salvo_phy->clk = devm_clk_get_optional(dev, "salvo_phy_clk");
+	if (IS_ERR(salvo_phy->clk))
+		return PTR_ERR(salvo_phy->clk);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	salvo_phy->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(salvo_phy->base))
+		return PTR_ERR(salvo_phy->base);
+
+	salvo_phy->phy = devm_phy_create(dev, NULL, &cdns_salvo_phy_ops);
+	if (IS_ERR(salvo_phy->phy))
+		return PTR_ERR(salvo_phy->phy);
+
+	phy_set_drvdata(salvo_phy->phy, salvo_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct cdns_salvo_data cdns_nxp_salvo_data = {
+	2,
+	cdns_nxp_sequence_pair,
+	ARRAY_SIZE(cdns_nxp_sequence_pair),
+};
+
+static const struct of_device_id cdns_salvo_phy_of_match[] = {
+	{
+		.compatible = "nxp,salvo-phy",
+		.data = &cdns_nxp_salvo_data,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, cdns_salvo_phy_of_match);
+
+static struct platform_driver cdns_salvo_phy_driver = {
+	.probe	= cdns_salvo_phy_probe,
+	.driver = {
+		.name	= "cdns-salvo-phy",
+		.of_match_table	= cdns_salvo_phy_of_match,
+	}
+};
+module_platform_driver(cdns_salvo_phy_driver);
+
+MODULE_AUTHOR("Peter Chen <peter.chen@nxp.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Cadence SALVO PHY Driver");
-- 
2.17.1

