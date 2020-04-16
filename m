Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59588C352BE
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:35:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 332AE20732
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:35:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="opxz6HfZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439408AbgDPHe6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:34:58 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9968 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438944AbgDPHe4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 03:34:56 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e980a320000>; Thu, 16 Apr 2020 00:33:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 16 Apr 2020 00:34:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 16 Apr 2020 00:34:56 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr
 2020 07:34:56 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 Apr 2020 07:34:55 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e980a9d0002>; Thu, 16 Apr 2020 00:34:55 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V1 4/4] usb: gadget: tegra-xudc: add port_speed_quirk
Date:   Thu, 16 Apr 2020 13:04:20 +0530
Message-ID: <1587022460-31988-5-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587022386; bh=naqEuQE4k8cFdiWBVAPEQm5vMjpwh+WbGHA3Ol+AaAk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=opxz6HfZIJWYEIzeiI+X7Lf9binF1dK6DgrdR6jS/Sz7lBx8q+i/xCtnL1tBqy/Ap
         GMB/TsL77Nk12pl2qFZ9mWQu1jLSemwa6h/yf3UVgO1yR7z/cubFoJFUAn2h9mze1U
         r2QQUb6OaNFSH/mqE2Bo6cwyHS+K3yzuRbAU7PmHcbkGRuOS2IRzyeDlAVC6hU3KlE
         6ARbenruqp8FkcrrmeHV0n2kn8cNGaaTYILhsiINxEWLxiOqVFCl4ZqyOp6RKM1h+T
         Pe6tkFu5GjEBNZ4wMiUBHBEtOiZgfOdFeSs4yO7+k+iwhsAUASULu3vFgRJSllfo99
         weKekPQt/qXeQ==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add port_speed_quirk that modify below registers to limit/restore OTG
port speed to GEN1/GEN2.
SSPX_CORE_CNT56
SSPX_CORE_CNT57
SSPX_CORE_CNT65
SSPX_CORE_CNT66
SSPX_CORE_CNT67
SSPX_CORE_CNT72

The basic idea is to make SCD intentionally fail, reduce SCD timeout and
force device transit to TSEQ. Enable this flag to only Tegra194.

Based on work by WayneChang <waynec@nvidia.com>

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 106 ++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index fb01117..63484f98 100644
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
+	val &= ~(SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK );
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
+	val &= ~(SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK );
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
@@ -3513,6 +3616,7 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.invalid_seq_num = true,
 	.pls_quirk = true,
 	.port_reset_quirk = true,
+	.port_speed_quirk = false,
 	.has_ipfs = true,
 };
 
@@ -3526,6 +3630,7 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.invalid_seq_num = false,
 	.pls_quirk = false,
 	.port_reset_quirk = false,
+	.port_speed_quirk = false,
 	.has_ipfs = false,
 };
 
@@ -3539,6 +3644,7 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.invalid_seq_num = false,
 	.pls_quirk = false,
 	.port_reset_quirk = false,
+	.port_speed_quirk = true,
 	.has_ipfs = false,
 };
 
-- 
2.7.4

