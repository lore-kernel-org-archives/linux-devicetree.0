From: Olliver Schinagl <o.schinagl@ultimaker.com>
Subject: [PATCH v2 5/5] dts: sunxi: add eeprom to A20 OLinuXino micro board
Date: Thu, 10 Sep 2015 10:31:21 +0200
Message-ID: <1441873881-3665-6-git-send-email-o.schinagl@ultimaker.com>
References: <1441873881-3665-1-git-send-email-o.schinagl@ultimaker.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441873881-3665-1-git-send-email-o.schinagl@ultimaker.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Olliver Schinagl <oliver@schinagl.nl>
List-Id: devicetree@vger.kernel.org

From: Olliver Schinagl <oliver@schinagl.nl>

The Olimex A20 OLinuXino Micro features an eeprom that is always on the
board. This patch adds it to the dts.

Signed-off-by: Olliver Schinagl <oliver@schinagl.nl>
---
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
index 00f8f25..f2816dd 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
@@ -125,6 +125,12 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1_pins_a>;
 	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
 };
 
 &i2c2 {
-- 
2.1.4
