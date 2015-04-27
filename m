From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: emev2: Use generic names for device nodes
Date: Mon, 27 Apr 2015 14:51:33 +0200
Message-ID: <1430139093-14769-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

uart -> serial

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/clock/emev2-clock.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/emev2-clock.txt b/Documentation/devicetree/bindings/clock/emev2-clock.txt
index 60bbb1a8c69a3852..268ca615459e7549 100644
--- a/Documentation/devicetree/bindings/clock/emev2-clock.txt
+++ b/Documentation/devicetree/bindings/clock/emev2-clock.txt
@@ -52,7 +52,7 @@ usia_u0_sclk: usia_u0_sclk {
 
 Example of consumer:
 
-uart@e1020000 {
+serial@e1020000 {
 	compatible = "renesas,em-uart";
 	reg = <0xe1020000 0x38>;
 	interrupts = <0 8 0>;
-- 
1.9.1

