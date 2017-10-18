From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/6] arm64: dts: uniphier: route on-board device IRQ to GPIO controller
Date: Wed, 18 Oct 2017 13:24:35 +0900
Message-ID: <1508300677-23190-5-git-send-email-yamada.masahiro@socionext.com>
References: <1508300677-23190-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508300677-23190-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Interrupt lines from on-board devices are connected to the GPIO
controller.  Handle this correctly.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts | 3 ++-
 arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
index ffb473a..77f50fd 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
@@ -40,7 +40,8 @@
 };
 
 &ethsc {
-	interrupts = <0 48 4>;
+	interrupt-parent = <&gpio>;
+	interrupts = <0 8>;
 };
 
 &serial0 {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
index 1ca0c86..1f55fe1 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
@@ -40,7 +40,8 @@
 };
 
 &ethsc {
-	interrupts = <0 48 4>;
+	interrupt-parent = <&gpio>;
+	interrupts = <0 8>;
 };
 
 &serial0 {
-- 
2.7.4
