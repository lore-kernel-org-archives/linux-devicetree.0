From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v4 1/6] ARM: DT: STi: stihxxx-b2120: Add pulse-width properties to ssc2 & ssc3
Date: Tue,  1 Sep 2015 11:48:09 +0100
Message-ID: <1441104494-10468-2-git-send-email-peter.griffin@linaro.org>
References: <1441104494-10468-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1441104494-10468-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, mchehab@osg.samsung.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, valentinrothberg@gmail.com, hugues.fruchet@st.com
List-Id: devicetree@vger.kernel.org

Adding these properties makes the I2C bus to the demodulators much
more reliable, and we no longer suffer from I2C errors when tuning.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stihxxx-b2120.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
index f589fe4..62994ae 100644
--- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
@@ -27,12 +27,18 @@
 			};
 		};
 
-		i2c@9842000 {
+		ssc2: i2c@9842000 {
 			status = "okay";
+			clock-frequency = <100000>;
+			st,i2c-min-scl-pulse-width-us = <0>;
+			st,i2c-min-sda-pulse-width-us = <5>;
 		};
 
-		i2c@9843000 {
+		ssc3: i2c@9843000 {
 			status = "okay";
+			clock-frequency = <100000>;
+			st,i2c-min-scl-pulse-width-us = <0>;
+			st,i2c-min-sda-pulse-width-us = <5>;
 		};
 
 		i2c@9844000 {
-- 
1.9.1
