Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EF8CA9EA9
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:07:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6244222BD
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502388AbfJRQHo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 12:07:44 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51605 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502391AbfJRQHo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 12:07:44 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1iLUmx-0002BV-RP; Fri, 18 Oct 2019 18:07:39 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1iLUmw-0004Ag-6a; Fri, 18 Oct 2019 18:07:38 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Nava kishore Manne <nava.manne@xilinx.com>,
        Nava kishore Manne <navam@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 4/5] arm64: zynqmp: Add support for zynqmp nvmem firmware driver
Date:   Fri, 18 Oct 2019 18:07:34 +0200
Message-Id: <20191018160735.15658-5-m.tretter@pengutronix.de>
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

From: Nava kishore Manne <nava.manne@xilinx.com>

Add support for zynqmp nvmem firmware driver.

Signed-off-by: Nava kishore Manne <navam@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
[m.tretter@pengutronix.de: move to subnode of firmware]
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index e72343756f7b..3c731e73903a 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -120,6 +120,16 @@
 			compatible = "xlnx,zynqmp-firmware";
 			method = "smc";
 
+			nvmem_firmware {
+				compatible = "xlnx,zynqmp-nvmem-fw";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				soc_revision: soc_revision@0 {
+					reg = <0x0 0x4>;
+				};
+			};
+
 			zynqmp_pcap: pcap {
 				compatible = "xlnx,zynqmp-pcap-fpga";
 			};
-- 
2.20.1

