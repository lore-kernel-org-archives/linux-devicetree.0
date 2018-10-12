From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] dt-bindings: phy-qcom-qmp: Fix several mistakes from prior commits
Date: Fri, 12 Oct 2018 14:36:32 -0700
Message-ID: <20181012213632.252346-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Can Guo <cang@codeaurora.org>, evgreen@chromium.org, Vivek Gautam <vivek.gautam@codeaurora.org>, Manu Gautam <mgautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, sayalil@codeaurora.org, Varadarajan Narayanan <varada@codeaurora.org>, asutoshd@codeaurora.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Digging through the "phy-qcom-qmp" showed me many inconsistencies
between the bindings and the reality of the driver.  Let's fix them
all.

* In commit 2d66eab18375 ("dt-bindings: phy: qmp: Add support for QMP
  phy in IPQ8074") we probably should have explicitly listed that
  there are no clocks for this PHY and also added the reset names in
  alphabetical order.  You can see that there are no clocks in the
  driver where "clk_list" is NULL.

* In commit 8587b220f05e ("dt-bindings: phy-qcom-qmp: Update bindings
  for QMP V3 USB PHY") we probably should have listed the resets for
  this new PHY and also removed the "(Optional)" marking for the "cfg"
  reset since PHYs that need "cfg" really do need it.  It's just that
  not all PHYs need it.

* In commit 7f0802074120 ("dt-bindings: phy-qcom-qmp: Update bindings
  for sdm845") we forgot to update one instance of the string
  "qcom,qmp-v3-usb3-phy" to be "qcom,sdm845-qmp-usb3-phy".  Let's fix
  that.  We should also have added "qcom,sdm845-qmp-usb3-uni-phy" to
  the clock-names and reset-names lists.

* In commit 99c7c7364b71 ("dt-bindings: phy-qcom-qmp: Add UFS phy
  compatible string for sdm845") we should have added the set of
  clocks and resets for "qcom,sdm845-qmp-ufs-phy".  These were taken
  from the driver.

* Cleanup the wording for what properties child nodes have to make it
  more obvious which types of PHYs need clocks and resets.  This was
  sorta implicit in the "-names" description but I found myself
  confused.

* As per the code not all "pcie qmp phys" have resets.  Specifically
  note that the "has_lane_rst" property in the driver is false for
  "ipq8074-qmp-pcie-phy".  Thus make it clear exactly which PHYs need
  child nodes with resets.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  | 31 ++++++++++++++-----
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index adf20b2bdf71..fbc198d5dd39 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -40,24 +40,36 @@ Required properties:
 		"ref" for 19.2 MHz ref clk,
 		"com_aux" for phy common block aux clock,
 		"ref_aux" for phy reference aux clock,
+
+		For "qcom,ipq8074-qmp-pcie-phy": no clocks are listed.
 		For "qcom,msm8996-qmp-pcie-phy" must contain:
 			"aux", "cfg_ahb", "ref".
 		For "qcom,msm8996-qmp-usb3-phy" must contain:
 			"aux", "cfg_ahb", "ref".
-		For "qcom,qmp-v3-usb3-phy" must contain:
+		For "qcom,sdm845-qmp-usb3-phy" must contain:
+			"aux", "cfg_ahb", "ref", "com_aux".
+		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
 			"aux", "cfg_ahb", "ref", "com_aux".
+		For "qcom,sdm845-qmp-ufs-phy" must contain:
+			"ref", "ref_aux".
 
  - resets: a list of phandles and reset controller specifier pairs,
 	   one for each entry in reset-names.
  - reset-names: "phy" for reset of phy block,
 		"common" for phy common block reset,
-		"cfg" for phy's ahb cfg block reset (Optional).
+		"cfg" for phy's ahb cfg block reset.
+
+		For "qcom,ipq8074-qmp-pcie-phy" must contain:
+			"phy", "common".
 		For "qcom,msm8996-qmp-pcie-phy" must contain:
-		 "phy", "common", "cfg".
+			"phy", "common", "cfg".
 		For "qcom,msm8996-qmp-usb3-phy" must contain
-		 "phy", "common".
-		For "qcom,ipq8074-qmp-pcie-phy" must contain:
-		 "phy", "common".
+			"phy", "common".
+		For "qcom,sdm845-qmp-usb3-phy" must contain:
+			"phy", "common".
+		For "qcom,sdm845-qmp-usb3-uni-phy" must contain:
+			"phy", "common".
+		For "qcom,sdm845-qmp-ufs-phy": no resets are listed.
 
  - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
  - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
@@ -79,9 +91,10 @@ Required properties for child node:
 
  - #phy-cells: must be 0
 
+Required properties child node of pcie and usb3 qmp phys:
  - clocks: a list of phandles and clock-specifier pairs,
 	   one for each entry in clock-names.
- - clock-names: Must contain following for pcie and usb qmp phys:
+ - clock-names: Must contain following:
 		 "pipe<lane-number>" for pipe clock specific to each lane.
  - clock-output-names: Name of the PHY clock that will be the parent for
 		       the above pipe clock.
@@ -91,9 +104,11 @@ Required properties for child node:
 			(or)
 		  "pcie20_phy1_pipe_clk"
 
+Required properties for child node of PHYs with lane reset, AKA:
+	"qcom,msm8996-qmp-pcie-phy"
  - resets: a list of phandles and reset controller specifier pairs,
 	   one for each entry in reset-names.
- - reset-names: Must contain following for pcie qmp phys:
+ - reset-names: Must contain following:
 		 "lane<lane-number>" for reset specific to each lane.
 
 Example:
-- 
2.19.0.605.g01d371f741-goog
