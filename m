From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 07/11] ARM: DT: STiH407: Add systrace pin configuration
Date: Fri, 11 Sep 2015 18:06:30 +0100
Message-ID: <1441991194-11948-8-git-send-email-peter.griffin@linaro.org>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
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
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

This patch adds the pin config for systrace for
STiH407 family silicon.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index cde776b..798d901 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -658,6 +658,18 @@
 					};
 				};
 			};
+
+			systrace {
+				pinctrl_systrace_default: systrace-default {
+					st,pins {
+						trc_data0 = <&pio11 3 ALT5 OUT>;
+						trc_data1 = <&pio11 4 ALT5 OUT>;
+						trc_data2 = <&pio11 5 ALT5 OUT>;
+						trc_data3 = <&pio11 6 ALT5 OUT>;
+						trc_clk   = <&pio11 7 ALT5 OUT>;
+					};
+				};
+			};
 		};
 
 		pin-controller-front1 {
-- 
1.9.1
