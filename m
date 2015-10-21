From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 2/2] ARM: shmobile: r8a7791: fix "gpio-ranges" props
Date: Thu, 22 Oct 2015 02:05:19 +0300
Message-ID: <5904216.pOYUtEytKc@wasted.cogentembedded.com>
References: <10037494.4LD4T2QGPX@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <10037494.4LD4T2QGPX@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, linux-sh@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On R8A7791, GPIO banks 1 and 7  are missing  pins 26 to 31.  Correct the
"gpio-ranges" properties of the GPIO1 node (GPIO7 is already correct).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20151019-v4.3-rc6' of Simon Horman's
'renesas.git' repo.

 arch/arm/boot/dts/r8a7791.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7791.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7791.dtsi
+++ renesas/arch/arm/boot/dts/r8a7791.dtsi
@@ -100,7 +100,7 @@
 		interrupts = <0 5 IRQ_TYPE_LEVEL_HIGH>;
 		#gpio-cells = <2>;
 		gpio-controller;
-		gpio-ranges = <&pfc 0 32 32>;
+		gpio-ranges = <&pfc 0 32 26>;
 		#interrupt-cells = <2>;
 		interrupt-controller;
 		clocks = <&mstp9_clks R8A7791_CLK_GPIO1>;

