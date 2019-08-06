From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 1/2] mfd: madera: Update DT binding document to support clock supplies
Date: Tue, 6 Aug 2019 16:13:20 +0100
Message-ID: <20190806151321.31137-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

Add the 3 input clock sources for the chip into the device tree binding
document.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 Documentation/devicetree/bindings/mfd/madera.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/madera.txt b/Documentation/devicetree/bindings/mfd/madera.txt
index cad0f28005027..47e2b8bc60519 100644
--- a/Documentation/devicetree/bindings/mfd/madera.txt
+++ b/Documentation/devicetree/bindings/mfd/madera.txt
@@ -67,6 +67,14 @@ Optional properties:
     As defined in bindings/gpio.txt.
     Although optional, it is strongly recommended to use a hardware reset
 
+  - clocks: Should reference the clocks supplied on MCLK1, MCLK2 and MCLK3
+  - clock-names: May contain up to three strings:
+      "mclk1" for the clock supplied on MCLK1, recommended to be a high
+      quality audio reference clock
+      "mclk2" for the clock supplied on MCLK2, required to be an always on
+      32k clock
+      "mclk3" for the clock supplied on MCLK3
+
   - MICBIASx : Initial data for the MICBIAS regulators, as covered in
     Documentation/devicetree/bindings/regulator/regulator.txt.
     One for each MICBIAS generator (MICBIAS1, MICBIAS2, ...)
-- 
2.11.0
