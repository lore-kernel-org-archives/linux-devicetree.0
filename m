From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v3 1/3] dt-bindings: clock: add compatible variant for the Meson-AXG
Date: Tue, 28 Nov 2017 20:53:28 +0800
Message-ID: <20171128125330.363-2-yixun.lan@amlogic.com>
References: <20171128125330.363-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171128125330.363-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update the documentation to support clock driver for the Amlogic's
Meson-AXG SoC.

Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index 924040769186..e2b377ed6f91 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -5,8 +5,11 @@ controllers within the SoC.
 
 Required Properties:
 
-- compatible: should be "amlogic,gxbb-clkc" for GXBB SoC,
-	      or "amlogic,gxl-clkc" for GXL and GXM SoC.
+- compatible: should be:
+		"amlogic,gxbb-clkc" for GXBB SoC,
+		"amlogic,gxl-clkc" for GXL and GXM SoC,
+		"amlogic,axg-clkc" for AXG SoC.
+
 - reg: physical base address of the clock controller and length of memory
        mapped region.
 
-- 
2.15.0
