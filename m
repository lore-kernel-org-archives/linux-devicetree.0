From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 4/9] ARM: STi: DT: Add STiH407 family tsin3 pinctrl
 configuration
Date: Wed, 10 Jun 2015 15:04:01 +0100
Message-ID: <1433945046-19855-5-git-send-email-peter.griffin@linaro.org>
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

tsin3 channel can only be configured for serial data transfer.

On B2120 reference design tsin3 is brought out as TSB on the NIMB
slot of the B2004A daughter board.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 6b11568..13b469c 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -522,6 +522,18 @@
 					};
 				};
 			};
+
+			tsin3 {
+				pinctrl_tsin3_serial: tsin3_serial {
+					st,pins {
+						DATA7 = <&pio14 1 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						CLKIN = <&pio14 0 ALT1 IN CLKNOTDATA 0 CLK_A>;
+						VALID = <&pio13 6 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						ERROR = <&pio13 5 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+						PKCLK = <&pio13 7 ALT1 IN SE_NICLK_IO 0 CLK_A>;
+					};
+				};
+			};
 		};
 
 		pin-controller-front1 {
-- 
1.9.1
