From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v3 4/4] mfd: arizona: Add device tree binding documentation for new clock driver
Date: Fri, 8 Jan 2016 11:29:42 +0000
Message-ID: <1452252582-20834-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, cw00.choi@samsung.com, lee.jones@linaro.org
Cc: sboyd@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Specify the device tree binding for the input clocks to Arizona devices.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Acked-by: Rob Herring <robh@kernel.org>
---

No changes since v2.

Thanks,
Charles

 Documentation/devicetree/bindings/mfd/arizona.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index 18be0cb..39f76f8 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -45,6 +45,13 @@ Optional properties:
 
   - wlf,reset : GPIO specifier for the GPIO controlling /RESET
 
+  - clocks: Should reference the clocks supplied on MCLK1 and MCLK2
+  - clock-names: Should contains two strings:
+      "mclk1" for the clock supplied on MCLK1, recommended to be a high
+      quality audio reference clock
+      "mclk2" for the clock supplied on MCLK2, recommended to be an always on
+      32k clock
+
   - wlf,gpio-defaults : A list of GPIO configuration register values. Defines
     for the appropriate values can found in <dt-bindings/mfd/arizona.txt>. If
     absent, no configuration of these registers is performed. If any entry has
-- 
2.1.4
