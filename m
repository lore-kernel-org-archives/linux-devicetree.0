From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 02/13] ARM: STi: DT: STiH416: Add DT node for the stih415/6
 usb2 phy
Date: Fri,  7 Nov 2014 11:57:44 +0000
Message-ID: <1415361475-6218-3-git-send-email-peter.griffin@linaro.org>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
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
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

This usb picophy is found on stih415/6 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih416.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
index 1137bdf..0f3019a 100644
--- a/arch/arm/boot/dts/stih416.dtsi
+++ b/arch/arm/boot/dts/stih416.dtsi
@@ -316,5 +316,14 @@
 
 			status	        = "disabled";
 		};
+
+		usb2_phy: usb2phy@0 {
+			compatible = "st,stih416-usb-phy";
+			#phy-cells = <0>;
+			st,syscfg = <&syscfg_rear>;
+			clocks = <&clk_sysin>;
+			clock-names = "osc_phy";
+
+		};
 	};
 };
-- 
1.9.1
