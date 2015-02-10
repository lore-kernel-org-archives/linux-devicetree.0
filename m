From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v9 3/4] ARM: dts: enable GPIO for Broadcom Cygnus
Date: Tue, 10 Feb 2015 14:16:23 -0800
Message-ID: <1423606584-21795-4-git-send-email-rjui@broadcom.com>
References: <1423606584-21795-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423606584-21795-1-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This enables all 3 GPIO controllers including the ASIU GPIO, the
chipcommonG GPIO, and the ALWAYS-ON GPIO, for Broadcom Cygnus SoC

Signed-off-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi |   33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index b014ce5..a3b8621 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -60,6 +60,39 @@
 		      <0x0301d24c 0x2c>;
 	};
 
+	gpio_crmu: gpio@03024800 {
+		compatible = "brcm,cygnus-gpio";
+		reg = <0x03024800 0x50>,
+		      <0x03024008 0x18>;
+		ngpios = <6>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	gpio_ccm: gpio@1800a000 {
+		compatible = "brcm,cygnus-gpio";
+		reg = <0x1800a000 0x50>,
+		      <0x0301d164 0x20>;
+		ngpios = <24>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+	};
+
+	gpio_asiu: gpio@180a5000 {
+		compatible = "brcm,cygnus-gpio";
+		reg = <0x180a5000 0x668>;
+		ngpios = <146>;
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		pinmux = <&pinctrl>;
+
+		interrupt-controller;
+		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.9.5
