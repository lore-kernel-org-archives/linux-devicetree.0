Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4728C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 21:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F9782053B
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 21:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfLJV6e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 16:58:34 -0500
Received: from muru.com ([72.249.23.125]:44922 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726417AbfLJV6e (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 16:58:34 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DF892820B;
        Tue, 10 Dec 2019 21:59:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jean Pihet <jean.pihet@newoldbits.com>
Subject: [PATCH 1/2] ARM: dts: Configure interconnect target module for am4 qspi
Date:   Tue, 10 Dec 2019 13:58:30 -0800
Message-Id: <20191210215831.6199-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We can now probe devices with device tree only configuration using
ti-sysc interconnect target module driver. Let's configure the
module, but keep the legacy "ti,hwmods" peroperty to avoid new boot
time warnings. The legacy property will be removed in later patches
together with the legacy platform data.

Cc: Jean Pihet <jean.pihet@newoldbits.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am4372.dtsi | 38 ++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -305,17 +305,35 @@ gpmc: gpmc@50000000 {
 			status = "disabled";
 		};
 
-		qspi: spi@47900000 {
-			compatible = "ti,am4372-qspi";
-			reg = <0x47900000 0x100>,
-			      <0x30000000 0x4000000>;
-			reg-names = "qspi_base", "qspi_mmap";
-			#address-cells = <1>;
-			#size-cells = <0>;
+		target-module@47900000 {
+			compatible = "ti,sysc-omap4", "ti,sysc";
 			ti,hwmods = "qspi";
-			interrupts = <0 138 0x4>;
-			num-cs = <4>;
-			status = "disabled";
+			reg = <0x47900000 0x4>,
+			      <0x47900010 0x4>;
+			reg-names = "rev", "sysc";
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			clocks = <&l3s_clkctrl AM4_L3S_QSPI_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x47900000 0x1000>,
+				 <0x30000000 0x30000000 0x4000000>;
+
+			qspi: spi@0 {
+				compatible = "ti,am4372-qspi";
+				reg = <0 0x100>,
+				      <0x30000000 0x4000000>;
+				reg-names = "qspi_base", "qspi_mmap";
+				clocks = <&dpll_per_m2_div4_ck>;
+				clock-names = "fck";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <0 138 0x4>;
+				num-cs = <4>;
+			};
 		};
 
 		dss: dss@4832a000 {
-- 
2.24.0
