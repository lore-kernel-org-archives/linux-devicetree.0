From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2 2/5] dt-bindings: gpu: add a power_model optional properties for MALI
Date: Mon, 17 Jul 2017 16:14:28 +0800
Message-ID: <1500279271-15249-3-git-send-email-wxt@rock-chips.com>
References: <1500279271-15249-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500279271-15249-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, rocky.hao@rock-chips.com, Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This patch adds the MALI's power-model to set the IPA model to be used
for power management.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index a461e47..b616e6b 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -37,6 +37,18 @@ Optional properties:
 - operating-points-v2 : Refer to Documentation/devicetree/bindings/power/opp.txt
   for details.
 
+- power_model : Sets power model parameters. Note that this model was designed for the Juno
+	        platform, and may not be suitable for other platforms. A structure containing :
+	- compatible: Should be arm,mali-simple-power-model
+	- dynamic-coefficient: Coefficient, in pW/(Hz V^2), which is multiplied
+	  by v^2*f to calculate the dynamic power consumption.
+	- static-coefficient: Coefficient, in uW/V^3, which is multiplied by
+	  v^3 to calculate the static power consumption.
+	- ts: An array containing coefficients for the temperature scaling
+	  factor. This is used to scale the static power by a factor of
+	  tsf/1000000, where tsf = ts[3]*T^3 + ts[2]*T^2 + ts[1]*T + ts[0],
+	  and T = temperature in degrees.
+	- thermal-zone: A string identifying the thermal zone used for the GPU
 
 Example for a Mali-T760:
 
-- 
2.7.4
