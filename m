From: =?UTF-8?q?Rodrigo=20Exterck=C3=B6tter=20Tj=C3=A4der?=
        <rodrigo@tjader.xyz>
Subject: [PATCH v2] arm64: dts: allwinner: a64-olinuxino: set the PHY TX delay
Date: Wed, 26 Sep 2018 19:48:24 +0000
Message-ID: <20180926194824.8832-1-rodrigo@tjader.xyz>
References: <20180926170545.ogcmt36ff7jmqxkl@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926170545.ogcmt36ff7jmqxkl@flea>
Sender: linux-kernel-owner@vger.kernel.org
Cc: =?UTF-8?q?Rodrigo=20Exterck=C3=B6tter=20Tj=C3=A4der?= <rodrigo@tjader.xyz>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The PHY found on the A64-OLinuXino requires a TX delay in order to
operate properly. Olimex uses a 600ps second delay in their BSP, and
that has been found to work, so let's use that value in the current
DT.

Signed-off-by: Rodrigo Exterckötter Tjäder <rodrigo@tjader.xyz>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index 6ef3dd4c2389..f7a4bccaa5d4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -105,6 +105,7 @@
 	phy-mode = "rgmii";
 	phy-handle = <&ext_rgmii_phy>;
 	phy-supply = <&reg_dcdc1>;
+	allwinner,tx-delay-ps = <600>;
 	status = "okay";
 };
 
-- 
2.11.0
