Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F131C3A5A9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 06:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 189682054F
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 06:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="qDoNlBQv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgEDGdk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 02:33:40 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5294 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgEDGdk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 02:33:40 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eafb6fe0000>; Sun, 03 May 2020 23:32:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 03 May 2020 23:33:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 03 May 2020 23:33:39 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 06:33:39 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 4 May 2020 06:33:39 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5eafb7400001>; Sun, 03 May 2020 23:33:38 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V2 3/3] usb: gadget: tegra-xudc: add port_speed_quirk
Date:   Mon, 4 May 2020 12:04:41 +0530
Message-ID: <1588574081-23160-4-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588574081-23160-1-git-send-email-nkristam@nvidia.com>
References: <1588574081-23160-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588573950; bh=4S4+7Q1v8T97/LJp/rVsk/6bGlUDNI4LPsIAgboFSW4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=qDoNlBQvezAUQpRut45dNd8S9jGPRljoLdvzs5MyZDQgfl3XhCH2hXnTfNA+93iFa
         4Dvz7e7HkV08Lb3gkab5q5BafjbPjeaPh/n1OS/c0dNONGwsGICOUWO4Hq+mDDquCO
         oZaKLQvWYTs0REqOCafWluci8S0rBgu2NZqaTe0WDUtGcXwANlK9Jr9/eIyJMOJw2j
         +4+/viBqLs+i3LwJU3dahQ3QeQ8MS/I7s70y1hU7pFRBOtFdAz6ERZm4KlgohNZB3d
         ZtZP6insLjvASX4+GSMQLOSWq/1T8MkLIXx2p74udEg31Wr/souEChjuw22fFyVwQz
         lx95Ey1Q6ctiA==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

OTG port on Tegra194 supports GEN1 speeds when in device mode and GEN2
speeds when in host mode. dd port_speed_quirk that configures port to
GEN1/GEN2 speds, corresponding to the mode.

Based on work by WayneChang <waynec@nvidia.com>

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V2:
 - Updated commit message to explain on why this change is needed.
 - Fixed checkpatch errors.
---
 drivers/usb/gadget/udc/tegra-xudc.c | 106 ++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 04c6a06..8111b32 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -158,6 +158,30 @@
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK GENMASK(7, 0)
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX(x) ((x) & \
 					SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK)
+#define SSPX_CORE_CNT56 0x6fc
+#define  SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(x) ((x) & \
+				SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK)
+#define SSPX_CORE_CNT57 0x700
+#define  SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(x) ((x) & \
+				SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK)
+#define SSPX_CORE_CNT65 0x720
+#define  SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(x) ((x) & \
+				SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK)
+#define SSPX_CORE_CNT66 0x724
+#define  SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(x) ((x) & \
+				SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK)
+#define SSPX_CORE_CNT67 0x728
+#define  SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(x) ((x) & \
+				SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK)
+#define SSPX_CORE_CNT72 0x73c
+#define  SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(x) ((x) & \
+				SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK)
 #define SSPX_CORE_PADCTL4 0x750
 #define  SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK GENMASK(19, 0)
 #define  SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3(x) ((x) & \
@@ -530,6 +554,7 @@ struct tegra_xudc_soc {
 	bool invalid_seq_num;
 	bool pls_quirk;
 	bool port_reset_quirk;
+	bool port_speed_quirk;
 	bool has_ipfs;
 };
 
@@ -599,6 +624,78 @@ static inline void dump_trb(struct tegra_xudc *xudc, const char *type,
 		trb->control);
 }
 
+static void tegra_xudc_limit_port_speed(struct tegra_xudc *xudc)
+{
+	u32 val;
+
+	/* limit port speed to gen 1 */
+	val = xudc_readl(xudc, SSPX_CORE_CNT56);
+	val &= ~(SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK);
+	val |= SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(0x260);
+	xudc_writel(xudc, val, SSPX_CORE_CNT56);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT57);
+	val &= ~(SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK);
+	val |= SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(0x6D6);
+	xudc_writel(xudc, val, SSPX_CORE_CNT57);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT65);
+	val &= ~(SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(0x4B0);
+	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT66);
+	val &= ~(SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(0x4B0);
+	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT67);
+	val &= ~(SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(0x4B0);
+	xudc_writel(xudc, val, SSPX_CORE_CNT67);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT72);
+	val &= ~(SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK);
+	val |= SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(0x10);
+	xudc_writel(xudc, val, SSPX_CORE_CNT72);
+}
+
+static void tegra_xudc_restore_port_speed(struct tegra_xudc *xudc)
+{
+	u32 val;
+
+	/* restore port speed to gen2 */
+	val = xudc_readl(xudc, SSPX_CORE_CNT56);
+	val &= ~(SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK);
+	val |= SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(0x438);
+	xudc_writel(xudc, val, SSPX_CORE_CNT56);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT57);
+	val &= ~(SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK);
+	val |= SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(0x528);
+	xudc_writel(xudc, val, SSPX_CORE_CNT57);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT65);
+	val &= ~(SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(0xE10);
+	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT66);
+	val &= ~(SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(0x348);
+	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT67);
+	val &= ~(SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(0x5a0);
+	xudc_writel(xudc, val, SSPX_CORE_CNT67);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT72);
+	val &= ~(SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK);
+	val |= SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(0x1c21);
+	xudc_writel(xudc, val, SSPX_CORE_CNT72);
+}
+
 static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 {
 	int err;
@@ -631,6 +728,9 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 
 	reinit_completion(&xudc->disconnect_complete);
 
+	if (xudc->soc->port_speed_quirk)
+		tegra_xudc_restore_port_speed(xudc);
+
 	phy_set_mode_ext(xudc->curr_utmi_phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
 
 	pls = (xudc_readl(xudc, PORTSC) & PORTSC_PLS_MASK) >>
@@ -3274,6 +3374,9 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 		xudc_writel(xudc, val, BLCG);
 	}
 
+	if (xudc->soc->port_speed_quirk)
+		tegra_xudc_limit_port_speed(xudc);
+
 	/* Set a reasonable U3 exit timer value. */
 	val = xudc_readl(xudc, SSPX_CORE_PADCTL4);
 	val &= ~(SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK);
@@ -3506,6 +3609,7 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.invalid_seq_num = true,
 	.pls_quirk = true,
 	.port_reset_quirk = true,
+	.port_speed_quirk = false,
 	.has_ipfs = true,
 };
 
@@ -3519,6 +3623,7 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.invalid_seq_num = false,
 	.pls_quirk = false,
 	.port_reset_quirk = false,
+	.port_speed_quirk = false,
 	.has_ipfs = false,
 };
 
@@ -3532,6 +3637,7 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.invalid_seq_num = false,
 	.pls_quirk = false,
 	.port_reset_quirk = false,
+	.port_speed_quirk = true,
 	.has_ipfs = false,
 };
 
-- 
2.7.4

