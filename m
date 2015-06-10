From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 3/9] ARM: STi: DT: Add STiH407 family tsin2 pinctrl
 configuration
Date: Wed, 10 Jun 2015 15:04:00 +0100
Message-ID: <1433945046-19855-4-git-send-email-peter.griffin@linaro.org>
References: <1433945046-19855-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1433945046-19855-1-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org, lee.jones@linaro.org, hugues.fruchet@st.com
List-Id: devicetree@vger.kernel.org

tsin2 channel can be configured for either serial or parallel data
transfer. This patch adds the pinctrl config for both possibilities.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 7b1b652..6b11568 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -494,6 +494,34 @@
 					};
 				};
 			};
+
+			tsin2 {
+				pinctrl_tsin2_parallel: tsin2_parallel {
+					st,pins {
+						DATA7 = <&pio13 4 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						DATA6 = <&pio13 5 ALT2 IN SE_NICLK_IO 0 CLK_B>;
+						DATA5 = <&pio13 6 ALT2 IN SE_NICLK_IO 0 CLK_B>;
+						DATA4 = <&pio13 7 ALT2 IN SE_NICLK_IO 0 CLK_B>;
+						DATA3 = <&pio14 0 ALT2 IN SE_NICLK_IO 0 CLK_A>;
+						DATA2 = <&pio14 1 ALT2 IN SE_NICLK_IO 0 CLK_B>;
+						DATA1 = <&pio14 2 ALT2 IN SE_NICLK_IO 0 CLK_A>;
+						DATA0 = <&pio14 3 ALT2 IN SE_NICLK_IO 0 CLK_A>;
+						CLKIN = <&pio13 3 ALT1 IN CLKNOTDATA 0 CLK_A>;
+						VALID = <&pio13 1 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						ERROR = <&pio13 0 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						PKCLK = <&pio13 2 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+					};
+				};
+				pinctrl_tsin2_serial: tsin2_serial {
+					st,pins {
+						DATA7 = <&pio13 4 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						CLKIN = <&pio13 3 ALT1 IN CLKNOTDATA 0 CLK_A>;
+						VALID = <&pio13 1 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						ERROR = <&pio13 0 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						PKCLK = <&pio13 2 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+					};
+				};
+			};
 		};
 
 		pin-controller-front1 {
-- 
1.9.1
