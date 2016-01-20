From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 2/3] ARM: dts: sama5d4: add labels for watchdog and pinctrl nodes
Date: Wed, 20 Jan 2016 13:35:36 +0100
Message-ID: <1453293337-16078-3-git-send-email-LW@KARO-electronics.de>
References: <1453293337-16078-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453293337-16078-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/sama5d4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4=
=2Edtsi
index 6c0dc89..fb40014 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -1299,7 +1299,7 @@
 				clocks =3D <&h32ck>;
 			};
=20
-			watchdog@fc068640 {
+			watchdog: watchdog@fc068640 {
 				compatible =3D "atmel,sama5d4-wdt";
 				reg =3D <0xfc068640 0x10>;
 				clocks =3D <&clk32k>;
@@ -1351,7 +1351,7 @@
 			};
=20
=20
-			pinctrl@fc06a000 {
+			pinctrl: pinctrl@fc06a000 {
 				#address-cells =3D <1>;
 				#size-cells =3D <1>;
 				compatible =3D "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pinct=
rl", "simple-bus";
--=20
2.1.4
