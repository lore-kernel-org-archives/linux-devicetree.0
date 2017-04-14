From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v2 1/2] dt-binding: regulator: anatop: make regulator name property required
Date: Fri, 14 Apr 2017 22:30:33 +0800
Message-ID: <1492180234-2496-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We actually can't allow the missing of the regualor name, thus update
the binding doc to make regulator-name property to be required.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/regulator/anatop-regulator.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
index 1d58c8c..a3106c7 100644
--- a/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/anatop-regulator.txt
@@ -2,6 +2,7 @@ Anatop Voltage regulators
 
 Required properties:
 - compatible: Must be "fsl,anatop-regulator"
+- regulator-name: A string used as a descriptive name for regulator outputs
 - anatop-reg-offset: Anatop MFD register offset
 - anatop-vol-bit-shift: Bit shift for the register
 - anatop-vol-bit-width: Number of bits used in the register
-- 
2.7.4
