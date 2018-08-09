From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v3 1/3] dt-bindings: thermal: Add binding document for SR thermal
Date: Thu,  9 Aug 2018 18:24:57 +0530
Message-ID: <1533819299-3401-2-git-send-email-srinath.mannam@broadcom.com>
References: <1533819299-3401-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533819299-3401-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Pramod Kumar <pramod.kumar@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Pramod Kumar <pramod.kumar@broadcom.com>

Add binding document for supported thermal implementation
in Stingray.

Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 .../bindings/thermal/brcm,sr-thermal.txt           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt

diff --git a/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
new file mode 100644
index 0000000..fc9e6d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
@@ -0,0 +1,23 @@
+* Broadcom Stingray Thermal
+
+This binding describes thermal sensors that is part of Stingray SoCs.
+
+Required properties:
+- compatible : Must be "brcm,sr-thermal"
+- reg : memory where tmon data will be available.
+- brcm,tmon-mask: A one cell bit mask of valid TMON sources.
+                  Each bit represents single TMON source.
+
+Example:
+	tmons {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x8f100000 0x100>;
+
+		tmon: thermal@0 {
+			compatible = "brcm,sr-thermal";
+			reg = <0 0x40>;
+			brcm,tmon-mask = <0x3f>;
+		};
+	};
-- 
2.7.4
