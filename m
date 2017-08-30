From: Philipp Rossak <embed3d@gmail.com>
Subject: [PATCH 2/7] ARM: dts: sun8i: h3: nanopi-m1-plus: Enable IR controller
Date: Wed, 30 Aug 2017 05:01:05 +0200
Message-ID: <1504062070-13523-3-git-send-email-embed3d@gmail.com>
References: <1504062070-13523-1-git-send-email-embed3d@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504062070-13523-1-git-send-email-embed3d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org
Cc: Philipp Rossak <embed3d@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Philipp Rossak <embed3d@gmail.com>

The Nanopi M1 Plus has an onboard IR receiver.
This enables the onboard IR receiver subnode.

Signed-off-by: Philipp Rossak <embed3d@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
index 8ddd1b2..ece275b 100644
--- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
+++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
@@ -55,6 +55,12 @@
 	status = "okay";
 };
 
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_pins_a>;
+	status = "okay";
+};
+
 &ohci1 {
 	status = "okay";
 };
-- 
2.7.4
