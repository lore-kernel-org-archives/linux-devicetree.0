Return-Path: <SRS0=rNTY=OO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr80049.outbound.protection.outlook.com ([40.107.8.49]:38811
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727449AbeLEKY7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 5 Dec 2018 05:24:59 -0500
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: [PATCH v1 2/9] dt/bindings: drm/komeda: Add DT bindings for ARM
 display processor D71
Date: Wed, 5 Dec 2018 10:24:51 +0000
Message-ID: <20181205102427.7936-1-james.qian.wang@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>nd <nd@arm.com>, "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
List-ID: <devicetree@vger.kernel.org>

Add DT bindings documentation for the ARM display processor D71 and later
IPs.

Signed-off-by: James (Qian) Wang <james.qian.wang@arm.com>
---
 .../bindings/display/arm/arm,komeda.txt       | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/arm/arm,komed=
a.txt

diff --git a/Documentation/devicetree/bindings/display/arm/arm,komeda.txt b=
/Documentation/devicetree/bindings/display/arm/arm,komeda.txt
new file mode 100644
index 000000000000..d4b53c11b2a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/arm/arm,komeda.txt
@@ -0,0 +1,87 @@
+Device Tree bindings for ARM Komeda display driver
+
+Required properties:
+- compatible: Should be "arm,mali-d71"
+- reg: Physical base address and length of the registers in the system
+- interrupts: the interrupt line numbers of the device in the system
+- interrupt-names: contains the names of the IRQs in the order they were
+    provided in the "interrupts" property. Must contain: "DPU".
+- clocks: A list of phandle + clock-specifier pairs, one for each entry
+    in 'clock-names'
+- clock-names: A list of clock names. It should contain:
+      - "pclk": for the APB interface clock
+      - "mclk": for the main processor clock
+- #address-cells: Must be 1
+- #size-cells: Must be 0
+
+Required properties for sub-node: pipeline@nq
+Each device contains one or two pipeline sub-nodes (at least one), each
+pipeline node should provide properties:
+- reg: Zero-indexed identifier for the pipeline
+- clocks: A list of phandle + clock-specifier pairs, one for each entry
+    in 'clock-names'
+- clock-names: should contain:
+      - "aclk": AXI interface clock
+      - "pxclk": pixel clock
+
+- port: each pipeline connect to an encoder input port. The connection is
+    modelled using the OF graph bindings specified in
+    Documentation/devicetree/bindings/graph.txt
+
+Optional properties:
+  - memory-region: phandle to a node describing memory (see
+    Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
+    to be used for the framebuffer; if not present, the framebuffer may
+    be located anywhere in memory.
+
+Example:
+/ {
+	...
+
+	dp0: display@c00000 {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		compatible =3D "arm,mali-d71";
+		reg =3D <0xc00000 0x20000>;
+		interrupts =3D <0 168 4>;
+		interrupt-names =3D "DPU";
+		clocks =3D <&dpu_mclk>, <&dpu_aclk>;
+		clock-names =3D "mclk", "pclk";
+
+		pl0: pipeline@0 {
+			clocks =3D <&fpgaosc2>, <&dpu_aclk>;
+			clock-names =3D "pxclk", "aclk";
+			reg =3D <0>;
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@0 {
+					reg =3D <0>;
+					dp0_pl0_out: endpoint {
+						remote-endpoint =3D <&db_dvi0_in>;
+					};
+				};
+			};
+		};
+		pl1: pipeline@1 {
+			clocks =3D <&fpgaosc2>, <&dpu_aclk>;
+			clock-names =3D "pxclk", "aclk";
+			reg =3D <1>;
+
+			ports {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				port@0 {
+					reg =3D <0>;
+					dp0_pl1_out: endpoint {
+						remote-endpoint =3D <&db_dvi1_in>;
+					};
+				};
+			};
+		};
+	};
+	...
+};
--=20
2.17.1
