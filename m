From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 04/15] ARM: dts: at91: sama5d27_som1_ek: set USER button as a wakeup source
Date: Mon, 9 Oct 2017 19:09:26 +0300
Message-ID: <1507565377-1545-5-git-send-email-claudiu.beznea@microchip.com>
References: <1507565377-1545-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507565377-1545-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>, Ludovic Desroches <ludovic.desroches@microchip.com>
List-Id: devicetree@vger.kernel.org

Set the USER button as a wakeup source to allow wakeup from ULP0.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
[claudiu.beznea@microchip.com: change subject to match the desired prefix]
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
index b31778121c41..ac79730213f1 100644
--- a/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
+++ b/arch/arm/boot/dts/at91-sama5d27_som1_ek.dts
@@ -519,6 +519,7 @@
 			label = "USER";
 			gpios = <&pioA PIN_PA29 GPIO_ACTIVE_LOW>;
 			linux,code = <0x104>;
+			wakeup-source;
 		};
 	};
 
-- 
2.7.4
