From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 1/4] arm64: dts: Add display subsystem DT nodes for
 hi6220-hikey
Date: Mon, 22 Aug 2016 15:48:02 -0700
Message-ID: <1471906085-16682-1-git-send-email-john.stultz@linaro.org>
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
To: lkml <linux-kernel@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>, Xinliang Liu <xinliang.liu@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Xinliang Liu <xinliang.liu@linaro.org>

Add ade and dsi DT nodes for hikey board.

Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts |  8 ++++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 55 ++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 593c7e4..c2f014e 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -372,3 +372,11 @@
 &uart3 {
 	label = "LS-UART1";
 };
+
+&ade {
+	status = "ok";
+};
+
+&dsi {
+	status = "ok";
+};
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 4f27041..d0b887a 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -262,6 +262,11 @@
 			#clock-cells = <1>;
 		};
 
+		medianoc_ade: medianoc_ade@f4520000 {
+			compatible = "syscon";
+			reg = <0x0 0xf4520000 0x0 0x4000>;
+		};
+
 		stub_clock: stub_clock {
 			compatible = "hisilicon,hi6220-stub-clk";
 			hisilicon,hi6220-clk-sram = <&sram>;
@@ -850,5 +855,55 @@
 				};
 			};
 		};
+
+		ade: ade@f4100000 {
+			compatible = "hisilicon,hi6220-ade";
+			reg = <0x0 0xf4100000 0x0 0x7800>;
+			reg-names = "ade_base";
+			hisilicon,noc-syscon = <&medianoc_ade>;
+			resets = <&media_ctrl MEDIA_ADE>;
+			interrupts = <0 115 4>; /* ldi interrupt */
+
+			clocks = <&media_ctrl HI6220_ADE_CORE>,
+				 <&media_ctrl HI6220_CODEC_JPEG>,
+				 <&media_ctrl HI6220_ADE_PIX_SRC>;
+			/*clock name*/
+			clock-names  = "clk_ade_core",
+				       "clk_codec_jpeg",
+				       "clk_ade_pix";
+
+			assigned-clocks = <&media_ctrl HI6220_ADE_CORE>,
+				<&media_ctrl HI6220_CODEC_JPEG>;
+			assigned-clock-rates = <360000000>, <288000000>;
+			dma-coherent;
+			status = "disabled";
+
+			port {
+				ade_out: endpoint {
+					remote-endpoint = <&dsi_in>;
+				};
+			};
+		};
+
+		dsi: dsi@f4107800 {
+			compatible = "hisilicon,hi6220-dsi";
+			reg = <0x0 0xf4107800 0x0 0x100>;
+			clocks = <&media_ctrl  HI6220_DSI_PCLK>;
+			clock-names = "pclk";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* 0 for input port */
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&ade_out>;
+					};
+				};
+			};
+		};
 	};
 };
-- 
1.9.1
