From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH 1/4] ARM: STi: DT: STiH407: 407 DT Entry for clockgen A0
Date: Wed,  4 Jun 2014 16:32:49 +0200
Message-ID: <1401892372-18279-2-git-send-email-gabriel.fernandez@linaro.org>
References: <1401892372-18279-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401892372-18279-1-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, olof@lixom.net
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Olivier Bideau <olivier.bideau@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org

Patch adds DT entries for clockgen A0

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
---
 arch/arm/boot/dts/stih407-clock.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
index 800f46f..e03e86e 100644
--- a/arch/arm/boot/dts/stih407-clock.dtsi
+++ b/arch/arm/boot/dts/stih407-clock.dtsi
@@ -7,6 +7,10 @@
  */
 / {
 	clocks {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
 		/*
 		 * Fixed 30MHz oscillator inputs to SoC
 		 */
@@ -35,5 +39,33 @@
 			clock-frequency = <200000000>;
 			clock-output-names = "clk-s-icn-reg-0";
 		};
+
+		/*
+		 * ClockGenAs on SASG2
+		 */
+		clockgen-a@090ff000 {
+			compatible = "st,clkgen-c32";
+			reg = <0x90ff000 0x1000>;
+
+			clk_s_a0_pll: clk-s-a0-pll {
+				#clock-cells = <1>;
+				compatible = "st,stih407-plls-c32-a0", "st,clkgen-plls-c32";
+
+				clocks = <&clk_sysin>;
+
+				clock-output-names = "clk-s-a0-pll-ofd-0";
+			};
+
+			clk_s_a0_flexgen: clk-s-a0-flexgen {
+				compatible = "st,flexgen";
+
+				#clock-cells = <1>;
+
+				clocks = <&clk_s_a0_pll 0>,
+					 <&clk_sysin>;
+
+				clock-output-names = "clk-ic-lmi0";
+			};
+		};
 	};
 };
-- 
1.9.1
