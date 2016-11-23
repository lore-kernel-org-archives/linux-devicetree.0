From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V3 1/2] regulator: DT: Add settling time property for non-linear voltage change
Date: Wed, 23 Nov 2016 16:32:39 +0530
Message-ID: <1479898960-14166-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Douglas Anderson <dianders@chromium.org>, Aleksandr Frid <afrid@nvidia.com>
List-Id: devicetree@vger.kernel.org

Some regulators (some PWM regulators) have the voltage transition
exponentially. On such cases, the settling time for voltage change
is treated as constant time.

Add DT property for providing the settling time for any level of
voltage change for non-linear voltage change.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
CC: Douglas Anderson <dianders@chromium.org>
CC: Aleksandr Frid <afrid@nvidia.com>

---
This patch is continuation of discussion on patch
   regulator: pwm: Fix regulator ramp delay for continuous mode
   https://patchwork.kernel.org/patch/9216857/
where is it discussed to have separate property for PWM which has
exponential voltage transition.

Changes from V1:
- Pass the flag to tell that voltage ramp is exponential instead of
  providing delay.

Changes from V2:
- Based on review comment from V1, make the settling time property
  independent of the regulator-ramp-delay and move this out of PWM
  regulator.
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 6ab5aef..d18edb0 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -21,6 +21,9 @@ Optional properties:
   design requires. This property describes the total system ramp time
   required due to the combination of internal ramping of the regulator itself,
   and board design issues such as trace capacitance and load on the supply.
+- regulator-settling-time-us: Settling time, in microseconds, for voltage
+  change if regulator have the constant time for any level voltage change.
+  This is useful when regulator have exponential voltage change.
 - regulator-soft-start: Enable soft start so that voltage ramps slowly
 - regulator-state-mem sub-root node for Suspend-to-RAM mode
   : suspend to memory, the device goes to sleep, but all data stored in memory,
-- 
2.1.4
