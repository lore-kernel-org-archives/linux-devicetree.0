From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 2/2] arm64: allwinner: h5: fix pinctrl IRQs
Date: Fri, 11 Aug 2017 22:27:35 +0800
Message-ID: <20170811142735.2970-3-icenowy@aosc.io>
References: <20170811142735.2970-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170811142735.2970-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The pin controller of H5 has three IRQs at the chip's GIC, which
represents three banks of pinctrl IRQs. However, the device tree used to
miss the third IRQ of the pin controller, which makes the PG bank IRQ
not usable.

Add the missing IRQ to the pinctrl node.

Fixes: 4e36de179f27 ("arm64: allwinner: h5: add Allwinner H5 .dtsi")
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
index 732e2e06f503..d9a720bff05d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi
@@ -120,5 +120,8 @@
 };
 
 &pio {
+	interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 	compatible = "allwinner,sun50i-h5-pinctrl";
 };
-- 
2.13.0
