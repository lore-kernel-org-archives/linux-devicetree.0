From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/2] ARM: dts: meson: add the TIMER B/C/D interrupts
Date: Fri, 16 Nov 2018 21:42:34 +0100
Message-ID: <20181116204235.3925-2-martin.blumenstingl@googlemail.com>
References: <20181116204235.3925-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116204235.3925-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com, carlo@caione.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The timer on Meson6/Meson8/Meson8b SoCs has four internal timer events.
For each of these a separate interrupt exists.
Pass these interrupts to allow using the timers other than TIMER A.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 0d9faf1a51ea..f0255450bcb2 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -200,7 +200,10 @@
 			timer@9940 {
 				compatible = "amlogic,meson6-timer";
 				reg = <0x9940 0x18>;
-				interrupts = <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
 			};
 		};
 
-- 
2.19.1
