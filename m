From: Maciej Purski <m.purski@samsung.com>
Subject: [RFC PATCH v2 1/3] regulator: bindings: Add properties for coupled
 regulators
Date: Wed, 18 Oct 2017 14:47:00 +0200
Message-ID: <1508330822-8039-2-git-send-email-m.purski@samsung.com>
References: <1508330822-8039-1-git-send-email-m.purski@samsung.com>
        <CGME20171018124727eucas1p255ccce41852d5585640f2d97153d2fa8@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1508330822-8039-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

Some regulators require keeping their voltage spread below defined
max_spread.

Add properties to provide information on regulators' coupling.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 378f6dc..6769565 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -60,6 +60,10 @@ Optional properties:
 	0: Disable active discharge.
 	1: Enable active discharge.
 	Absence of this property will leave configuration to default.
+- regulator-coupled-with: Phandle to regulators with which the regulator
+  should be coupled. Allow up to 9 phandles.
+- regulator-coupled-max-spread: Max spread between voltages of coupled regulators
+  in microvolts.
 
 Deprecated properties:
 - regulator-compatible: If a regulator chip contains multiple
-- 
2.7.4
