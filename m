From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: dts: uniphier: fix a typo in comment block
Date: Thu, 24 Dec 2015 00:23:40 +0900
Message-ID: <1450884220-8751-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/uniphier-ph1-ld6b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/uniphier-ph1-ld6b.dtsi b/arch/arm/boot/dts/uniphier-ph1-ld6b.dtsi
index c6499ee..5321152 100644
--- a/arch/arm/boot/dts/uniphier-ph1-ld6b.dtsi
+++ b/arch/arm/boot/dts/uniphier-ph1-ld6b.dtsi
@@ -53,7 +53,7 @@
 	compatible = "socionext,ph1-ld6b";
 };
 
-/* UART3 unavilable: the pads are not wired to the package balls */
+/* UART3 unavailable: the pads are not wired to the package balls */
 &serial3 {
 	status = "disabled";
 };
-- 
1.9.1
