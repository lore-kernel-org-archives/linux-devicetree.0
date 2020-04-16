Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F92C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40B8420732
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="WxZKqVtj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439365AbgDPHew (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:34:52 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9951 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438944AbgDPHev (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 03:34:51 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e980a2c0000>; Thu, 16 Apr 2020 00:33:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 16 Apr 2020 00:34:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 16 Apr 2020 00:34:50 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr
 2020 07:34:50 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 Apr 2020 07:34:50 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e980a970000>; Thu, 16 Apr 2020 00:34:49 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V1 2/4] arm64: tegra: Add xudc node for Tegra194
Date:   Thu, 16 Apr 2020 13:04:18 +0530
Message-ID: <1587022460-31988-3-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587022380; bh=qQMgfjYiYx+v2twyl6oIwGAWHyf/az0MjNbZ1f4jWms=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=WxZKqVtjDUSee+hTgt3NV7XjgpkDb2wpY4Tmlo1q68czpHYEQnJpIyhWCXXGGuJAp
         RiTESSAb5CZRdQVQcAVDhnTFfWCBA2niIxRtbKvkbANDU1lW0G6/onM/aIYer8dCsM
         tNHLw8cxCayn90c3ZiP9ViARKDIY/fZIfjRDvwumRO9KPyo+wJ5yLxrbuvH84a/bwy
         Cqp6hLJyxqhcV9jDA3e8+2YEGOeD27JfMvytAAWMDxsExJqKtJbA7vom9DxZKNjxO0
         fyYtO/BOEm/obMYtncm9JD4X1omxx6OF+6/omFySF/sZjyp7PZgaOOZe3qxcNncnFc
         yI0mUTfEv5RIw==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Tegra194 has one XUSB device mode controller, which can be operated
HS and SS modes. Add DT entry for XUSB device mode controller

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index f4ede86..e1ae01c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -644,6 +644,24 @@
 			};
 		};
 
+		usb@3550000 {
+			compatible = "nvidia,tegra194-xudc";
+			reg = <0x03550000 0x8000>,
+			      <0x03558000 0x1000>;
+			reg-names = "base", "fpci";
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bpmp TEGRA194_CLK_XUSB_CORE_DEV>,
+				 <&bpmp TEGRA194_CLK_XUSB_CORE_SS>,
+				 <&bpmp TEGRA194_CLK_XUSB_SS>,
+				 <&bpmp TEGRA194_CLK_XUSB_FS>;
+			clock-names = "dev", "ss", "ss_src", "fs_src";
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_XUSBB>,
+					<&bpmp TEGRA194_POWER_DOMAIN_XUSBA>;
+			power-domain-names = "dev", "ss";
+			nvidia,xusb-padctl = <&xusb_padctl>;
+			status = "disabled";
+		};
+
 		usb@3610000 {
 			compatible = "nvidia,tegra194-xusb";
 			reg = <0x03610000 0x40000>,
-- 
2.7.4

