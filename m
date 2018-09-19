From: =?UTF-8?q?Rodrigo=20Exterck=C3=B6tter=20Tj=C3=A4der?=
        <rodrigo@tjader.xyz>
Subject: [PATCH 2/2] arm64: dts: allwinner: Olimex A64-OLinuXino: fix ethernet
Date: Wed, 19 Sep 2018 11:19:36 -0300
Message-ID: <20180919141938.18791-1-rodrigo@tjader.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: =?UTF-8?q?Rodrigo=20Exterck=C3=B6tter=20Tj=C3=A4der?= <rodrigo@tjader.xyz>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Without "allwinner,tx-delay-ps = <600>;" on the DTP it can receive packets
but not send.

Signed-off-by: Rodrigo Exterckötter Tjäder <rodrigo@tjader.xyz>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index 5245de3a1f35..75a435b9509b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -90,6 +90,7 @@
 	phy-mode = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_dcdc1>;
+	allwinner,tx-delay-ps = <600>;
 	status = "okay";
 };
 
-- 
2.18.0
