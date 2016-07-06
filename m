From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v6 10/18] ARM: DT: STiH407: Add i2s_out pinctrl configuration
Date: Wed,  6 Jul 2016 09:54:28 +0100
Message-ID: <1467795276-21725-11-git-send-email-peter.griffin@linaro.org>
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

This patch adds the pinctrl config for the i2s_out pins
used by the uniperif player IP.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index a538ae5..0fb5c8a 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -1067,6 +1067,29 @@
 				};
 			};
 
+			i2s_out {
+				pinctrl_i2s_8ch_out: i2s_8ch_out{
+					st,pins {
+						mclk = <&pio33 5 ALT1 OUT>;
+						lrclk = <&pio33 7 ALT1 OUT>;
+						sclk = <&pio33 6 ALT1 OUT>;
+						data0 = <&pio33 4 ALT1 OUT>;
+						data1 = <&pio34 0 ALT1 OUT>;
+						data2 = <&pio34 1 ALT1 OUT>;
+						data3 = <&pio34 2 ALT1 OUT>;
+					};
+				};
+
+				pinctrl_i2s_2ch_out: i2s_2ch_out{
+					st,pins {
+						mclk = <&pio33 5 ALT1 OUT>;
+						lrclk = <&pio33 7 ALT1 OUT>;
+						sclk = <&pio33 6 ALT1 OUT>;
+						data0 = <&pio33 4 ALT1 OUT>;
+					};
+				};
+			};
+
 			serial3 {
 				pinctrl_serial3: serial3-0 {
 					st,pins {
-- 
1.9.1
