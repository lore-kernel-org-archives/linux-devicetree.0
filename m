From: <dinguyen@opensource.altera.com>
Subject: [PATCH 2/2] ARM: socfpga: dts: enable USB and I2C on Arria10 SoCDK
Date: Wed, 23 Sep 2015 17:11:15 -0500
Message-ID: <1443046275-26421-2-git-send-email-dinguyen@opensource.altera.com>
References: <1443046275-26421-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1443046275-26421-1-git-send-email-dinguyen@opensource.altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mark.rutland@arm.com, pawel.moll@arm.com
Cc: devicetree@vger.kernel.org, Dinh Nguyen <dinguyen@opensource.altera.com>, dinh.linux@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen@opensource.altera.com>

On the Arria10 Devkit, the I2C bus has a serial EEPROM and an RTC
hanging off it. Also, enable the USB node.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index 99aa9a1..567df98 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -70,6 +70,33 @@
 	status = "okay";
 };
 
+&i2c1 {
+	speed-mode = <0>;
+	status = "okay";
+
+	/*
+	 * adjust the falling times to decrease the i2c frequency to 50Khz
+	 * because the LCD module does not work at the standard 100Khz
+	 */
+	i2c-sda-falling-time-ns = <6000>;
+	i2c-scl-falling-time-ns = <6000>;
+
+	eeprom@51 {
+		compatible = "atmel,24c32";
+		reg = <0x51>;
+		pagesize = <32>;
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1339";
+		reg = <0x68>;
+	};
+};
+
 &uart1 {
 	status = "okay";
 };
+
+&usb0 {
+	status = "okay";
+};
-- 
2.4.5
