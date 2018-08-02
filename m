Return-Path: <SRS0=L/Ao=KR=linuxtv.org=mchehab@kernel.org>
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date: Thu, 02 Aug 2018 10:17:30 +0000
Subject: [git:media_tree/master] media: dt-bindings: media: qcom,camss: Fix whitespaces
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1flD2E-0003rK-Ia@www.linuxtv.org>
To: linuxtv-commits@linuxtv.org
Cc: Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Todor Tomov <todor.tomov@linaro.org>, Hans Verkuil <hansverk@cisco.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: dt-bindings: media: qcom,camss: Fix whitespaces
Author:  Todor Tomov <todor.tomov@linaro.org>
Date:    Wed Jul 25 12:38:24 2018 -0400

Use tabs.

CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: devicetree@vger.kernel.org
Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Hans Verkuil <hansverk@cisco.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

 .../devicetree/bindings/media/qcom,camss.txt       | 92 +++++++++++-----------
 1 file changed, 46 insertions(+), 46 deletions(-)

---

diff --git a/Documentation/devicetree/bindings/media/qcom,camss.txt b/Documentation/devicetree/bindings/media/qcom,camss.txt
index 032e8ed81faa..e938eb02274c 100644
--- a/Documentation/devicetree/bindings/media/qcom,camss.txt
+++ b/Documentation/devicetree/bindings/media/qcom,camss.txt
@@ -53,25 +53,25 @@ Qualcomm Camera Subsystem
 	Usage: required
 	Value type: <stringlist>
 	Definition: Should contain the following entries:
-                - "top_ahb"
-                - "ispif_ahb"
-                - "csiphy0_timer"
-                - "csiphy1_timer"
-                - "csi0_ahb"
-                - "csi0"
-                - "csi0_phy"
-                - "csi0_pix"
-                - "csi0_rdi"
-                - "csi1_ahb"
-                - "csi1"
-                - "csi1_phy"
-                - "csi1_pix"
-                - "csi1_rdi"
-                - "ahb"
-                - "vfe0"
-                - "csi_vfe0"
-                - "vfe_ahb"
-                - "vfe_axi"
+		- "top_ahb"
+		- "ispif_ahb"
+		- "csiphy0_timer"
+		- "csiphy1_timer"
+		- "csi0_ahb"
+		- "csi0"
+		- "csi0_phy"
+		- "csi0_pix"
+		- "csi0_rdi"
+		- "csi1_ahb"
+		- "csi1"
+		- "csi1_phy"
+		- "csi1_pix"
+		- "csi1_rdi"
+		- "ahb"
+		- "vfe0"
+		- "csi_vfe0"
+		- "vfe_ahb"
+		- "vfe_axi"
 - vdda-supply:
 	Usage: required
 	Value type: <phandle>
@@ -95,17 +95,17 @@ Qualcomm Camera Subsystem
 		- clock-lanes:
 			Usage: required
 			Value type: <u32>
-                        Definition: The physical clock lane index. The value
-                                    must always be <1> as the physical clock
-                                    lane is lane 1.
+			Definition: The physical clock lane index. The value
+				    must always be <1> as the physical clock
+				    lane is lane 1.
 		- data-lanes:
 			Usage: required
 			Value type: <prop-encoded-array>
-                        Definition: An array of physical data lanes indexes.
-                                    Position of an entry determines the logical
-                                    lane number, while the value of an entry
-                                    indicates physical lane index. Lane swapping
-                                    is supported.
+			Definition: An array of physical data lanes indexes.
+				    Position of an entry determines the logical
+				    lane number, while the value of an entry
+				    indicates physical lane index. Lane swapping
+				    is supported.
 
 * An Example
 
@@ -161,25 +161,25 @@ Qualcomm Camera Subsystem
 			<&gcc GCC_CAMSS_CSI_VFE0_CLK>,
 			<&gcc GCC_CAMSS_VFE_AHB_CLK>,
 			<&gcc GCC_CAMSS_VFE_AXI_CLK>;
-                clock-names = "top_ahb",
-                        "ispif_ahb",
-                        "csiphy0_timer",
-                        "csiphy1_timer",
-                        "csi0_ahb",
-                        "csi0",
-                        "csi0_phy",
-                        "csi0_pix",
-                        "csi0_rdi",
-                        "csi1_ahb",
-                        "csi1",
-                        "csi1_phy",
-                        "csi1_pix",
-                        "csi1_rdi",
-                        "ahb",
-                        "vfe0",
-                        "csi_vfe0",
-                        "vfe_ahb",
-                        "vfe_axi";
+		clock-names = "top_ahb",
+			"ispif_ahb",
+			"csiphy0_timer",
+			"csiphy1_timer",
+			"csi0_ahb",
+			"csi0",
+			"csi0_phy",
+			"csi0_pix",
+			"csi0_rdi",
+			"csi1_ahb",
+			"csi1",
+			"csi1_phy",
+			"csi1_pix",
+			"csi1_rdi",
+			"ahb",
+			"vfe0",
+			"csi_vfe0",
+			"vfe_ahb",
+			"vfe_axi";
 		vdda-supply = <&pm8916_l2>;
 		iommus = <&apps_iommu 3>;
 		ports {
