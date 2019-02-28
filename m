From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH v2 5/6] ARM: dts: stm32: Add romem and temperature calibration
 on stm32mp157c
Date: Thu, 28 Feb 2019 11:19:55 +0100
Message-ID: <1551349196-8956-6-git-send-email-fabrice.gasnier@st.com>
References: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551349196-8956-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, alexandre.torgue@st.com
Cc: mark.rutland@arm.com, lionel.debieve@st.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add & enable stm32 factory-programmed memory. Describe temperature sensor
calibration cells. Non-volatile calibration data is made available by
stm32mp157c bootrom in bsec_dataX registers.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 8bf1c17..9a7ac80 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -1106,6 +1106,19 @@
 			status = "disabled";
 		};
 
+		bsec: nvmem@5c005000 {
+			compatible = "st,stm32mp15-bsec";
+			reg = <0x5c005000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ts_cal1: calib@5c {
+				reg = <0x5c 0x2>;
+			};
+			ts_cal2: calib@5e {
+				reg = <0x5e 0x2>;
+			};
+		};
+
 		i2c6: i2c@5c009000 {
 			compatible = "st,stm32f7-i2c";
 			reg = <0x5c009000 0x400>;
-- 
2.7.4
