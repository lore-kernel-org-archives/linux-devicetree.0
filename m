From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 05/11] ARM: DT: STiH407: Add SPI FSM (NOR Flash) Controller
 pin config
Date: Fri, 11 Sep 2015 18:06:28 +0100
Message-ID: <1441991194-11948-6-git-send-email-peter.griffin@linaro.org>
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
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org, Christophe Kerello <christophe.kerello@st.com>, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

This patch adds the pin configuration for the NOR flash controller.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 6c81f35..d0f5fdd 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -872,6 +872,19 @@
 					};
 				};
 			};
+
+			fsm {
+				pinctrl_fsm: fsm {
+					st,pins {
+						spi-fsm-clk = <&pio40 1 ALT1 OUT>;
+						spi-fsm-cs = <&pio40 0 ALT1 OUT>;
+						spi-fsm-mosi = <&pio40 2 ALT1 OUT>;
+						spi-fsm-miso = <&pio40 3 ALT1 IN>;
+						spi-fsm-hol = <&pio40 5 ALT1 OUT>;
+						spi-fsm-wp = <&pio40 4 ALT1 OUT>;
+					};
+				};
+			};
 		};
 	};
 };
-- 
1.9.1
