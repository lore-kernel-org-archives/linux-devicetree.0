From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] arm64: dts: uniphier: change release address of spin-table
Date: Fri, 15 Apr 2016 19:30:47 +0900
Message-ID: <1460716247-28049-3-git-send-email-yamada.masahiro@socionext.com>
References: <1460716247-28049-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460716247-28049-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The 8-byte register located at 0x59801200 on this SoC is dedicated
for waking up secondary CPUs.  We can use it and save normal memory.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
index 651c9d9..f73b09e 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
@@ -77,7 +77,7 @@
 			compatible = "arm,cortex-a72", "arm,armv8";
 			reg = <0 0x000>;
 			enable-method = "spin-table";
-			cpu-release-addr = <0 0x80000100>;
+			cpu-release-addr = <0 0x59801200>;
 		};
 
 		cpu1: cpu@1 {
@@ -85,7 +85,7 @@
 			compatible = "arm,cortex-a72", "arm,armv8";
 			reg = <0 0x001>;
 			enable-method = "spin-table";
-			cpu-release-addr = <0 0x80000100>;
+			cpu-release-addr = <0 0x59801200>;
 		};
 
 		cpu2: cpu@100 {
@@ -93,7 +93,7 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0 0x100>;
 			enable-method = "spin-table";
-			cpu-release-addr = <0 0x80000100>;
+			cpu-release-addr = <0 0x59801200>;
 		};
 
 		cpu3: cpu@101 {
@@ -101,7 +101,7 @@
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0 0x101>;
 			enable-method = "spin-table";
-			cpu-release-addr = <0 0x80000100>;
+			cpu-release-addr = <0 0x59801200>;
 		};
 	};
 
-- 
1.9.1
