Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC040CA9EA9
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C46F0222C5
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502254AbfJRQHo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 12:07:44 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46909 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502388AbfJRQHn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 12:07:43 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1iLUmx-0002BU-RJ; Fri, 18 Oct 2019 18:07:39 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1iLUmw-0004AV-69; Fri, 18 Oct 2019 18:07:38 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Nava kishore Manne <nava.manne@xilinx.com>,
        Nava kishore Manne <navam@xilinx.com>,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 3/5] arm64: zynqmp: Label whole PL part as fpga_full region
Date:   Fri, 18 Oct 2019 18:07:33 +0200
Message-Id: <20191018160735.15658-4-m.tretter@pengutronix.de>
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

This will simplify dt overlay structure for the whole PL.

Signed-off-by: Nava kishore Manne <navam@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 43f01dca1f78..e72343756f7b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -135,6 +135,14 @@
 			     <1 10 0xf08>;
 	};
 
+	fpga_full: fpga-full {
+		compatible = "fpga-region";
+		fpga-mgr = <&zynqmp_pcap>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+	};
+
 	amba_apu: amba-apu@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
2.20.1

