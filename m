From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v7 2/6] regulator: bindings: Add properties for coupled
 regulators
Date: Mon, 23 Apr 2018 16:33:38 +0200
Message-ID: <1524494022-22260-3-git-send-email-m.purski@samsung.com>
References: <1524494022-22260-1-git-send-email-m.purski@samsung.com>
        <CGME20180423143400eucas1p1bde12f792993806e9e88277177b59dfb@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1524494022-22260-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

Some regulators require keeping their voltage spread below defined
max_spread.

Add properties to provide information on regulators' coupling.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 2babe15b..a096fae 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -68,6 +68,11 @@ Optional properties:
 	0: Disable active discharge.
 	1: Enable active discharge.
 	Absence of this property will leave configuration to default.
+- regulator-coupled-with: Regulators with which the regulator
+  is coupled. The linkage is 2-way - all coupled regulators should be linked
+  with each other. A regulator should not be coupled with its supplier.
+- regulator-coupled-max-spread: Max spread between voltages of coupled regulators
+  in microvolts.
 
 Deprecated properties:
 - regulator-compatible: If a regulator chip contains multiple
-- 
2.7.4
