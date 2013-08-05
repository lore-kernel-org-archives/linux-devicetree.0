Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-db8lp0189.outbound.messaging.microsoft.com ([213.199.154.189]:50269
	"EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754785Ab3HEV6c (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2013 17:58:32 -0400
From: <dinguyen@altera.com>
Subject: [RESEND PATCH 3/4] ARM: socfpga: dts: Fix entries for the ethernet entries.
Date: Mon, 5 Aug 2013 16:58:44 -0500
Message-ID: <1375739925-9110-4-git-send-email-dinguyen@altera.com>
In-Reply-To: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
References: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: dinh.linux@gmail.com
Cc: Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Pavel Machek <pavel@denx.de>, Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
List-ID: <devicetree@vger.kernel.org>

From: Dinh Nguyen <dinguyen@altera.com>

Use the gate-clock emac_0_clk and emac_1_clk. Fix phy-addr binding to the
correct snps,phy-addr binding.

Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
Tested-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Ian Campbell <ian.campbell@citrix.com>
Cc: devicetree@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Pavel Machek <pavel@denx.de>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 arch/arm/boot/dts/socfpga.dtsi         |    4 ++--
 arch/arm/boot/dts/socfpga_cyclone5.dts |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index dbf7f22..93ee655 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -444,7 +444,7 @@
 			interrupts = <0 115 4>;
 			interrupt-names = "macirq";
 			mac-address = [00 00 00 00 00 00];/* Filled in by U-Boot */
-			clocks = <&emac0_clk>;
+			clocks = <&emac_0_clk>;
 			clock-names = "stmmaceth";
 			status = "disabled";
 		};
@@ -455,7 +455,7 @@
 			interrupts = <0 120 4>;
 			interrupt-names = "macirq";
 			mac-address = [00 00 00 00 00 00];/* Filled in by U-Boot */
-			clocks = <&emac1_clk>;
+			clocks = <&emac_1_clk>;
 			clock-names = "stmmaceth";
 			status = "disabled";
 		};
diff --git a/arch/arm/boot/dts/socfpga_cyclone5.dts b/arch/arm/boot/dts/socfpga_cyclone5.dts
index 1853cb1..102c4d8 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5.dts
@@ -50,7 +50,7 @@
 
 		ethernet@ff702000 {
 			phy-mode = "rgmii";
-			phy-addr = <0xffffffff>; /* probe for phy addr */
+			snps,phy-addr = <0xffffffff>; /* probe for phy addr */
 			status = "okay";
 		};
 
-- 
1.7.9.5


