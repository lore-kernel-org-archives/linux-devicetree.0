From: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 02/12] ARM: dts: socfpga: set desired i2c clock on Cyclone5 and Arria5 devkits
Date: Wed,  4 Jan 2017 18:21:24 -0600
Message-ID: <1483575694-29599-3-git-send-email-dinguyen@kernel.org>
References: <1483575694-29599-1-git-send-email-dinguyen@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483575694-29599-1-git-send-email-dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The I2C LCD display on the Cyclone5 and Arria5 devkits is only capable of
the standard 100 kHz clock. Set the "clock-frequency" of the I2C node
to be 100000.

Signed-off-by: Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/socfpga_arria5_socdk.dts   | 8 ++++++++
 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria5_socdk.dts b/arch/arm/boot/dts/socfpga_arria5_socdk.dts
index fa70c39..8672edf 100644
--- a/arch/arm/boot/dts/socfpga_arria5_socdk.dts
+++ b/arch/arm/boot/dts/socfpga_arria5_socdk.dts
@@ -98,6 +98,14 @@
 
 &i2c0 {
 	status = "okay";
+	clock-frequency = <100000>;
+
+	/*
+	 * adjust the falling times to decrease the i2c frequency to 50Khz
+	 * because the LCD module does not work at the standard 100Khz
+	 */
+	i2c-sda-falling-time-ns = <5000>;
+	i2c-scl-falling-time-ns = <5000>;
 
 	eeprom@51 {
 		compatible = "atmel,24c32";
diff --git a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
index 6d3188b..24650ba 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
@@ -98,6 +98,14 @@
 
 &i2c0 {
 	status = "okay";
+	clock-frequency = <100000>;
+
+	/*
+	 * adjust the falling times to decrease the i2c frequency to 50Khz
+	 * because the LCD module does not work at the standard 100Khz
+	 */
+	i2c-sda-falling-time-ns = <5000>;
+	i2c-scl-falling-time-ns = <5000>;
 
 	eeprom@51 {
 		compatible = "atmel,24c32";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
