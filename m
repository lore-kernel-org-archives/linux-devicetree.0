Return-Path: <SRS0=hvZ9=WK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57570 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbfHNNCr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Aug 2019 09:02:47 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/5] ARM: dts: Drop custom hwmod property for omap4 i2c
Date: Wed, 14 Aug 2019 06:02:36 -0700
Message-Id: <20190814130240.56202-2-tony@atomide.com>
In-Reply-To: <20190814130240.56202-1-tony@atomide.com>
References: <20190814130240.56202-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the custom ti,hwmods dts property. We have already
dropped the platform data earlier and have been allocating it
dynamically.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-l4.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.dtsi
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -1695,7 +1695,6 @@
 
 		target-module@60000 {			/* 0x48060000, ap 25 1e.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c3";
 			reg = <0x60000 0x8>,
 			      <0x60010 0x8>,
 			      <0x60090 0x8>;
@@ -1814,7 +1813,6 @@
 
 		target-module@70000 {			/* 0x48070000, ap 32 28.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c1";
 			reg = <0x70000 0x8>,
 			      <0x70010 0x8>,
 			      <0x70090 0x8>;
@@ -1846,7 +1844,6 @@
 
 		target-module@72000 {			/* 0x48072000, ap 34 30.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c2";
 			reg = <0x72000 0x8>,
 			      <0x72010 0x8>,
 			      <0x72090 0x8>;
@@ -2401,7 +2398,6 @@
 
 		target-module@150000 {			/* 0x48350000, ap 77 4c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "i2c4";
 			reg = <0x150000 0x8>,
 			      <0x150010 0x8>,
 			      <0x150090 0x8>;
-- 
2.21.0
