Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A81CA9ECF
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 16:31:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12CC821734
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 16:31:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbfKAQb0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 12:31:26 -0400
Received: from muru.com ([72.249.23.125]:40428 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbfKAQb0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 1 Nov 2019 12:31:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9113A8140;
        Fri,  1 Nov 2019 16:32:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] ARM: dts: Configure sgx for dra7
Date:   Fri,  1 Nov 2019 09:31:23 -0700
Message-Id: <20191101163123.50284-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

I've tested that the interconnect target module enables and idles
just fine when probed with ti-sysc with PM runtime control via sys:

# echo on > $(find /sys -name control | grep \/5600)
# rwmem 0x5600fe00      # OCP Revision
0x5600fe00 = 0x40000000
# echo auto > $(find /sys -name control | grep \/5600)

Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Robert Nelson <robertcnelson@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

This patch depends on "[PATCH] clk: ti: add clkctrl data dra7 sgx".

---
 arch/arm/boot/dts/dra7.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -673,6 +673,24 @@
 			status = "disabled";
 		};
 
+		target-module@56000000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
+			reg = <0x5600fe00 0x4>,
+			      <0x5600fe10 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			clocks = <&gpu_clkctrl DRA7_GPU_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x56000000 0x2000000>;
+		};
+
 		crossbar_mpu: crossbar@4a002a48 {
 			compatible = "ti,irq-crossbar";
 			reg = <0x4a002a48 0x130>;
-- 
2.23.0
