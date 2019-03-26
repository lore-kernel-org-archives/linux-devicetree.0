Return-Path: <SRS0=u60/=R5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:42844 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbfCZRmA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Mar 2019 13:42:00 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH] ARM: dts: Fix dcan clkctrl clock for am3
Date: Tue, 26 Mar 2019 10:41:56 -0700
Message-Id: <20190326174156.35612-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

We must not use legacy clock defines for dts clckctrl clocks as the offsets
will be wrong.

Fixes: 87fc89ced3a7 ("ARM: dts: am335x: Move l4 child devices to probe them with ti-sysc")
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1762,7 +1762,7 @@
 			reg = <0xcc000 0x4>;
 			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM3_D_CAN0_CLKCTRL 0>;
+			clocks = <&l4ls_clkctrl AM3_L4LS_D_CAN0_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1785,7 +1785,7 @@
 			reg = <0xd0000 0x4>;
 			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM3_D_CAN1_CLKCTRL 0>;
+			clocks = <&l4ls_clkctrl AM3_L4LS_D_CAN1_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.21.0
