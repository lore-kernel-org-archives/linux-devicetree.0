Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:60412 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726667AbfAGXvi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 7 Jan 2019 18:51:38 -0500
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH] ARM: dts: Remove unnecessary idle flags for omap5 uart3
Date: Mon,  7 Jan 2019 15:51:35 -0800
Message-Id: <20190107235135.53491-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Looks like I accidentally left some extra flags for uart3 to
not idle it. This happened as I generated the data from a
running system where these flags are set dynamically on boot
by omap_hwmod_setup_earlycon_flags() if earlycon is enabled.

We can just remove them.

Fixes: 4c387984618f ("ARM: dts: omap5: Add l4 interconnect
hierarchy and ti-sysc data")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5-l4.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -1046,8 +1046,6 @@
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,syss-mask = <1>;
-			ti,no-reset-on-init;
-			ti,no-idle-on-init;
 			/* Domains (V, P, C): core, core_pwrdm, l4per_clkdm */
 			clocks = <&l4per_clkctrl OMAP5_UART3_CLKCTRL 0>;
 			clock-names = "fck";
-- 
2.20.1
