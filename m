From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 4/4] arm64: dts: uniphier: Add USB2 phy nodes
Date: Tue,  2 Oct 2018 20:12:02 +0900
Message-ID: <1538478722-20351-5-git-send-email-hayashi.kunihiko@socionext.com>
References: <1538478722-20351-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1538478722-20351-1-git-send-email-hayashi.kunihiko@socionext.com>
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

Add nodes of USB2 physical layer for UniPhier SoC. This supports LD11.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index d63b56e..be3fc1a 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -432,6 +432,8 @@
 				 <&mio_clk 12>;
 			resets = <&sys_rst 8>, <&mio_rst 7>, <&mio_rst 8>,
 				 <&mio_rst 12>;
+			phy-names = "usb";
+			phys = <&usb_phy0>;
 			has-transaction-translator;
 		};
 
@@ -446,6 +448,8 @@
 				 <&mio_clk 13>;
 			resets = <&sys_rst 8>, <&mio_rst 7>, <&mio_rst 9>,
 				 <&mio_rst 13>;
+			phy-names = "usb";
+			phys = <&usb_phy1>;
 			has-transaction-translator;
 		};
 
@@ -460,6 +464,8 @@
 				 <&mio_clk 14>;
 			resets = <&sys_rst 8>, <&mio_rst 7>, <&mio_rst 10>,
 				 <&mio_rst 14>;
+			phy-names = "usb";
+			phys = <&usb_phy2>;
 			has-transaction-translator;
 		};
 
@@ -488,6 +494,27 @@
 			pinctrl: pinctrl {
 				compatible = "socionext,uniphier-ld11-pinctrl";
 			};
+
+			usb-phy {
+				compatible = "socionext,uniphier-ld11-usb2-phy";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				usb_phy0: phy@0 {
+					reg = <0>;
+					#phy-cells = <0>;
+				};
+
+				usb_phy1: phy@1 {
+					reg = <1>;
+					#phy-cells = <0>;
+				};
+
+				usb_phy2: phy@2 {
+					reg = <2>;
+					#phy-cells = <0>;
+				};
+			};
 		};
 
 		soc-glue@5f900000 {
-- 
2.7.4
