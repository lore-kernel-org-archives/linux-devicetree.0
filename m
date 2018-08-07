From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] dt-bindings: phy: qcom-qmp: Cleanup the 'reg' documentation as per review
Date: Mon,  6 Aug 2018 22:14:12 -0700
Message-ID: <20180807051412.126003-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

After the commit 8b1087fa3a27 ("phy: qcom-qmp: Fix dts bindings to
reflect reality") landed there was some review feedback that 'reg'
should have been documented differently.  Fix it as per review
feedback.

As per that feedback:
- Subject should have been 'dt-bindings: phy:' which this patch now
  has.
- We should leave no ambiguity in the ordering of 'reg' ranges even if
  'reg-names' are also specified.
- Normally using reg-names is discouraged unless there's a strong
  reason it's needed (like if there are optional ranges).  In this
  case reg-names wasn't needed but the driver already landed relying
  on reg-names so we'll just document it and move on.

Fixes: 8b1087fa3a27 ("phy: qcom-qmp: Fix dts bindings to reflect reality")
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index 0c7629e88bf3..2b161bf15d5d 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -12,14 +12,17 @@ Required properties:
 	       "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
 	       "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on sdm845.
 
- - reg:
-   - For "qcom,sdm845-qmp-usb3-phy":
-     - index 0: address and length of register set for PHY's common serdes
-       block.
-     - named register "dp_com" (using reg-names): address and length of the
-       DP_COM control block.
-   - For all others:
-     - offset and length of register set for PHY's common serdes block.
+- reg:
+  - index 0: address and length of register set for PHY's common
+             serdes block.
+  - index 1: address and length of the DP_COM control block (for
+             "qcom,sdm845-qmp-usb3-phy" only).
+
+- reg-names:
+  - For "qcom,sdm845-qmp-usb3-phy":
+    - Should be: "reg-base", "dp_com"
+  - For all others:
+    - The reg-names property shouldn't be defined.
 
  - #clock-cells: must be 1
     - Phy pll outputs a bunch of clocks for Tx, Rx and Pipe
-- 
2.18.0.597.ga71716f1ad-goog
