From: andy.tang@nxp.com
Subject: [PATCH] dt-bindings: qoriq-clock: Add ls1028a chip compatible string
Date: Wed, 24 Apr 2019 10:28:47 +0800
Message-ID: <20190424022847.25510-1-andy.tang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yuantian Tang <andy.tang@nxp.com>

Add ls1028a chip compatible string in binding document.

Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
---
 .../devicetree/bindings/clock/qoriq-clock.txt      |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
index c655f28..9cf4a07 100644
--- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
+++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
@@ -39,6 +39,7 @@ Required properties:
 	* "fsl,b4860-clockgen"
 	* "fsl,ls1012a-clockgen"
 	* "fsl,ls1021a-clockgen"
+	* "fsl,ls1028a-clockgen"
 	* "fsl,ls1043a-clockgen"
 	* "fsl,ls1046a-clockgen"
 	* "fsl,ls1088a-clockgen"
-- 
1.7.1
