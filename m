From: Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH v2] mfd: dt-bindings: Add rk808 PMIC reset property
Date: Thu, 29 Mar 2018 16:44:43 +0200
Message-ID: <1522334683-22169-1-git-send-email-d.schultz@phytec.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: mark.rutland@arm.com, heiko@sntech.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation about a new rk808 devicetree property. This can enable
the rk805/rk808/rk818 PMIC reset, instead of using soft resets from the
Control and Reset Module.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
Changes:
	v2: Changed commit message

 Documentation/devicetree/bindings/mfd/rk808.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
index 91b6522..fa1a30f 100644
--- a/Documentation/devicetree/bindings/mfd/rk808.txt
+++ b/Documentation/devicetree/bindings/mfd/rk808.txt
@@ -20,6 +20,8 @@ Optional properties:
   default output clock name
 - rockchip,system-power-controller: Telling whether or not this pmic is controlling
   the system power.
+- rockchip,system-reset-controller: Telling whether or not this pmic is controlling
+  the system reset.
 
 Optional RK805 properties:
 - vcc1-supply:  The input supply for DCDC_REG1
-- 
2.7.4
