From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 2/5] dt-bindings: soc: Add documentation for the MediaTek SCPSYS unit
Date: Wed, 20 May 2015 16:18:57 +0200
Message-ID: <1432131540-2523-3-git-send-email-s.hauer@pengutronix.de>
References: <1432131540-2523-1-git-send-email-s.hauer@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432131540-2523-1-git-send-email-s.hauer@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This adds documentation for the MediaTek SCPSYS unit found in MT8173 SoCs.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../devicetree/bindings/soc/mediatek/scpsys.txt    | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt

diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
new file mode 100644
index 0000000..87f2091
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -0,0 +1,34 @@
+MediaTek SCPSYS
+===============
+
+The System Control Processor System (SCPSYS) has several power management
+related tasks in the system. The tasks include thermal measurement, dynamic
+voltage frequency scaling (DVFS), interrupt filter and lowlevel sleep control.
+The System Power Manager (SPM) inside the SCPSYS is for the MTCMOS power
+domain control.
+
+The driver implements the Generic PM domain bindings described in
+power/power_domain.txt. It provides the power domains defined in
+include/dt-bindings/power/mt8173-power.h.
+
+Required properties:
+- compatible: Must be "mediatek,mt8173-scpsys"
+- #power-domain-cells: Must be 1
+- reg: Address range of the SCPSYS unit
+- infracfg: must contain a phandle to the infracfg controller
+
+Example:
+
+	scpsys: scpsys@10006000 {
+		#power-domain-cells = <1>;
+		compatible = "mediatek,mt8173-scpsys";
+		reg = <0 0x10006000 0 0x1000>;
+		infracfg = <&infracfg>;
+	};
+
+Example consumer:
+
+	afe: mt8173-afe-pcm@11220000 {
+		compatible = "mediatek,mt8173-afe-pcm";
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_AUDIO>;
+	};
-- 
2.1.4
