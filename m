From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v5 4/8] ARM: dts: enable IOMUX for Broadcom Cygnus
Date: Wed, 4 Mar 2015 16:35:52 -0800
Message-ID: <1425515756-321-5-git-send-email-rjui@broadcom.com>
References: <1425515756-321-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425515756-321-1-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This enables the IOMUX support for Broadcom Cygnus SoC

Signed-off-by: Ray Jui <rjui@broadcom.com>
Tested-by: Dmitry Torokhov <dtor@chromium.org>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index ff5fb6a..1cbae6a 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -54,6 +54,12 @@
 
 	/include/ "bcm-cygnus-clock.dtsi"
 
+	pinctrl: pinctrl@0x0301d0c8 {
+		compatible = "brcm,cygnus-pinmux";
+		reg = <0x0301d0c8 0x30>,
+		      <0x0301d24c 0x2c>;
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.9.5
