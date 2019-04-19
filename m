From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH v4] dt-bindings: drm/msm/a6xx: Document interconnect properties for GPU
Date: Fri, 19 Apr 2019 13:56:27 -0600
Message-ID: <1555703787-10897-1-git-send-email-jcrouse@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org

Add documentation for the interconnect and interconnect-names bindings
for the GPU node as detailed by bindings/interconnect/interconnect.txt.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Georgi Djakov <georgi.djakov@linaro.org>
---
v4: Fix spelling nits per Georgi

 Documentation/devicetree/bindings/display/msm/gpu.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index aad1aef..c04614c 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -22,6 +22,8 @@ Required properties:
    - qcom,adreno-630.2
 - iommus: optional phandle to an adreno iommu instance
 - operating-points-v2: optional phandle to the OPP operating points
+- interconnects: optional phandle to an interconnect provider.  See
+  ../interconnect/interconnect.txt for details.
 - qcom,gmu: For GMU attached devices a phandle to the GMU device that will
   control the power for the GPU. Applicable targets:
     - qcom,adreno-630.2
@@ -70,6 +72,8 @@ Example a6xx (with GMU):
 
 		operating-points-v2 = <&gpu_opp_table>;
 
+		interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
+
 		qcom,gmu = <&gmu>;
 	};
 };
-- 
2.7.4
