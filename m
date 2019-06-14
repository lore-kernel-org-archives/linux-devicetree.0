From: daniel.baluta@nxp.com
Subject: [PATCH 2/2] dt-bindings: arm: fsl: Add DSP IPC binding support
Date: Fri, 14 Jun 2019 16:16:50 +0800
Message-ID: <20190614081650.11880-3-daniel.baluta@nxp.com>
References: <20190614081650.11880-1-daniel.baluta@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614081650.11880-1-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: s.hauer@pengutronix.de, shengjiu.wang@nxp.com, festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com, daniel.baluta@nxp.com, daniel.baluta@gmail.com, anson.huang@nxp.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, o.rempel@pengutronix.de
List-Id: devicetree@vger.kernel.org

From: Daniel Baluta <daniel.baluta@nxp.com>

DSP IPC is the layer that allows the Host CPU to communicate
with DSP firmware.
DSP is part of some i.MX8 boards (e.g i.MX8QM, i.MX8QXP)

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 .../bindings/arm/freescale/fsl,dsp.yaml       | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml
new file mode 100644
index 000000000000..16d9df1d397b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/freescale/fsl,dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX IPC DSP driver
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+description: |
+  IPC communication layer between Host CPU and DSP on NXP i.MX8 platforms
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx-dsp
+
+  mboxes:
+    description:
+      List of phandle of 2 MU channels for TXDB, 2 MU channels for RXDB
+      (see mailbox/fsl,mu.txt)
+    maxItems: 1
+
+  mbox-names
+    description:
+      Mailboxes names
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/string"
+      - enum: [ "txdb0", "txdb1", "rxdb0", "rxdb1" ]
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+examples:
+  - |
+    dsp {
+      compatbile = "fsl,imx-dsp";
+      mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+      mboxes = <&lsio_mu13 2 0 &lsio_mu13 2 1 &lsio_mu13 3 0 &lsio_mu13 3 1>;
+    };
-- 
2.17.1
