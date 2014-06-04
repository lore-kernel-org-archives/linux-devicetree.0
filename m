From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH 3/4] ARM: STi: DT: STiH407: 407 DT Entry for clockgen D0/D2/D3
Date: Wed,  4 Jun 2014 16:32:51 +0200
Message-ID: <1401892372-18279-4-git-send-email-gabriel.fernandez@linaro.org>
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

Patch adds DT entries for clockgen D0/D2/D3

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
---
 arch/arm/boot/dts/stih407-clock.dtsi | 126 +++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
index 85cc135..6e59011 100644
--- a/arch/arm/boot/dts/stih407-clock.dtsi
+++ b/arch/arm/boot/dts/stih407-clock.dtsi
@@ -139,5 +139,131 @@
 						     "clk-compo-dvp";
 			};
 		};
+
+		clk_s_d0_quadfs: clk-s-d0-quadfs@9104000 {
+			#clock-cells = <1>;
+			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			reg = <0x9104000 0x1000>;
+
+			clocks = <&clk_sysin>;
+
+			clock-output-names = "clk-s-d0-fs0-ch0",
+					     "clk-s-d0-fs0-ch1",
+					     "clk-s-d0-fs0-ch2",
+					     "clk-s-d0-fs0-ch3";
+		};
+
+		clockgen-d0@09104000 {
+			compatible = "st,clkgen-c32";
+			reg = <0x9104000 0x1000>;
+
+			clk_s_d0_flexgen: clk-s-d0-flexgen {
+				#clock-cells = <1>;
+				compatible = "st,flexgen";
+
+				clocks = <&clk_s_d0_quadfs 0>,
+					 <&clk_s_d0_quadfs 1>,
+					 <&clk_s_d0_quadfs 2>,
+					 <&clk_s_d0_quadfs 3>,
+					 <&clk_sysin>;
+
+				clock-output-names = "clk-pcm-0",
+						     "clk-pcm-1",
+						     "clk-pcm-2",
+						     "clk-spdiff";
+			};
+		};
+
+		clk_s_d2_quadfs: clk-s-d2-quadfs@9106000 {
+			#clock-cells = <1>;
+			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			reg = <0x9106000 0x1000>;
+
+			clocks = <&clk_sysin>;
+
+			clock-output-names = "clk-s-d2-fs0-ch0",
+					     "clk-s-d2-fs0-ch1",
+					     "clk-s-d2-fs0-ch2",
+					     "clk-s-d2-fs0-ch3";
+		};
+
+		clk_tmdsout_hdmi: clk-tmdsout-hdmi {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <0>;
+		};
+
+		clockgen-d2@x9106000 {
+			compatible = "st,clkgen-c32";
+			reg = <0x9106000 0x1000>;
+
+			clk_s_d2_flexgen: clk-s-d2-flexgen {
+				#clock-cells = <1>;
+				compatible = "st,flexgen";
+
+				clocks = <&clk_s_d2_quadfs 0>,
+					 <&clk_s_d2_quadfs 1>,
+					 <&clk_s_d2_quadfs 2>,
+					 <&clk_s_d2_quadfs 3>,
+					 <&clk_sysin>,
+					 <&clk_sysin>,
+					 <&clk_tmdsout_hdmi>;
+
+				clock-output-names = "clk-pix-main-disp",
+						     "clk-pix-pip",
+						     "clk-pix-gdp1",
+						     "clk-pix-gdp2",
+						     "clk-pix-gdp3",
+						     "clk-pix-gdp4",
+						     "clk-pix-aux-disp",
+						     "clk-denc",
+						     "clk-pix-hddac",
+						     "clk-hddac",
+						     "clk-sddac",
+						     "clk-pix-dvo",
+						     "clk-dvo",
+						     "clk-pix-hdmi",
+						     "",
+						     "clk-ref-hdmiphy";
+						     };
+		};
+
+		clk_s_d3_quadfs: clk-s-d3-quadfs@9107000 {
+			#clock-cells = <1>;
+			compatible = "st,stih407-quadfs660-D", "st,quadfs";
+			reg = <0x9107000 0x1000>;
+
+			clocks = <&clk_sysin>;
+
+			clock-output-names = "clk-s-d3-fs0-ch0",
+					     "clk-s-d3-fs0-ch1",
+					     "clk-s-d3-fs0-ch2",
+					     "clk-s-d3-fs0-ch3";
+		};
+
+		clockgen-d3@9107000 {
+			compatible = "st,clkgen-c32";
+			reg = <0x9107000 0x1000>;
+
+			clk_s_d3_flexgen: clk-s-d3-flexgen {
+				#clock-cells = <1>;
+				compatible = "st,flexgen";
+
+				clocks = <&clk_s_d3_quadfs 0>,
+					 <&clk_s_d3_quadfs 1>,
+					 <&clk_s_d3_quadfs 2>,
+					 <&clk_s_d3_quadfs 3>,
+					 <&clk_sysin>;
+
+				clock-output-names = "clk-stfe-frc1",
+						     "clk-tsout-0",
+						     "clk-tsout-1",
+						     "clk-mchi",
+						     "clk-vsens-compo",
+						     "clk-frc1-remote",
+						     "clk-lpc-0",
+						     "clk-lpc-1";
+			};
+		};
 	};
 };
-- 
1.9.1
