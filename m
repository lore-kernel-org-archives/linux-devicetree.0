From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/4] regulator: DT: Add DT property for active-discharge configuration
Date: Tue, 1 Mar 2016 18:08:12 +0530
Message-ID: <1456835895-16503-2-git-send-email-ldewangan@nvidia.com>
References: <1456835895-16503-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456835895-16503-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, lgirdwood@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add common DT property for regulator node to support of
active discharge enable/disable configuration of regulator.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 1d112fc..ecfc593 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -44,6 +44,11 @@ Optional properties:
   any consumer request.
 - regulator-pull-down: Enable pull down resistor when the regulator is disabled.
 - regulator-over-current-protection: Enable over current protection.
+- regulator-active-discharge: tristate, enable/disable active discharge of
+  regulators. The values are:
+	0: Disable active discharge.
+	1: Enable active discharge.
+	Absence of this property will leave configuration to default.
 
 Deprecated properties:
 - regulator-compatible: If a regulator chip contains multiple
-- 
2.1.4
