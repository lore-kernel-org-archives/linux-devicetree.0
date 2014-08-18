From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv4 2/2] dt-bindings: regulator: Add regulator suspend state for
 PM state
Date: Mon, 18 Aug 2014 15:27:03 +0900
Message-ID: <1408343223-4043-3-git-send-email-cw00.choi@samsung.com>
References: <1408343223-4043-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1408343223-4043-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org, kyungmin.park@samsung.com, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch add regulator suspend state to constraint in dt file. The regulation_
constraints structure already has regulator suspend state field as following.
The regulator suspend state control the state of regulator according to
PM (Power Management) state.
- struct regulator_state state_disk
- struct regulator_state state_mem

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/regulator/regulator.txt    | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 8607433..ccba90b 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -19,6 +19,23 @@ Optional properties:
   design requires. This property describes the total system ramp time
   required due to the combination of internal ramping of the regulator itself,
   and board design issues such as trace capacitance and load on the supply.
+- regulator-initial-state: initial state for suspend state, cnd set initial
+  state among following defined suspend states:
+  <3>: PM_SUSPEND_MEM - Setup regulator according to regulator-state-mem
+  <4>: PM_SUSPEND_MAX - Setup regulator according to regulator-state-disk
+- regulator-state-mem sub-root node for Suspend-to-RAM mode
+  : suspend to memory, the device goes to sleep, but all data stored in memory,
+  only some external interrupt can wake the device.
+- regulator-state-disk sub-root node for Suspend-to-disk mode
+  : suspend to disk, this state operates similarly to Suspend-to-RAM,
+  but includes a final step of writing memory contents to disk.
+- regulator-state-[mem/disk] node has following common properties:
+	- regulator-volt: voltage consumers may set in suspend state.
+	- regulator-on-in-suspend: regulator should be on in suspend state.
+	- regulator-off-in-suspend: regulator should be off in suspend state.
+	If node don't include regulator-[on/off]-in-suspend, can't change
+	regulator state in suspend mode and only should sustain the regulator
+	state of normal state.
 
 Deprecated properties:
 - regulator-compatible: If a regulator chip contains multiple
@@ -34,6 +51,11 @@ Example:
 		regulator-max-microvolt = <2500000>;
 		regulator-always-on;
 		vin-supply = <&vin>;
+
+		regulator-state-mem {
+			regulator-volt = <1000000>;
+			regulator-on-in-suspend;
+		};
 	};
 
 Regulator Consumers:
-- 
1.8.0
