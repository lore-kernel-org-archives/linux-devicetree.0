From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 4/4] ARM: STi: DT: STiH407: Add DT node for at24c256 eeprom
Date: Tue, 12 Apr 2016 14:57:28 +0100
Message-ID: <1460469448-9065-5-git-send-email-peter.griffin@linaro.org>
References: <1460469448-9065-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460469448-9065-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

More accurately describe the i2c bus hardware by including a dt
node for the eeprom device.

Now that at24c256 can be accessed via the nvmem framework it
allows for example the stmmac driver to be extended to get
the MAC address from the at24c256 eeprom.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
 - Add more verbose patch description
---
 arch/arm/boot/dts/stihxxx-b2120.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
index 133375b..0d7c6dd 100644
--- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
@@ -58,6 +58,15 @@
 
 		i2c@9845000 {
 			status = "okay";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@50 {
+				compatible = "at,24c256";
+				pagesize = <64>;
+				reg = <0x50>;
+			};
 		};
 
 		i2c@9540000 {
-- 
1.9.1
