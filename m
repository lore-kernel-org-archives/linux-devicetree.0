From: Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH] mfd: dt-bindings: Add PMIC reset property
Date: Thu, 15 Mar 2018 11:58:50 +0100
Message-ID: <1521111530-39920-1-git-send-email-d.schultz@phytec.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: heiko@sntech.de, w.egorov@phytec.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation about a new rk808 devicetree property, which can
enable resets by the PMIC.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
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
