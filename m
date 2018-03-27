From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 2/2] arm64: dts: uniphier: add ethernet node for PXs3
Date: Tue, 27 Mar 2018 19:32:46 +0900
Message-ID: <1522146766-14435-3-git-send-email-hayashi.kunihiko@socionext.com>
References: <1522146766-14435-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1522146766-14435-1-git-send-email-hayashi.kunihiko@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Add nodes of the AVE ethernet controller for PXs3 and the boards.
This SoC has two controllers.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 .../arm64/boot/dts/socionext/uniphier-pxs3-ref.dts | 22 +++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi   | 36 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
index 3c71087..f9fa61d 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
@@ -80,3 +80,25 @@
 &nand {
 	status = "okay";
 };
+
+&eth0 {
+	status = "okay";
+	phy-handle = <&ethphy0>;
+};
+
+&eth1 {
+	status = "okay";
+	phy-handle = <&ethphy1>;
+};
+
+&mdio0 {
+	ethphy0: ethphy@0 {
+		reg = <0>;
+	};
+};
+
+&mdio1 {
+	ethphy1: ethphy@0 {
+		reg = <0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index 234fc58..0a5a7c2 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -407,6 +407,42 @@
 			};
 		};
 
+		eth0: ethernet@65000000 {
+			compatible = "socionext,uniphier-pxs3-ave4";
+			status = "disabled";
+			reg = <0x65000000 0x8500>;
+			interrupts = <0 66 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ether_rgmii>;
+			clocks = <&sys_clk 6>;
+			resets = <&sys_rst 6>;
+			phy-mode = "rgmii";
+			local-mac-address = [00 00 00 00 00 00];
+
+			mdio0: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		eth1: ethernet@65200000 {
+			compatible = "socionext,uniphier-pxs3-ave4";
+			status = "disabled";
+			reg = <0x65200000 0x8500>;
+			interrupts = <0 67 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ether1_rgmii>;
+			clocks = <&sys_clk 7>;
+			resets = <&sys_rst 7>;
+			phy-mode = "rgmii";
+			local-mac-address = [00 00 00 00 00 00];
+
+			mdio1: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		nand: nand@68000000 {
 			compatible = "socionext,uniphier-denali-nand-v5b";
 			status = "disabled";
-- 
2.7.4
