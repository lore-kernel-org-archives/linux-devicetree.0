From: Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: [PATCH V5 1/5] bindings: regulator: added support for suspend states
Date: Fri, 26 Jan 2018 21:08:43 +0800
Message-ID: <1516972127-972-2-git-send-email-zhang.chunyan@linaro.org>
References: <1516972127-972-1-git-send-email-zhang.chunyan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516972127-972-1-git-send-email-zhang.chunyan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 378f6dc..e459226 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -42,8 +42,16 @@ Optional properties:
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
+	  would be set in suspend. This property is now deprecated, instead
+	  setting voltage for suspend mode via the API which regulator
+	  driver provides is recommended.
+	- regulator-changeable-in-suspend: whether the default voltage and
+	  the regulator on/off in suspend can be changed in runtime.
 	- regulator-mode: operating mode in the given suspend state.
 	  The set of possible operating modes depends on the capabilities of
 	  every hardware so the valid modes are documented on each regulator
-- 
2.7.4
