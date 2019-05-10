From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCHv1 2/8] Documentation: arm: Link idle-states binding to code
Date: Fri, 10 May 2019 16:59:40 +0530
Message-ID: <5f25e2b3096fa73f205e1797e355e049ed9f8c9c.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1557486950.git.amit.kucheria@linaro.org>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The enable-method needs to be psci for the psci_cpuidle_ops to be
correctly registered.

Add a note to the binding documentation on where to find the declaration
of the enable-method since it is a macro and escapes any attempts to
grep for it.

Cc: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 Documentation/devicetree/bindings/arm/idle-states.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
index 45730ba60af5..3a42335a6f3d 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -239,6 +239,10 @@ processor idle states, defined as device tree nodes, are listed.
 			# On ARM v8 64-bit this property is required and must
 			  be:
 			   - "psci"
+			     (This assumes that the enable-method is "psci"
+			     in the cpu node[6] that then uses the
+			     CPUIDLE_METHOD_OF_DECLARE macro to setup the
+			     psci_cpuidle_ops callbacks)
 			# On ARM 32-bit systems this property is optional
 
 The nodes describing the idle states (state) can only be defined within the
@@ -697,3 +701,6 @@ cpus {
 
 [5] Devicetree Specification
     https://www.devicetree.org/specifications/
+
+[6] ARM Linux Kernel documentation - Booting AArch64 Linux
+    Documentation/arm64/booting.txt
-- 
2.17.1
