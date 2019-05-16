From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 1/3] dt-bindings: gpu: add #cooling-cells property to the ARM Mali Midgard GPU binding
Date: Thu, 16 May 2019 10:25:08 -0700
Message-ID: <20190516172510.181473-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

The GPU can be used as a thermal cooling device, add an optional
'#cooling-cells' property.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- patch added to the series
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index 18a2cde2e5f3..61fd41a20f99 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -37,6 +37,8 @@ Optional properties:
 - operating-points-v2 : Refer to Documentation/devicetree/bindings/opp/opp.txt
   for details.
 
+- #cooling-cells: Refer to Documentation/devicetree/bindings/thermal/thermal.txt
+  for details.
 
 Example for a Mali-T760:
 
@@ -51,6 +53,7 @@ gpu@ffa30000 {
 	mali-supply = <&vdd_gpu>;
 	operating-points-v2 = <&gpu_opp_table>;
 	power-domains = <&power RK3288_PD_GPU>;
+	#cooling-cells = <2>;
 };
 
 gpu_opp_table: opp_table0 {
-- 
2.21.0.1020.gf2820cf01a-goog
