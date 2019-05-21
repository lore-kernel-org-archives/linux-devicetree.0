From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 2/9] Documentation: arm: Link idle-states binding to "enable-method" property
Date: Tue, 21 May 2019 15:05:12 +0530
Message-ID: <9dc4ce06143de48039e841c337fafa7cb9c8d7d2.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1558430617.git.amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, niklas.cassel@linaro.org, marc.w.gonzalez@free.fr, sibis@codeaurora.org, daniel.lezcano@linaro.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The "enable-method" property for cpu nodes needs to be "psci" for CPU
idle management to be setup correctly.

Add a note to the binding documentation to this effect to make it
obvious.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
---
 .../devicetree/bindings/arm/idle-states.txt         | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
index 45730ba60af5..3bdbe675b9e6 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -241,9 +241,13 @@ processor idle states, defined as device tree nodes, are listed.
 			   - "psci"
 			# On ARM 32-bit systems this property is optional
 
-The nodes describing the idle states (state) can only be defined within the
-idle-states node, any other configuration is considered invalid and therefore
-must be ignored.
+This assumes that the "enable-method" property is set to "psci" in the cpu
+node[6] that is responsible for setting up CPU idle management in the OS
+implementation.
+
+The nodes describing the idle states (state) can only be defined
+within the idle-states node, any other configuration is considered invalid
+and therefore must be ignored.
 
 ===========================================
 4 - state node
@@ -697,3 +701,6 @@ cpus {
 
 [5] Devicetree Specification
     https://www.devicetree.org/specifications/
+
+[6] ARM Linux Kernel documentation - Booting AArch64 Linux
+    Documentation/arm64/booting.txt
-- 
2.17.1
