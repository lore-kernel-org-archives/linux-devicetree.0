From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v6 11/18] ARM: DT: STiH407: Add i2s_in pinctrl configuration
Date: Wed,  6 Jul 2016 09:54:29 +0100
Message-ID: <1467795276-21725-12-git-send-email-peter.griffin@linaro.org>
References: <1467795276-21725-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467795276-21725-1-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: peter.griffin@linaro.org, dmaengine@vger.kernel.org, lee.jones@linaro.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the pinctrl config for the i2s_in pins
used by the uniperif reader IP.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 0fb5c8a..537db7e 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -1090,6 +1090,30 @@
 				};
 			};
 
+			i2s_in {
+				pinctrl_i2s_8ch_in: i2s_8ch_in{
+					st,pins {
+						mclk = <&pio32 5 ALT1 IN>;
+						lrclk = <&pio32 7 ALT1 IN>;
+						sclk = <&pio32 6 ALT1 IN>;
+						data0 = <&pio32 4 ALT1 IN>;
+						data1 = <&pio33 0 ALT1 IN>;
+						data2 = <&pio33 1 ALT1 IN>;
+						data3 = <&pio33 2 ALT1 IN>;
+						data4 = <&pio33 3 ALT1 IN>;
+					};
+				};
+
+				pinctrl_i2s_2ch_in: i2s_2ch_in{
+					st,pins {
+						mclk = <&pio32 5 ALT1 IN>;
+						lrclk = <&pio32 7 ALT1 IN>;
+						sclk = <&pio32 6 ALT1 IN>;
+						data0 = <&pio32 4 ALT1 IN>;
+					};
+				};
+			};
+
 			serial3 {
 				pinctrl_serial3: serial3-0 {
 					st,pins {
-- 
1.9.1
