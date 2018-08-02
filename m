Return-Path: <SRS0=L/Ao=KR=linuxtv.org=mchehab@kernel.org>
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date: Thu, 02 Aug 2018 10:11:51 +0000
Subject: [git:media_tree/master] media: dt-bindings: media: qcom, camss: Unify the clock names
Reply-to: linux-media@vger.kernel.org
Message-Id: <E1flD2F-0003u2-0e@www.linuxtv.org>
To: linuxtv-commits@linuxtv.org
Cc: Mark Rutland <mark.rutland@arm.com>, Hans Verkuil <hansverk@cisco.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Todor Tomov <todor.tomov@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: dt-bindings: media: qcom, camss: Unify the clock names
Author:  Todor Tomov <todor.tomov@linaro.org>
Date:    Tue Jul 31 02:19:43 2018 -0400

Use more logical clock names - similar to the names in documentation.
This will allow better handling of the clocks in the driver when support
for more hardware versions is added - equivalent clocks on different
hardware versions will have the same name.

Note: No dts is using this device (and clock names) yet.

CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: devicetree@vger.kernel.org
Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Hans Verkuil <hansverk@cisco.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

 .../devicetree/bindings/media/qcom,camss.txt       | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

---

diff --git a/Documentation/devicetree/bindings/media/qcom,camss.txt b/Documentation/devicetree/bindings/media/qcom,camss.txt
index cadecebc73f7..032e8ed81faa 100644
--- a/Documentation/devicetree/bindings/media/qcom,camss.txt
+++ b/Documentation/devicetree/bindings/media/qcom,camss.txt
@@ -53,7 +53,7 @@ Qualcomm Camera Subsystem
 	Usage: required
 	Value type: <stringlist>
 	Definition: Should contain the following entries:
-                - "camss_top_ahb"
+                - "top_ahb"
                 - "ispif_ahb"
                 - "csiphy0_timer"
                 - "csiphy1_timer"
@@ -67,11 +67,11 @@ Qualcomm Camera Subsystem
                 - "csi1_phy"
                 - "csi1_pix"
                 - "csi1_rdi"
-                - "camss_ahb"
-                - "camss_vfe_vfe"
-                - "camss_csi_vfe"
-                - "iface"
-                - "bus"
+                - "ahb"
+                - "vfe0"
+                - "csi_vfe0"
+                - "vfe_ahb"
+                - "vfe_axi"
 - vdda-supply:
 	Usage: required
 	Value type: <phandle>
@@ -161,7 +161,7 @@ Qualcomm Camera Subsystem
 			<&gcc GCC_CAMSS_CSI_VFE0_CLK>,
 			<&gcc GCC_CAMSS_VFE_AHB_CLK>,
 			<&gcc GCC_CAMSS_VFE_AXI_CLK>;
-                clock-names = "camss_top_ahb",
+                clock-names = "top_ahb",
                         "ispif_ahb",
                         "csiphy0_timer",
                         "csiphy1_timer",
@@ -175,11 +175,11 @@ Qualcomm Camera Subsystem
                         "csi1_phy",
                         "csi1_pix",
                         "csi1_rdi",
-                        "camss_ahb",
-                        "camss_vfe_vfe",
-                        "camss_csi_vfe",
-                        "iface",
-                        "bus";
+                        "ahb",
+                        "vfe0",
+                        "csi_vfe0",
+                        "vfe_ahb",
+                        "vfe_axi";
 		vdda-supply = <&pm8916_l2>;
 		iommus = <&apps_iommu 3>;
 		ports {
