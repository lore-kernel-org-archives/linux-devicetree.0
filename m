Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F5AC432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:00:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FDDB2084F
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbfLBRAr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 12:00:47 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:45675 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbfLBRAr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 12:00:47 -0500
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B7E822001F;
        Mon,  2 Dec 2019 17:00:38 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     <devicetree@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        linux-rockchip@lists.infradead.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] arm64: dts: rockchip: Fix IOMMU second clock name
Date:   Mon,  2 Dec 2019 18:00:28 +0100
Message-Id: <20191202170028.26169-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

By precedence, both the IOMMU driver and the bindings in the doc
impose two clocks to be filled in Rockchip device trees featuring an
IOMMU:
* The AXI clock called 'aclk'.
* The main peripheral bus clock (PCLK/HCL) called 'iface'.

Currently, the second clock in px30.dtsi is called 'hclk' and this
produces the following errors at boot:

        rk_iommu ff460f00.iommu: Failed to get clk 'iface': -2
        rk_iommu ff470f00.iommu: Failed to get clk 'iface': -2

Fix the PX30 device tree by renaming the second misnamed clock. The
issue has not been reported before probably because the clk_get() call
is optional for backward DT compatibility reasons.

Fixes: 7053e06b1422 ("arm64: dts: rockchip: add core dtsi file for PX30 SoCs")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index eb992d60e6ba..1fd12bd09e83 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -831,7 +831,7 @@
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "vopb_mmu";
 		clocks = <&cru ACLK_VOPB>, <&cru HCLK_VOPB>;
-		clock-names = "aclk", "hclk";
+		clock-names = "aclk", "iface";
 		power-domains = <&power PX30_PD_VO>;
 		#iommu-cells = <0>;
 		status = "disabled";
@@ -863,7 +863,7 @@
 		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "vopl_mmu";
 		clocks = <&cru ACLK_VOPL>, <&cru HCLK_VOPL>;
-		clock-names = "aclk", "hclk";
+		clock-names = "aclk", "iface";
 		power-domains = <&power PX30_PD_VO>;
 		#iommu-cells = <0>;
 		status = "disabled";
-- 
2.20.1

