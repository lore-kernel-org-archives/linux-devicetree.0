From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 02/11] ARM: STi: DT: STiH407: Add i2c3 alternate pin configs
Date: Mon, 28 Sep 2015 13:37:38 +0100
Message-ID: <1443443867-4099-3-git-send-email-peter.griffin@linaro.org>
References: <1443443867-4099-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1443443867-4099-1-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, patrice.chotard@st.com, srinivas.kandagatla@gmail.com
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org, lee.jones@linaro.org, Seraphin Bonnaffe <seraphin.bonnaffe@st.com>
List-Id: devicetree@vger.kernel.org

i2c3 controller can use several sets of pins depending
on board design. This patch adds the missing alternate
pinconfigs.

Signed-off-by: Seraphin Bonnaffe <seraphin.bonnaffe@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 30db453..135920e 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -430,12 +430,24 @@
 			};
 
 			i2c3 {
-				pinctrl_i2c3_default: i2c3-default {
+				pinctrl_i2c3_default: i2c3-alt1-0 {
 					st,pins {
 						sda = <&pio18 6 ALT1 BIDIR>;
 						scl = <&pio18 5 ALT1 BIDIR>;
 					};
 				};
+				pinctrl_i2c3_alt1_1: i2c3-alt1-1 {
+					st,pins {
+						sda = <&pio17 7 ALT1 BIDIR>;
+						scl = <&pio17 6 ALT1 BIDIR>;
+					};
+				};
+				pinctrl_i2c3_alt3_0: i2c3-alt3-0 {
+					st,pins {
+						sda = <&pio13 6 ALT3 BIDIR>;
+						scl = <&pio13 5 ALT3 BIDIR>;
+					};
+				};
 			};
 
 			spi0 {
-- 
1.9.1
