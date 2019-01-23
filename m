From: Jayant Shekhar <jshekhar@codeaurora.org>
Subject: [v6 3/3] dt-bindings: msm/disp: Introduce interconnect bindings for MDSS on SDM845
Date: Wed, 23 Jan 2019 09:12:35 +0530
Message-ID: <1548214955-19692-4-git-send-email-jshekhar@codeaurora.org>
References: <1548214955-19692-1-git-send-email-jshekhar@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548214955-19692-1-git-send-email-jshekhar@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Jayant Shekhar <jshekhar@codeaurora.org>, linux-kernel@vger.kernel.org, robdclark@gmail.com, seanpaul@chromium.org, hoegsberg@chromium.org, abhinavk@codeaurora.org, jsanka@codeaurora.org, chandanu@codeaurora.org, nganji@codeaurora.org, Sravanthi Kollukuduru <skolluku@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add interconnect properties such as interconnect provider specifier
, the edge source and destination ports which are required by the
interconnect API to configure interconnect path for MDSS.

Changes in v2:
	- none

Changes in v3:
	- Remove common property definitions (Rob Herring)

Changes in v4:
	- Use port macros and change port string names (Georgi Djakov)

Changes in v5:
	- None

Changes in v6:
	- None

Signed-off-by: Sravanthi Kollukuduru <skolluku@codeaurora.org>
Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
---
 Documentation/devicetree/bindings/display/msm/dpu.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
index ad2e883..a61dd40 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
@@ -28,6 +28,11 @@ Required properties:
 - #address-cells: number of address cells for the MDSS children. Should be 1.
 - #size-cells: Should be 1.
 - ranges: parent bus address space is the same as the child bus address space.
+- interconnects : interconnect path specifier for MDSS according to
+  Documentation/devicetree/bindings/interconnect/interconnect.txt. Should be
+  2 paths corresponding to 2 AXI ports.
+- interconnect-names : MDSS will have 2 port names to differentiate between the
+  2 interconnect paths defined with interconnect specifier.
 
 Optional properties:
 - assigned-clocks: list of clock specifiers for clocks needing rate assignment
@@ -86,6 +91,11 @@ Example:
 		interrupt-controller;
 		#interrupt-cells = <1>;
 
+		interconnects = <&rsc_hlos MASTER_MDP0 &rsc_hlos SLAVE_EBI1>,
+				<&rsc_hlos MASTER_MDP1 &rsc_hlos SLAVE_EBI1>;
+
+		interconnect-names = "mdp0-mem", "mdp1-mem";
+
 		iommus = <&apps_iommu 0>;
 
 		#address-cells = <2>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
