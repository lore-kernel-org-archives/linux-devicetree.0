From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 2/9] ARM: STi: DT: Add STiH407 family tsin1 pinctrl
 configuration
Date: Wed, 10 Jun 2015 15:03:59 +0100
Message-ID: <1433945046-19855-3-git-send-email-peter.griffin@linaro.org>
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

tsin1 channel can be configured for either serial or parallel data
transfer. This patch adds the pinctrl config for both possibilities.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index c8c8e84..7b1b652 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -466,6 +466,34 @@
 					};
 				};
 			};
+
+			tsin1 {
+				pinctrl_tsin1_parallel: tsin1_parallel {
+					st,pins {
+						DATA7 = <&pio12 0 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						DATA6 = <&pio12 1 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						DATA5 = <&pio12 2 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						DATA4 = <&pio12 3 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						DATA3 = <&pio12 4 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						DATA2 = <&pio12 5 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						DATA1 = <&pio12 6 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						DATA0 = <&pio12 7 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						CLKIN = <&pio11 7 ALT1 IN CLKNOTDATA 0 CLK_A>;
+						VALID = <&pio11 5 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						ERROR = <&pio11 4 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						PKCLK = <&pio11 6 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+					};
+				};
+				pinctrl_tsin1_serial: tsin1_serial {
+					st,pins {
+						DATA7 = <&pio12 0 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						CLKIN = <&pio11 7 ALT1 IN CLKNOTDATA 0 CLK_A>;
+						VALID = <&pio11 5 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						ERROR = <&pio11 4 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						PKCLK = <&pio11 6 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+					};
+				};
+			};
 		};
 
 		pin-controller-front1 {
-- 
1.9.1
