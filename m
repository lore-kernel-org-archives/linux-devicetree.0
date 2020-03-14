Return-Path: <SRS0=kXhk=5A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CB7C1975A
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 01:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88B2C20773
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 01:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="FQ5KBC2e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgCOBg4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 14 Mar 2020 21:36:56 -0400
Received: from mail-eopbgr150043.outbound.protection.outlook.com ([40.107.15.43]:49025
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726623AbgCOBgy (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 14 Mar 2020 21:36:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/mij8jlwCxCde2cDXcAIhNWCg8xSrTHSE7CFxQlg1CDU5Ue7upvYCtuSkDQT5U2vpLtE9Trhl6ooOFoKSct9qCVrQRsXA4uGQMxj4cS7lUfLoXONFpMQ8r8mAHiWTwBs0hWxEeeeIFOM3VxhQVde14fQQRldgAc4BpTsyxISbhqbIM5JJQVse3CEymHpx8FD28yl/i5a2rIA7eketa/71EyzsV+oQCNkDvax5c3bcFJp8/QRPaTFBE4hSvi3xSn/Zx3ZiCCocvWOk0yGEasPKPxtg8L/jgpiIlsJQbn/KO5D4HfgpWTyFzsuCweHd/UOMqbeyBaZo36egMwAbm2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kHYIlvoJPnSzsbmh9Nehbvkwx7vBxuaCPstzdKUGdc=;
 b=VWClGaFQ2CFc4y8X5DDWrwi02nFbbl8TdVjCvyFs+evPSzqgUmvXOPW9iNHIEKU1Zzxd51SFyWq58o02e2lGMtN7bBaobPWatxOliBEm3JslyggWthfa2qfJuTOMDjBuw2sJKPtlY/m0pMOmDn59/x19dnsiAbpONTWsnXIm47FtLRGk6843mWqCzev0Gvmw9NeGMpxmq81vt5I3JY8jCOvbRfE3fh8188DlL3jm+FIpVGG3LGFoR9XB6AKl4tIkv9o9P1+ZBwW0zWt5515/fmz/TbkSejmozYIizMoUvTYm8gsGKPlqGaUS2jo1jQEh1ij1KLz11SktzzbsJkMhXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kHYIlvoJPnSzsbmh9Nehbvkwx7vBxuaCPstzdKUGdc=;
 b=FQ5KBC2ecAYi5+1C+qHa5u41863INuCT2vp1nnMJD3OXM+KZEnJaPCDXkiThHExkkP0hJQminMQaF9g3Gg41byPe+bA39wp2QMgMPidvzIwkmZRYyTVlGRf/HpMDDSIqZ1dkvFJUs6wiQ7cVlN92OnfUKg6UUMQiBFhz12Q7nFE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5070.eurprd04.prod.outlook.com (20.177.49.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15; Sat, 14 Mar 2020 09:39:58 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2793.018; Sat, 14 Mar 2020
 09:39:58 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     robh+dt@kernel.org, kishon@ti.com
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com, linux-imx@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/2] phy: cadence: salvo: add salvo phy driver
Date:   Sat, 14 Mar 2020 17:39:40 +0800
Message-Id: <20200314093941.2533-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.13 via Frontend Transport; Sat, 14 Mar 2020 09:39:55 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41d96708-546e-4738-bf65-08d7c7fba890
X-MS-TrafficTypeDiagnostic: VI1PR04MB5070:|VI1PR04MB5070:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5070F508289BAA8AFCF5C8138BFB0@VI1PR04MB5070.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 034215E98F
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(199004)(66476007)(316002)(26005)(478600001)(16526019)(66556008)(186003)(66946007)(44832011)(36756003)(6512007)(2616005)(81166006)(956004)(81156014)(8676002)(4326008)(6486002)(8936002)(5660300002)(30864003)(52116002)(6506007)(2906002)(6666004)(1076003)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5070;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fn02sIJOCk4IPxuZdtO+O8avibwGyXt3p55vZDzXuxbsb/+FCy9J8+kobwNPOsNBOnlwpD0S65SgUkIZeOsPpADPQk71zg3eVKg28hfcciVFeyCLNo78ZWKuz2WqdiZkkHIkrbDfsGip5jh9abeIybSgOYHP8rysRRADv02vhXvBK9TX/dO1rC3uhFnbUcK2QydvcynYKV4uodzLWfaYESBaGwpw3gq7mHzhqmOI+4tcquqHEhrDFNzBCRLnjTGIITaFPsGjLYas1JWoNGfRGK5YOx8HsvtFBZpVgF9R5PzFVkrMQzEN7M/WJd3T1qPJYE5XT1muSFlTP/Oeh3cAF8wGF88dJtoY41U6hideMLxoNGrprQki011pobVbB8plIhjABhhf4t+BZWBaJudXMPLKt2+vc49TbFAYO405aNLgmHaMchYRtIvLuyzfN7+4
X-MS-Exchange-AntiSpam-MessageData: 6tB0sRQby3joWo1NqWUjpYTM7f7MYg4FeTQTtodhc3V8TUL0tp4vV7Yfa2RojnfQid8lyQZLVOUA+DDNwONILcd3wOCNAq47LBsJ+mqd04bq0GqQ1RGN5W5umsiEJ02/JXFKADq1gTOQvJ1LFxu2bQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d96708-546e-4738-bf65-08d7c7fba890
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2020 09:39:58.0368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAYhwdrMpyx7H4AG8BbO1ka0VvaIp/P2fDe503QfhnTkK5tzhSKT9ZPkkh6NEFXKaKwTen1s0UoLZ6edkpq3Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5070
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
Changes for v2:
- No changes

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

