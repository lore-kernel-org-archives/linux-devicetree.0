From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 5/5] ARM: dts: Update G2D documentation for clock entries
Date: Thu, 18 Apr 2013 16:45:19 +0530
Message-ID: <1366283719-9615-5-git-send-email-sachin.kamat@linaro.org>
References: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Added clock entry definitions to G2D bindings document.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org
---
 .../devicetree/bindings/gpu/samsung-g2d.txt        |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
index 2b14a94..3f454ff 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
+++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
@@ -10,11 +10,16 @@ Required properties:
 	  mapped region.
 
   - interrupts : G2D interrupt number to the CPU.
+  - clocks : from common clock binding: handle to G2D clocks.
+  - clock-names : from common clock binding: must contain "sclk_fimg2d" and
+		  "fimg2d", corresponding to entries in the clocks property.
 
 Example:
 	g2d@12800000 {
 		compatible = "samsung,s5pv210-g2d";
 		reg = <0x12800000 0x1000>;
 		interrupts = <0 89 0>;
+		clocks = <&clock 177>, <&clock 277>;
+		clock-names = "sclk_fimg2d", "fimg2d";
 		status = "disabled";
 	};
-- 
1.7.9.5
