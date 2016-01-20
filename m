From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 3/4] ARM: dts: imx53: add display timing for NL12880BC20
Date: Wed, 20 Jan 2016 14:09:21 +0100
Message-ID: <1453295362-18798-4-git-send-email-LW@KARO-electronics.de>
References: <1453295362-18798-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453295362-18798-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx53-tx53-x13x.dts | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-tx53-x13x.dts b/arch/arm/boot/dts/=
imx53-tx53-x13x.dts
index 6d0b526..97d531c 100644
--- a/arch/arm/boot/dts/imx53-tx53-x13x.dts
+++ b/arch/arm/boot/dts/imx53-tx53-x13x.dts
@@ -203,7 +203,23 @@
 				hsync-active =3D <0>;
 				vsync-active =3D <0>;
 				de-active =3D <1>;
-				pixelclk-active =3D <0>;
+				pixelclk-active =3D <1>;
+			};
+
+			lvds0_timing1: nl12880bc20 {
+				clock-frequency =3D <71000000>;
+				hactive =3D <1280>;
+				vactive =3D <800>;
+				hback-porch =3D <50>;
+				hsync-len =3D <60>;
+				hfront-porch =3D <50>;
+				vback-porch =3D <5>;
+				vsync-len =3D <13>;
+				vfront-porch =3D <5>;
+				hsync-active =3D <0>;
+				vsync-active =3D <0>;
+				de-active =3D <1>;
+				pixelclk-active =3D <1>;
 			};
 		};
 	};
@@ -229,7 +245,7 @@
 				hsync-active =3D <0>;
 				vsync-active =3D <0>;
 				de-active =3D <1>;
-				pixelclk-active =3D <0>;
+				pixelclk-active =3D <1>;
 			};
 		};
 	};
--=20
2.1.4
