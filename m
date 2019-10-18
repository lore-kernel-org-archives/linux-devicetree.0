Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE19CA9EAB
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:07:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56AA72245A
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:07:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394470AbfJRQHl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 12:07:41 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44459 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501965AbfJRQHl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 12:07:41 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1iLUmx-0002BW-RK; Fri, 18 Oct 2019 18:07:39 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1iLUmw-0004Ar-70; Fri, 18 Oct 2019 18:07:38 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Durga Challa <vnsl.durga.challa@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 5/5] arm64: zynqmp: Add data cells to access efuse
Date:   Fri, 18 Oct 2019 18:07:35 +0200
Message-Id: <20191018160735.15658-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018160735.15658-1-m.tretter@pengutronix.de>
References: <20191018160735.15658-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Durga Challa <vnsl.durga.challa@xilinx.com>

This patch adds data cells under nvmem node to
read efuse memory

Signed-off-by: Durga Challa <vnsl.durga.challa@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 3c731e73903a..73d26177eb96 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -128,6 +128,54 @@
 				soc_revision: soc_revision@0 {
 					reg = <0x0 0x4>;
 				};
+				efuse_dna: efuse_dna@c {
+					reg = <0xc 0xc>;
+				};
+				efuse_usr0: efuse_usr0@20 {
+					reg = <0x20 0x4>;
+				};
+				efuse_usr1: efuse_usr1@24 {
+					reg = <0x24 0x4>;
+				};
+				efuse_usr2: efuse_usr2@28 {
+					reg = <0x28 0x4>;
+				};
+				efuse_usr3: efuse_usr3@2c {
+					reg = <0x2c 0x4>;
+				};
+				efuse_usr4: efuse_usr4@30 {
+					reg = <0x30 0x4>;
+				};
+				efuse_usr5: efuse_usr5@34 {
+					reg = <0x34 0x4>;
+				};
+				efuse_usr6: efuse_usr6@38 {
+					reg = <0x38 0x4>;
+				};
+				efuse_usr7: efuse_usr7@3c {
+					reg = <0x3c 0x4>;
+				};
+				efuse_miscusr: efuse_miscusr@40 {
+					reg = <0x40 0x4>;
+				};
+				efuse_chash: efuse_chash@50 {
+					reg = <0x50 0x4>;
+				};
+				efuse_pufmisc: efuse_pufmisc@54 {
+					reg = <0x54 0x4>;
+				};
+				efuse_sec: efuse_sec@58 {
+					reg = <0x58 0x4>;
+				};
+				efuse_spkid: efuse_spkid@5c {
+					reg = <0x5c 0x4>;
+				};
+				efuse_ppk0hash: efuse_ppk0hash@a0 {
+					reg = <0xa0 0x30>;
+				};
+				efuse_ppk1hash: efuse_ppk1hash@d0 {
+					reg = <0xd0 0x30>;
+				};
 			};
 
 			zynqmp_pcap: pcap {
-- 
2.20.1

