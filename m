From: Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: [PATCH V2 1/5] bindings: regulator: added support for suspend states
Date: Thu,  4 Jan 2018 15:22:44 +0800
Message-ID: <1515050568-23876-2-git-send-email-zhang.chunyan@linaro.org>
References: <1515050568-23876-1-git-send-email-zhang.chunyan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515050568-23876-1-git-send-email-zhang.chunyan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

Some systems need to set regulators to specific states when they enter
low power modes, especially around CPUs. There are many of these modes
depending on the particular runtime state.

Currently the regulator consumers are not granted permission to change
suspend state of regulator devices, the constraints are configured at
startup.  In order to allow changes in a vlotage range, we need to add
new properties for voltage range and a flag to give permission to
change the suspend voltage and suspend on/off in suspend mode.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 378f6dc..532e286 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -42,8 +42,19 @@ Optional properties:
 - regulator-state-[mem/disk] node has following common properties:
 	- regulator-on-in-suspend: regulator should be on in suspend state.
 	- regulator-off-in-suspend: regulator should be off in suspend state.
-	- regulator-suspend-microvolt: regulator should be set to this voltage
-	  in suspend.
+	- regulator-suspend-min-microvolt: minimum voltage may be set in
+	  suspend state.
+	- regulator-suspend-max-microvolt: maximum voltage may be set in
+	  suspend state.
+	- regulator-suspend-microvolt: the default voltage which regulator
+	  would be set in suspend. The voltage for suspend also can be
+	  adjusted among {regulator-suspend-min-microvolt,
+	  regulator-suspend-max-microvolt} by calling
+	  regulator_set_suspend_voltage(). This property is not deprecated,
+	  setting voltage for suspend mode via API the regulator driver
+	  provides is recommended.
+	- regulator-changeable-in-suspend: whether the default voltage and
+	  the regulator on/off in suspend can be changed in runtime.
 	- regulator-mode: operating mode in the given suspend state.
 	  The set of possible operating modes depends on the capabilities of
 	  every hardware so the valid modes are documented on each regulator
-- 
2.7.4
