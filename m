Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:60312 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbfAGR7T (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 7 Jan 2019 12:59:19 -0500
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH] ARM: dts: omap4-droid4: Fix typo in cpcap IRQ flags
Date: Mon,  7 Jan 2019 09:59:07 -0800
Message-Id: <20190107175907.45268-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
List-ID: <devicetree@vger.kernel.org>

We're now getting the following error:

genirq: Setting trigger mode 1 for irq 230 failed
(regmap_irq_set_type+0x0/0x15c)
cpcap-usb-phy cpcap-usb-phy.0: could not get irq dp: -524

This is because of a typo in the irq flags. Really these interrupts
are LEVEL, but before we change them we need to test them. So let's
do a minimal fix first.

Reported-by: Pavel Machek <pavel@ucw.cz>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -105,7 +105,7 @@
 			interrupts-extended = <
 				&cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
 				&cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
-				&cpcap 48 1
+				&cpcap 48 0
 			>;
 			interrupt-names =
 				"id_ground", "id_float", "se0conn", "vbusvld",
-- 
2.20.1
