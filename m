From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v3 1/3] nvmem: dt: document SNVS LPGPR binding
Date: Wed,  7 Jun 2017 08:41:56 +0200
Message-ID: <20170607064158.16422-2-o.rempel@pengutronix.de>
References: <20170607064158.16422-1-o.rempel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170607064158.16422-1-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Documentation bindings for the Low Power General Purpose Register
available on i.MX6 SoCs in the Secure Non-Volatile Storage.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../devicetree/bindings/nvmem/snvs-lpgpr.txt          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt

diff --git a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
new file mode 100644
index 000000000000..21910fb3159f
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
@@ -0,0 +1,19 @@
+Device tree bindings for Low Power General Purpose Register found in i.MX6Q/D
+Secure Non-Volatile Storage.
+
+This DT node should be represented as a sub-node of a "syscon",
+"simple-mfd" node.
+
+Required properties:
+- compatible: should be:
+	"fsl,imx6q-snvs-lpgpr" for Freescale i.MX6Q/D/DL/S
+
+Example:
+snvs: snvs@020cc000 {
+	compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
+	reg = <0x020cc000 0x4000>;
+
+	snvs_lpgpr: snvs-lpgpr {
+		compatible = "fsl,imx6q-snvs-lpgpr";
+	};
+};
-- 
2.11.0
