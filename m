From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/9] ARM: dts: uniphier: factor out ranges property of support
 card
Date: Fri, 26 Feb 2016 16:18:29 +0900
Message-ID: <1456471116-8140-3-git-send-email-yamada.masahiro@socionext.com>
References: <1456471116-8140-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1456471116-8140-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This property is used in common by several boards.  Move it to the
common place (uniphier-support-card.dtsi).  If necessary, each board
can still override the property.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts              | 8 --------
 arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts             | 8 --------
 arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts             | 8 --------
 arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts             | 8 --------
 arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts             | 8 --------
 arch/arm/boot/dts/uniphier-support-card.dtsi            | 3 +++
 arch/arm64/boot/dts/socionext/uniphier-ph1-ld20-ref.dts | 8 --------
 7 files changed, 3 insertions(+), 48 deletions(-)

diff --git a/arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts b/arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts
index f1e9d40..ec94b7a 100644
--- a/arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts
@@ -72,14 +72,6 @@
 	};
 };
 
-&extbus {
-	ranges = <1 0x00000000 0x42000000 0x02000000>;
-};
-
-&support_card {
-	ranges = <0x00000000 1 0x01f00000 0x00100000>;
-};
-
 &ethsc {
 	interrupts = <0 49 4>;
 };
diff --git a/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts b/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts
index 5baa9fc..b8134c6 100644
--- a/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ph1-ld6b-ref.dts
@@ -74,14 +74,6 @@
 	};
 };
 
-&extbus {
-	ranges = <1 0x00000000 0x42000000 0x02000000>;
-};
-
-&support_card {
-	ranges = <0x00000000 1 0x01f00000 0x00100000>;
-};
-
 &ethsc {
 	interrupts = <0 52 4>;
 };
diff --git a/arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts b/arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts
index 2462668..95f631a 100644
--- a/arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts
@@ -74,14 +74,6 @@
 	};
 };
 
-&extbus {
-	ranges = <1 0x00000000 0x42000000 0x02000000>;
-};
-
-&support_card {
-	ranges = <0x00000000 1 0x01f00000 0x00100000>;
-};
-
 &ethsc {
 	interrupts = <0 50 4>;
 };
diff --git a/arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts b/arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts
index b7a03215..acb4204 100644
--- a/arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts
@@ -73,14 +73,6 @@
 	};
 };
 
-&extbus {
-	ranges = <1 0x00000000 0x42000000 0x02000000>;
-};
-
-&support_card {
-	ranges = <0x00000000 1 0x01f00000 0x00100000>;
-};
-
 &ethsc {
 	interrupts = <0 49 4>;
 };
diff --git a/arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts b/arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts
index fc7250c..d594f40 100644
--- a/arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts
@@ -72,14 +72,6 @@
 	};
 };
 
-&extbus {
-	ranges = <1 0x00000000 0x42000000 0x02000000>;
-};
-
-&support_card {
-	ranges = <0x00000000 1 0x01f00000 0x00100000>;
-};
-
 &ethsc {
 	interrupts = <0 48 4>;
 };
diff --git a/arch/arm/boot/dts/uniphier-support-card.dtsi b/arch/arm/boot/dts/uniphier-support-card.dtsi
index da271e3..fa807e8 100644
--- a/arch/arm/boot/dts/uniphier-support-card.dtsi
+++ b/arch/arm/boot/dts/uniphier-support-card.dtsi
@@ -43,10 +43,13 @@
  */
 
 &extbus {
+	ranges = <1 0x00000000 0x42000000 0x02000000>;
+
 	support_card: support_card {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
+		ranges = <0x00000000 1 0x01f00000 0x00100000>;
 
 		ethsc: ethernet@00000000 {
 			compatible = "smsc,lan9118", "smsc,lan9115";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20-ref.dts
index 80f71ba..727ae5f 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20-ref.dts
@@ -74,14 +74,6 @@
 	};
 };
 
-&extbus {
-	ranges = <1 0x00000000 0x42000000 0x02000000>;
-};
-
-&support_card {
-	ranges = <0x00000000 1 0x01f00000 0x00100000>;
-};
-
 &ethsc {
 	interrupts = <0 48 4>;
 };
-- 
1.9.1
