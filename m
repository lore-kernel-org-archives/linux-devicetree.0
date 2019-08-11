From: Bhushan Shah <bshah@kde.org>
Subject: [PATCH 2/2] arm64: allwinner: h6: enable i2c0 in PineH64
Date: Sun, 11 Aug 2019 14:35:03 +0530
Message-ID: <20190811090503.32396-3-bshah@kde.org>
References: <20190811090503.32396-1-bshah@kde.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811090503.32396-1-bshah@kde.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhushan Shah <bshah@kde.org>
List-Id: devicetree@vger.kernel.org

i2c0 bus is exposed by PI-2 BUS in the PineH64, model B.

Signed-off-by: Bhushan Shah <bshah@kde.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index 684d1daa3081..a184361bc10d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -160,6 +160,14 @@
 	vcc-pg-supply = <&reg_aldo1>;
 };
 
+&i2c0 {
+	status = "okay";
+};
+
+&i2c0_pins {
+	bias-pull-up;
+};
+
 &r_i2c {
 	status = "okay";
 
-- 
2.17.1
