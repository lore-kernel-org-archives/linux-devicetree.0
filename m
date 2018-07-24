From: Emmanuel Vadot <manu@freebsd.org>
Subject: [PATCH v2 3/5] ARM: dts: sun8i: h3: Add SID compatible string
Date: Tue, 24 Jul 2018 12:15:20 +0200
Message-ID: <20180724101522.68165-3-manu@freebsd.org>
References: <20180724101522.68165-1-manu@freebsd.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724101522.68165-1-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Emmanuel Vadot <manu@freebsd.org>
List-Id: devicetree@vger.kernel.org

The SID controller on H3 is one of it's kind (at least from what we
know).
Add a compatible string for it in the SoC dtsi.

Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 41d57c76f290..f543aa1dc829 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -185,3 +185,7 @@
 &pio {
 	compatible = "allwinner,sun8i-h3-pinctrl";
 };
+
+&sid {
+	compatible = "allwinner,sun8i-h3-sid";
+};
-- 
2.17.0
