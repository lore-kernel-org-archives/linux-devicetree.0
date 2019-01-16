From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH] dt-bindings: drm/msm/a6xx: Document GMU bindings
Date: Wed, 16 Jan 2019 14:09:51 -0700
Message-ID: <1547672991-3204-1-git-send-email-jcrouse@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Commit 24937c540917 ("dt-bindings: drm/msm/a6xx: Document GMU and update
GPU bindings") mistakenly omitted the GMU bindings as seen in [1].
Return them to their rightful place.

[1] https://patchwork.freedesktop.org/patch/268679/

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

 .../devicetree/bindings/display/msm/gmu.txt        | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
new file mode 100644
index 0000000..3439b38
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
@@ -0,0 +1,59 @@
+Qualcomm adreno/snapdragon GMU (Graphics management unit)
+
+The GMU is a programmable power controller for the GPU. the CPU controls the
+GMU which in turn handles power controls for the GPU.
+
+Required properties:
+- compatible: "qcom,adreno-gmu-XYZ.W", "qcom,adreno-gmu"
+    for example: "qcom,adreno-gmu-630.2", "qcom,adreno-gmu"
+  Note that you need to list the less specific "qcom,adreno-gmu"
+  for generic matches and the more specific identifier to identify
+  the specific device.
+- reg: Physical base address and length of the GMU registers.
+- reg-names: Matching names for the register regions
+  * "gmu"
+  * "gmu_pdc"
+  * "gmu_pdc_seg"
+- interrupts: The interrupt signals from the GMU.
+- interrupt-names: Matching names for the interrupts
+  * "hfi"
+  * "gmu"
+- clocks: phandles to the device clocks
+- clock-names: Matching names for the clocks
+   * "gmu"
+   * "cxo"
+   * "axi"
+   * "mnoc"
+- power-domains: should be <&clock_gpucc GPU_CX_GDSC>
+- iommus: phandle to the adreno iommu
+- operating-points-v2: phandle to the OPP operating points
+
+Example:
+
+/ {
+	...
+
+	gmu: gmu@506a000 {
+		compatible="qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
+
+		reg = <0x506a000 0x30000>,
+			<0xb280000 0x10000>,
+			<0xb480000 0x10000>;
+		reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
+
+		interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "hfi", "gmu";
+
+		clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+			<&gpucc GPU_CC_CXO_CLK>,
+			<&gcc GCC_DDRSS_GPU_AXI_CLK>,
+			<&gcc GCC_GPU_MEMNOC_GFX_CLK>;
+		clock-names = "gmu", "cxo", "axi", "memnoc";
+
+		power-domains = <&gpucc GPU_CX_GDSC>;
+		iommus = <&adreno_smmu 5>;
+
+		operating-points-v2 = <&gmu_opp_table>;
+	};
+};
-- 
2.7.4
