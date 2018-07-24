From: Emmanuel Vadot <manu@freebsd.org>
Subject: [PATCH v2 5/5] arm64: dts: allwinner: h5: Add SID for H5
Date: Tue, 24 Jul 2018 12:15:22 +0200
Message-ID: <20180724101522.68165-5-manu@freebsd.org>
References: <20180724101522.68165-1-manu@freebsd.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724101522.68165-1-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Emmanuel Vadot <manu@freebsd.org>
List-Id: devicetree@vger.kernel.org

The SID controller on H5 look the same as the one present in the A64.
But in case we find some difference one day at a compatible string
of it's own and a fallback to the A64 one.

Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

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
