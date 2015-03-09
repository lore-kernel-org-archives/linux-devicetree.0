From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v6 8/8] ARM: dts: cygnus: enable GPIO based hook detection
Date: Mon, 9 Mar 2015 13:45:02 -0700
Message-ID: <1425933902-20652-9-git-send-email-rjui@broadcom.com>
References: <1425933902-20652-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425933902-20652-1-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Paul Bolle <pebolle@tiscali.nl>
Cc: Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This enables GPIO based phone hook detection for Broadcom BCM911360
phone factor board (bcm911360_entphn)

Signed-off-by: Ray Jui <rjui@broadcom.com>
---
 arch/arm/boot/dts/bcm911360_entphn.dts |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/bcm911360_entphn.dts b/arch/arm/boot/dts/bcm911360_entphn.dts
index d2ee952..7db4843 100644
--- a/arch/arm/boot/dts/bcm911360_entphn.dts
+++ b/arch/arm/boot/dts/bcm911360_entphn.dts
@@ -33,6 +33,7 @@
 /dts-v1/;
 
 #include "bcm-cygnus.dtsi"
+#include "dt-bindings/input/input.h"
 
 / {
 	model = "Cygnus Enterprise Phone (BCM911360_ENTPHN)";
@@ -50,4 +51,16 @@
 	uart3: serial@18023000 {
 		status = "okay";
 	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hook {
+			label = "HOOK";
+			linux,code = <KEY_O>;
+			gpios = <&gpio_asiu 48 0>;
+		};
+	};
 };
-- 
1.7.9.5
