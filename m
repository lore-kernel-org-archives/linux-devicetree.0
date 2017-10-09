From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 05/15] ARM: dts: at91: sama5d27_som1_ek: add aliases for i2c
Date: Mon, 9 Oct 2017 19:09:27 +0300
Message-ID: <1507565377-1545-6-git-send-email-claudiu.beznea@microchip.com>
References: <1507565377-1545-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507565377-1545-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Ludovic Desroches <ludovic.desroches@microchip.com>
List-Id: devicetree@vger.kernel.org

Add aliases for i2c devices to not rely on probe order for i2c device
numbering.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
[claudiu.beznea@microchip.com: remove i2c0, change subject]
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
index ac79730213f1..6c4c976a99d1 100644
--- a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
@@ -57,6 +57,8 @@
 		serial0 = &uart1;	/* DBGU */
 		serial1 = &uart4;	/* mikro BUS 1 */
 		serial2 = &uart2;	/* mikro BUS 2 */
+		i2c1	= &i2c1;
+		i2c2	= &i2c2;
 	};
 
 	chosen {
-- 
2.7.4
