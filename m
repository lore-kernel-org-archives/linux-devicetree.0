From: Emmanuel Vadot <manu@freebsd.org>
Subject: [PATCH 4/4] arm64: dts: allwinner: h5: Add SID for H5
Date: Mon, 23 Jul 2018 12:42:55 +0200
Message-ID: <20180723104255.94244-4-manu@freebsd.org>
References: <20180723104255.94244-1-manu@freebsd.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723104255.94244-1-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, srinivas.kandagatla@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Emmanuel Vadot <manu@freebsd.org>
List-Id: devicetree@vger.kernel.org

The SID controller on H5 look the same as the one present in the A64.
But in case we find some difference one day at a compatible string
of it's own and a fallback to the A64 one.

Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
---
 .../devicetree/bindings/nvmem/allwinner,sunxi-sid.txt        | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi                 | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
index e319fe5e205a..99c4ba6a3f61 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
@@ -7,6 +7,7 @@ Required properties:
   "allwinner,sun8i-a83t-sid"
   "allwinner,sun8i-h3-sid"
   "allwinner,sun50i-a64-sid"
+  "allwinner,sun50i-h5-sid"
 
 - reg: Should contain registers location and length
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
index 62d646baac3c..28183bf77164 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
@@ -129,3 +129,8 @@
 		     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 	compatible = "allwinner,sun50i-h5-pinctrl";
 };
+
+&sid {
+	compatible = "allwinner,sun50i-h5-sid",
+		     "allwinner,sun50i-a64-sid";
+};
-- 
2.17.0
