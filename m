From: Philipp Rossak <embed3d@gmail.com>
Subject: [PATCH 5/7] ARM: dts: sun8i: h3: Enable dwmac-sun8i on the Nanopi M1
Date: Wed, 30 Aug 2017 05:01:08 +0200
Message-ID: <1504062070-13523-6-git-send-email-embed3d@gmail.com>
References: <1504062070-13523-1-git-send-email-embed3d@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504062070-13523-1-git-send-email-embed3d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org
Cc: Philipp Rossak <embed3d@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Philipp Rossak <embed3d@gmail.com>

The dwmac-sun8i hardware is present on the Nanopi M1.
It uses the internal PHY.

Signed-off-by: Philipp Rossak <embed3d@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
index 3a2ccdb..c77fbca 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1.dts
@@ -45,6 +45,10 @@
 / {
 	model = "FriendlyArm NanoPi M1";
 	compatible = "friendlyarm,nanopi-m1", "allwinner,sun8i-h3";
+
+	aliases {
+		ethernet0 = &emac;
+	};
 };
 
 &ehci1 {
@@ -55,6 +59,13 @@
 	status = "okay";
 };
 
+&emac {
+	phy-handle = <&int_mii_phy>;
+	phy-mode = "mii";
+	allwinner,leds-active-low;
+	status = "okay";
+};
+
 &ir {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ir_pins_a>;
-- 
2.7.4
