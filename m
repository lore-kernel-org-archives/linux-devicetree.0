Return-Path: <SRS0=rCaq=WY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:58932 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726315AbfH1PRK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Aug 2019 11:17:10 -0400
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH] ARM: dts: omap4-droid4: Allow 350mA current for USB peripherals
Date: Wed, 28 Aug 2019 08:17:06 -0700
Message-Id: <20190828151706.32643-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, Marcel Partap <mpartap@gmx.net>, Merlijn Wajer <merlijn@wizzup.org>, Michael Scott <hashcode0f@gmail.com>, NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Looks like we can use some USB Ethernet dongles for example if we increase
the allowed power limit.

A similar PMIC MC13783 documents maximum current limit as 350 mA in in
"Table 10-3. VUSB Regulator Main Characteristics". Since we have no
other documentation, let's use that value as the limit.

Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Marcel Partap <mpartap@gmx.net>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Scott <hashcode0f@gmail.com>
Cc: NeKit <nekit1000@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-droid4-xt894.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -781,7 +781,12 @@
 &usb_otg_hs {
 	interface-type = <1>;
 	mode = <3>;
-	power = <50>;
+
+	/*
+	 * Max 350 mA steps based on similar PMIC MC13783UG.pdf "Table 10-3.
+	 * VUSB Regulator Main Characteristics". Binding uses 2 mA units.
+	 */
+	power = <175>;
 };
 
 &i2c4 {
-- 
2.23.0
