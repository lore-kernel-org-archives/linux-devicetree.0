From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v2 5/6] ARM: DTS: da850-evm: Add node for tlv320aic3106 codec
Date: Fri, 1 Aug 2014 09:13:29 +0300
Message-ID: <1406873610-5037-6-git-send-email-peter.ujfalusi@ti.com>
References: <1406873610-5037-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406873610-5037-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nsekhar@ti.com, robh+dt@kernel.org
Cc: khilman@deeprootsystems.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, davinci-linux-open-source@linux.davincidsp.com, pawel.moll@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The board uses aic3106 for audio.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/da850-evm.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index 1422c311af4c..41715b495861 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -51,6 +51,19 @@
 			tps: tps@48 {
 				reg = <0x48>;
 			};
+			tlv320aic3106: tlv320aic3106@18 {
+				compatible = "ti,tlv320aic3106";
+				reg = <0x18>;
+				status = "okay";
+
+				/* Regulators */
+				IOVDD-supply = <&vdcdc2_reg>;
+				/* Derived from VBAT: Baseboard 3.3V / 1.8V */
+				AVDD-supply = <&vbat>;
+				DRVDD-supply = <&vbat>;
+				DVDD-supply = <&vbat>;
+			};
+
 		};
 		wdt: wdt@1c21000 {
 			status = "okay";
-- 
2.0.2
