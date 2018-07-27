From: Emmanuel Vadot <manu@freebsd.org>
Subject: [PATCH v3 2/4] ARM: dts: sun8i: h3: Add SID compatible string
Date: Fri, 27 Jul 2018 13:52:03 +0200
Message-ID: <20180727115205.20955-2-manu@freebsd.org>
References: <20180727115205.20955-1-manu@freebsd.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727115205.20955-1-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Emmanuel Vadot <manu@freebsd.org>
List-Id: devicetree@vger.kernel.org

The SID controller on H3 already have a binding but isn't present in the
dtsi file.
Add a node for it.

Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 41d57c76f290..614e2c2154c8 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -111,6 +111,11 @@
 	};
 
 	soc {
+		sid: eeprom@1c14000 {
+			compatible = "allwinner,sun8i-h3-sid";
+			reg = <0x1c14000 0x400>;
+		};
+
 		mali: gpu@1c40000 {
 			compatible = "allwinner,sun8i-h3-mali", "arm,mali-400";
 			reg = <0x01c40000 0x10000>;
-- 
2.18.0
