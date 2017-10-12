From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/13] dt-bindings: clk: r7s72100: Add missing I and G clocks
Date: Thu, 12 Oct 2017 11:35:04 +0200
Message-ID: <1507800916-11509-2-git-send-email-geert+renesas@glider.be>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add the missing definitions for the I (CPU) and G (Image Processing)
clocks, so these clocks can be referred to from device nodes in DT.

Note that these clocks are already fully supported otherwise (DT
bindings, Linux driver, r7s72100.dtsi), they were just omitted from the
header file.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/dt-bindings/clock/r7s72100-clock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/r7s72100-clock.h b/include/dt-bindings/clock/r7s72100-clock.h
index 7dd8bc0c3cd0d6e2..0dcb3e87d44c121e 100644
--- a/include/dt-bindings/clock/r7s72100-clock.h
+++ b/include/dt-bindings/clock/r7s72100-clock.h
@@ -11,6 +11,8 @@
 #define __DT_BINDINGS_CLOCK_R7S72100_H__
 
 #define R7S72100_CLK_PLL	0
+#define R7S72100_CLK_I		1
+#define R7S72100_CLK_G		2
 
 /* MSTP2 */
 #define R7S72100_CLK_CORESIGHT	0
-- 
2.7.4
