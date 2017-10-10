From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 12/14] ARM: dts: at91: at91sam9x25ek: add CAN1 interface
Date: Tue, 10 Oct 2017 13:09:47 +0300
Message-ID: <1507630189-15504-13-git-send-email-claudiu.beznea@microchip.com>
References: <1507630189-15504-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507630189-15504-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

From: Nicolas Ferre <nicolas.ferre@microchip.com>

As the CAN1 interface is not multiplexed with other peripherals on this
board, enable it so that it can be tested more easily.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91sam9x25ek.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9x25ek.dts b/arch/arm/boot/dts/at91sam9x25ek.dts
index 494864836e83..f8360fb23107 100644
--- a/arch/arm/boot/dts/at91sam9x25ek.dts
+++ b/arch/arm/boot/dts/at91sam9x25ek.dts
@@ -16,6 +16,10 @@
 
 	ahb {
 		apb {
+			can1: can@f8004000 {
+				status = "okay";
+			};
+
 			macb0: ethernet@f802c000 {
 				phy-mode = "rmii";
 				status = "okay";
-- 
2.7.4
