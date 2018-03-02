From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v5 1/5] regulator: bindings: Add properties for coupled
 regulators
Date: Fri, 02 Mar 2018 09:42:45 +0100
Message-ID: <1519980169-8491-2-git-send-email-m.purski@samsung.com>
References: <1519980169-8491-1-git-send-email-m.purski@samsung.com>
        <CGME20180302085126eucas1p10efa5726623b9b8a31ac438eec9fb726@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1519980169-8491-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

Some regulators require keeping their voltage spread below defined
max_spread.

Add properties to provide information on regulators' coupling.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 2babe15b..62510d6 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -68,6 +68,11 @@ Optional properties:
 	0: Disable active discharge.
 	1: Enable active discharge.
 	Absence of this property will leave configuration to default.
+- regulator-coupled-with: Regulators with which the regulator
+  is coupled. The linkage is 2-way - all coupled regulators should be linked
+  with each other.
+- regulator-coupled-max-spread: Max spread between voltages of coupled regulators
+  in microvolts.
 
 Deprecated properties:
 - regulator-compatible: If a regulator chip contains multiple
-- 
2.7.4
