From: <patrice.chotard@st.com>
Subject: ARM: dts: stm32: relax qspi pins slew-rate for stm32mp157
Date: Fri, 4 Oct 2019 16:44:21 +0200
Message-ID: <20191004144421.21069-1-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, Patrice Chotard <patrice.chotard@st.com>, mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

Relax qspi pins slew-rate to minimize peak currents.

Fixes: 844030057339 ("ARM: dts: stm32: add flash nor support on stm32mp157c eval board")

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index e4a0d51ec3a8..0a3a7d66737b 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -609,13 +609,13 @@
 						 <STM32_PINMUX('F', 6, AF9)>; /* QSPI_BK1_IO3 */
 					bias-disable;
 					drive-push-pull;
-					slew-rate = <3>;
+					slew-rate = <1>;
 				};
 				pins2 {
 					pinmux = <STM32_PINMUX('B', 6, AF10)>; /* QSPI_BK1_NCS */
 					bias-pull-up;
 					drive-push-pull;
-					slew-rate = <3>;
+					slew-rate = <1>;
 				};
 			};
 
@@ -637,13 +637,13 @@
 						 <STM32_PINMUX('G', 7, AF11)>; /* QSPI_BK2_IO3 */
 					bias-disable;
 					drive-push-pull;
-					slew-rate = <3>;
+					slew-rate = <1>;
 				};
 				pins2 {
 					pinmux = <STM32_PINMUX('C', 0, AF10)>; /* QSPI_BK2_NCS */
 					bias-pull-up;
 					drive-push-pull;
-					slew-rate = <3>;
+					slew-rate = <1>;
 				};
 			};
 
-- 
2.17.1
