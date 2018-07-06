From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] phy: qcom-qmp: Fix dts bindings to reflect reality
Date: Fri,  6 Jul 2018 16:31:42 -0700
Message-ID: <20180706233142.166296-1-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Manu Gautam <mgautam@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

A few patches have landed for the qcom-qmp PHY that affect how you
would write a device tree node.  ...yet the bindings weren't updated.
Let's remedy the situation and make the bindings refelect reality.

Fixes: efb05a50c956 ("phy: qcom-qmp: Add support for QMP V3 USB3 PHY")
Fixes: ac0d239936bd ("phy: qcom-qmp: Add support for runtime PM")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index 266a1bb8bb6e..0c7629e88bf3 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -12,7 +12,14 @@ Required properties:
 	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
 	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845.
 
- - reg: offset and length of register set for PHY's common serdes block.
+ - reg:
+   - For "qcom,sdm845-qmp-usb3-phy":
+     - index 0: address and length of register set for PHY's common serdes
+       block.
+     - named register "dp_com" (using reg-names): address and length of the
+       DP_COM control block.
+   - For all others:
+     - offset and length of register set for PHY's common serdes block.
 
  - #clock-cells: must be 1
     - Phy pll outputs a bunch of clocks for Tx, Rx and Pipe
@@ -60,7 +67,10 @@ Required nodes:
 
 Required properties for child node:
  - reg: list of offset and length pairs of register sets for PHY blocks -
-	tx, rx and pcs.
+	- index 0: tx
+	- index 1: rx
+	- index 2: pcs
+	- index 3: pcs_misc (optional)
 
  - #phy-cells: must be 0
 
-- 
2.18.0.203.gfac676dfb9-goog
