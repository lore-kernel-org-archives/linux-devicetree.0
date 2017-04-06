From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 3/3] nvmem: dt: document SNVS LPGPR binding
Date: Thu,  6 Apr 2017 09:31:07 +0200
Message-ID: <20170406073107.32445-3-o.rempel@pengutronix.de>
References: <20170406073107.32445-1-o.rempel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170406073107.32445-1-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: o.rempel@pengutronix.de
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Documenation bindings for the Low Power General Purpose Registe
available on i.MX6 SoCs in the Secure Non-Volatile Storage.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt

diff --git a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
new file mode 100644
index 000000000000..9a8be1a2d12e
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
@@ -0,0 +1,15 @@
+Device tree bindings for Low Power General Purpose Registe found in i.MX6Q/D
+Secure Non-Volatile Storage.
+
+Required properties:
+- compatible: should be one of
+	"fsl,imx6q-snvs-lpgpr" (i.MX6Q/D/DL/S).
+- offset: Should contain the offset relative to syscon parrent node.
+- regmap: Should contain a phandle pointing to syscon.
+
+Example:
+	snvs_lpgpr: snvs-lpgpr {
+		compatible = "fsl,imx6q-snvs-lpgpr";
+		regmap = <&snvs>;
+		offset = <0x68>;
+	};
-- 
2.11.0
