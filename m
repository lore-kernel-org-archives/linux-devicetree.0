Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163AFC38A29
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 07:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBACF21D94
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 07:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728570AbgDQHFf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 03:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728606AbgDQHFe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Apr 2020 03:05:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578D9C061BD3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2020 00:05:34 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jPL45-0008Nr-3y; Fri, 17 Apr 2020 09:05:29 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jPL44-00033W-FJ; Fri, 17 Apr 2020 09:05:28 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Rohit Visavalia <rohit.visavalia@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dhaval Shah <dshah@xilinx.com>, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v3 4/6] dt-bindings: soc: xlnx: extract xlnx,vcu-settings to separate binding
Date:   Fri, 17 Apr 2020 09:05:24 +0200
Message-Id: <20200417070526.7178-5-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200417070526.7178-1-m.tretter@pengutronix.de>
References: <20200417070526.7178-1-m.tretter@pengutronix.de>
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

The xlnx,vcu binding comprises two adjacent register banks:

The first register bank ("vcu_slcr") contains registers for setting the
clocks of the vcu and controlling the performance monitors. The second
bank ("logicoreip") contains the configuration settings of the video codec
unit, which are set before synthesizing the bitstream.

Drivers that drive the actual video codec unit need to to read the
registers from the logicoreip register bank for configuring the vcu
firmware.

As logicoreip is a too generic name for this register bank, use
"vcu-settings" as a binding name, because the register bank basically
provides the configuration settings of the VCU.

Therefore, add the vcu-settings binding to provide a syscon interface
for other drivers to read these registers.

The alternative would have been to merge the two register banks of the
xlnx,vcu binding into one register bank and make xlnx,vcu provide a
syscon interface, but that would lead to more incompatibility than
making second register bank of xlnx,vcu optional.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v2 -> v3:
- none

v1 -> v2:
- drop custom select for syscon
---
 .../soc/xilinx/xlnx,vcu-settings.yaml         | 34 +++++++++++++++++++
 .../bindings/soc/xilinx/xlnx,vcu.txt          |  9 ++---
 2 files changed, 36 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
new file mode 100644
index 000000000000..378d0ced43c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu-settings.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/xilinx/xlnx,vcu-settings.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx VCU Settings
+
+maintainers:
+  - Michael Tretter <kernel@pengutronix.de>
+
+description: |
+  The Xilinx VCU Settings provides information about the configuration of the
+  video codec unit.
+
+properties:
+  compatible:
+    items:
+      - const: xlnx,vcu-settings
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    xlnx_vcu: vcu@a0041000 {
+          compatible = "xlnx,vcu-settings", "syscon";
+          reg = <0x0 0xa0041000 0x0 0x1000>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
index 6786d6715df0..2417b13ba468 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
+++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
@@ -12,10 +12,7 @@ Required properties:
 - compatible: shall be one of:
 	"xlnx,vcu"
 	"xlnx,vcu-logicoreip-1.0"
-- reg, reg-names: There are two sets of registers need to provide.
-	1. vcu slcr
-	2. Logicore
-	reg-names should contain name for the each register sequence.
+- reg : The base offset and size of the VCU_PL_SLCR register space.
 - clocks: phandle for aclk and pll_ref clocksource
 - clock-names: The identification string, "aclk", is always required for
    the axi clock. "pll_ref" is required for pll.
@@ -23,9 +20,7 @@ Example:
 
 	xlnx_vcu: vcu@a0040000 {
 		compatible = "xlnx,vcu-logicoreip-1.0";
-		reg = <0x0 0xa0040000 0x0 0x1000>,
-			 <0x0 0xa0041000 0x0 0x1000>;
-		reg-names = "vcu_slcr", "logicore";
+		reg = <0x0 0xa0040000 0x0 0x1000>;
 		clocks = <&si570_1>, <&clkc 71>;
 		clock-names = "pll_ref", "aclk";
 	};
-- 
2.20.1

