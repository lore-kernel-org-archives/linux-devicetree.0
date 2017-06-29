From: Brandon Streiff <brandon.streiff@ni.com>
Subject: [PATCH] clk: si5351: expand compatible strings in documentation
Date: Thu, 29 Jun 2017 08:31:45 -0500
Message-ID: <1498743105-29078-1-git-send-email-brandon.streiff@ni.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brandon Streiff <brandon.streiff@ni.com>
List-Id: devicetree@vger.kernel.org

checkpatch.pl doesn't know how to expand "silabs,si5351{a,a-msop,b,c}"
and so generates warnings about si5351-compatible devices appearing to
be un-documented. Resolve this by documenting the compatible options
supported by the clk-si5351 driver individually.

Signed-off-by: Brandon Streiff <brandon.streiff@ni.com>
---
 Documentation/devicetree/bindings/clock/silabs,si5351.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si5351.txt b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
index 28b2830..a6c4ef3 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si5351.txt
+++ b/Documentation/devicetree/bindings/clock/silabs,si5351.txt
@@ -12,7 +12,11 @@ generators can be found in [1].
 ==I2C device node==
 
 Required properties:
-- compatible: shall be one of "silabs,si5351{a,a-msop,b,c}".
+- compatible: shall be one of the following:
+	"silabs,si5351a" - Si5351a, QFN20 package
+	"silabs,si5351a-msop" - Si5351a, MSOP10 package
+	"silabs,si5351b" - Si5351b, QFN20 package
+	"silabs,si5351c" - Si5351c, QFN20 package
 - reg: i2c device address, shall be 0x60 or 0x61.
 - #clock-cells: from common clock binding; shall be set to 1.
 - clocks: from common clock binding; list of parent clock
-- 
2.1.4

