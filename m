From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 2/4] ARM: dts: UniPhier: add reference daughter board
Date: Thu,  6 Aug 2015 19:37:46 +0900
Message-ID: <1438857468-9740-3-git-send-email-yamada.masahiro@socionext.com>
References: <1438857468-9740-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1438857468-9740-1-git-send-email-yamada.masahiro@socionext.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is used as a base board for reference core modules.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---
 arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts   |  1 +
 arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts  |  1 +
 arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts  |  1 +
 arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts  |  1 +
 arch/arm/boot/dts/uniphier-ref-daughter.dtsi | 50 ++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 arch/arm/boot/dts/uniphier-ref-daughter.dtsi

diff --git a/arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts b/arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts
index 5d24c57..bfd3bb8 100644
--- a/arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ph1-ld4-ref.dts
@@ -44,6 +44,7 @@
 
 /dts-v1/;
 /include/ "uniphier-ph1-ld4.dtsi"
+/include/ "uniphier-ref-daughter.dtsi"
 /include/ "uniphier-support-card.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts b/arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts
index 26c18ac..69a5b7d 100644
--- a/arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ph1-pro4-ref.dts
@@ -44,6 +44,7 @@
 
 /dts-v1/;
 /include/ "uniphier-ph1-pro4.dtsi"
+/include/ "uniphier-ref-daughter.dtsi"
 /include/ "uniphier-support-card.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts b/arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts
index cb6e9aa..1a440f8 100644
--- a/arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ph1-sld3-ref.dts
@@ -44,6 +44,7 @@
 
 /dts-v1/;
 /include/ "uniphier-ph1-sld3.dtsi"
+/include/ "uniphier-ref-daughter.dtsi"
 /include/ "uniphier-support-card.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts b/arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts
index a40a0fb..955d417 100644
--- a/arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ph1-sld8-ref.dts
@@ -44,6 +44,7 @@
 
 /dts-v1/;
 /include/ "uniphier-ph1-sld8.dtsi"
+/include/ "uniphier-ref-daughter.dtsi"
 /include/ "uniphier-support-card.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/uniphier-ref-daughter.dtsi b/arch/arm/boot/dts/uniphier-ref-daughter.dtsi
new file mode 100644
index 0000000..3d29d28
--- /dev/null
+++ b/arch/arm/boot/dts/uniphier-ref-daughter.dtsi
@@ -0,0 +1,50 @@
+/*
+ * Device Tree Source for UniPhier Reference Daughter Board
+ *
+ * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+&i2c0 {
+	eeprom {
+		compatible = "microchip,24lc128";
+		reg = <0x50>;
+	};
+};
-- 
1.9.1
