From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 04/11] ARM: DT: STiH407: Add serial3 pinctrl configuration
Date: Fri, 11 Sep 2015 18:06:27 +0100
Message-ID: <1441991194-11948-5-git-send-email-peter.griffin@linaro.org>
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
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>, lee.jones@linaro.org, Erwan Le Ray <erwan.leray@st.com>
List-Id: devicetree@vger.kernel.org

Add missing serial 3 pinctrl config. This can be used
on b2206 HVK, where it defaults to PIO31[3] & PIO31[4],
alternate 1.

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Acked-by: Carmelo Amoroso <carmelo.amoroso@st.com>
Acked-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index bb3b0c7..6c81f35 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -809,6 +809,15 @@
 					};
 				};
 			};
+
+			serial3 {
+				pinctrl_serial3: serial3-0 {
+					st,pins {
+						tx = <&pio31 3 ALT1 OUT>;
+						rx = <&pio31 4 ALT1 IN>;
+					};
+				};
+			};
 		};
 
 		pin-controller-flash {
-- 
1.9.1
