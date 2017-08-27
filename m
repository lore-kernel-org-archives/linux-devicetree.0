From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] ARM: dts: uniphier: add AIDET nodes
Date: Sun, 27 Aug 2017 21:02:30 +0900
Message-ID: <1503835351-9685-1-git-send-email-yamada.masahiro@socionext.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Add UniPhier AIDET (ARM Interrupt Detector) nodes to support
active low interrupts.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/uniphier-ld4.dtsi  | 7 +++++++
 arch/arm/boot/dts/uniphier-pro4.dtsi | 7 +++++++
 arch/arm/boot/dts/uniphier-pro5.dtsi | 7 +++++++
 arch/arm/boot/dts/uniphier-pxs2.dtsi | 7 +++++++
 arch/arm/boot/dts/uniphier-sld8.dtsi | 7 +++++++
 5 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-ld4.dtsi b/arch/arm/boot/dts/uniphier-ld4.dtsi
index 91410609b181..79183db5b386 100644
--- a/arch/arm/boot/dts/uniphier-ld4.dtsi
+++ b/arch/arm/boot/dts/uniphier-ld4.dtsi
@@ -270,6 +270,13 @@
 			interrupt-controller;
 		};
 
+		aidet: aidet@61830000 {
+			compatible = "socionext,uniphier-ld4-aidet";
+			reg = <0x61830000 0x200>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		sysctrl@61840000 {
 			compatible = "socionext,uniphier-ld4-sysctrl",
 				     "simple-mfd", "syscon";
diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
index 0c43d7836015..b3dbbd9b6e39 100644
--- a/arch/arm/boot/dts/uniphier-pro4.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
@@ -268,6 +268,13 @@
 			};
 		};
 
+		aidet: aidet@5fc20000 {
+			compatible = "socionext,uniphier-pro4-aidet";
+			reg = <0x5fc20000 0x200>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		timer@60000200 {
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0x60000200 0x20>;
diff --git a/arch/arm/boot/dts/uniphier-pro5.dtsi b/arch/arm/boot/dts/uniphier-pro5.dtsi
index 36b64e53ed2e..41a6493ed29a 100644
--- a/arch/arm/boot/dts/uniphier-pro5.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro5.dtsi
@@ -331,6 +331,13 @@
 			};
 		};
 
+		aidet: aidet@5fc20000 {
+			compatible = "socionext,uniphier-pro5-aidet";
+			reg = <0x5fc20000 0x200>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		timer@60000200 {
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0x60000200 0x20>;
diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
index ed2b9a4516aa..37bbaa4b4de5 100644
--- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
@@ -315,6 +315,13 @@
 			};
 		};
 
+		aidet: aidet@5fc20000 {
+			compatible = "socionext,uniphier-pxs2-aidet";
+			reg = <0x5fc20000 0x200>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		timer@60000200 {
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0x60000200 0x20>;
diff --git a/arch/arm/boot/dts/uniphier-sld8.dtsi b/arch/arm/boot/dts/uniphier-sld8.dtsi
index 5b0b2f822519..b08390332971 100644
--- a/arch/arm/boot/dts/uniphier-sld8.dtsi
+++ b/arch/arm/boot/dts/uniphier-sld8.dtsi
@@ -270,6 +270,13 @@
 			interrupt-controller;
 		};
 
+		aidet: aidet@61830000 {
+			compatible = "socionext,uniphier-sld8-aidet";
+			reg = <0x61830000 0x200>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		sysctrl@61840000 {
 			compatible = "socionext,uniphier-sld8-sysctrl",
 				     "simple-mfd", "syscon";
-- 
2.7.4
