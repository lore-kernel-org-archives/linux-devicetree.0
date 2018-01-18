From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v2 3/3] ARM: dts: at91: tse850: make the sound dai cell count explicit
Date: Thu, 18 Jan 2018 12:46:16 +0100
Message-ID: <20180118114616.6639-4-peda@axentia.se>
References: <20180118114616.6639-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180118114616.6639-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The node is referred to as a DAI from the sound node and should
therefore have a #sound-dai-cells property.

Fixes: 21dd0ece34c2 ("ARM: dts: at91: add devicetree for the Axentia TSE-850")
Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/arm/boot/dts/at91-tse850-3.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/at91-tse850-3.dts b/arch/arm/boot/dts/at91-tse850-3.dts
index 9b82cc8843e1..16e6e60aa67a 100644
--- a/arch/arm/boot/dts/at91-tse850-3.dts
+++ b/arch/arm/boot/dts/at91-tse850-3.dts
@@ -234,6 +234,7 @@
 		compatible = "ti,pcm5142";
 
 		reg = <0x4c>;
+		#sound-dai-cells = <0>;
 
 		AVDD-supply = <&reg_3v3>;
 		DVDD-supply = <&reg_3v3>;
-- 
2.11.0
