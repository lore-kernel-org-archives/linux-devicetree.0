From: Pramod Kumar <pramodku@broadcom.com>
Subject: [PATCH 06/11] dts: define ngpios property in gpio controller's node
Date: Mon, 19 Oct 2015 11:13:13 +0530
Message-ID: <1445233398-27129-7-git-send-email-pramodku@broadcom.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas Gorski <jogo@openwrt.org>, Pramod Kumar <pramodku@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add ngpios property in cygnus ASIU, CCM and CRMU gpio controller's
node.

Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 6621f13..d0fd050 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -64,6 +64,7 @@
 		compatible = "brcm,cygnus-crmu-gpio";
 		reg = <0x03024800 0x50>,
 		      <0x03024008 0x18>;
+		ngpios = <6>;
 		#gpio-cells = <2>;
 		gpio-controller;
 	};
@@ -72,6 +73,7 @@
 		compatible = "brcm,cygnus-ccm-gpio";
 		reg = <0x1800a000 0x50>,
 		      <0x0301d164 0x20>;
+		ngpios = <24>;
 		#gpio-cells = <2>;
 		gpio-controller;
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
@@ -81,6 +83,7 @@
 	gpio_asiu: gpio@180a5000 {
 		compatible = "brcm,cygnus-asiu-gpio";
 		reg = <0x180a5000 0x668>;
+		ngpios = <146>;
 		#gpio-cells = <2>;
 		gpio-controller;
 
-- 
1.9.1
