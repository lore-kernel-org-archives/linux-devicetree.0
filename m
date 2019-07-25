Return-Path: <SRS0=mZ85=VW=outlook.com=leiwang_git@kernel.org>
From: Lei Wang <leiwang_git@outlook.com>
Subject: [PATCH v5 1/2] dt-bindings: edac: arm-dmc520.txt
Date: Thu, 25 Jul 2019 00:48:41 +0000
Message-ID: 
 <BN6PR04MB1107FB24B17C9A77BC90A4A886C10@BN6PR04MB1107.namprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "bp@alien8.de" <bp@alien8.de>, "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, "ruizhao@microsoft.com" <ruizhao@microsoft.com>, Lei Wang <leiwang_git@outlook.com>
List-ID: <devicetree@vger.kernel.org>

This is the device tree bindings for new EDAC driver dmc520_edac.c.

Signed-off-by: Lei Wang <leiwang_git@outlook.com>
Reviewed-by: James Morse <james.morse@arm.com>

---
    No change in v5.
---
 .../devicetree/bindings/edac/arm-dmc520.txt   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/arm-dmc520.txt

diff --git a/Documentation/devicetree/bindings/edac/arm-dmc520.txt b/Docume=
ntation/devicetree/bindings/edac/arm-dmc520.txt
new file mode 100644
index 000000000000..71e7aa32971a
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/arm-dmc520.txt
@@ -0,0 +1,26 @@
+* ARM DMC-520 EDAC node
+
+Required properties:
+- compatible		: "brcm,dmc-520", "arm,dmc-520".
+- reg			: Address range of the DMC-520 registers.
+- interrupts		: DMC-520 interrupt numbers. The example below specifies
+			  two interrupt lines for dram_ecc_errc_int and
+			  dram_ecc_errd_int.
+- interrupt-config	: This is an array of interrupt masks. For each of the
+			  above interrupt line, add one interrupt mask element to
+			  it. That is, there is a 1:1 mapping from each interrupt
+			  line to an interrupt mask. An interrupt mask can represent
+			  multiple interrupts being enabled. Refer to interrupt_control
+			  register in DMC-520 TRM for interrupt mapping. In the example
+			  below, the interrupt configuration enables dram_ecc_errc_int
+			  and dram_ecc_errd_int. And each interrupt is connected to
+			  a separate interrupt line.
+
+Example:
+
+dmc0: dmc@200000 {
+	compatible =3D "brcm,dmc-520", "arm,dmc-520";
+	reg =3D <0x200000 0x80000>;
+	interrupts =3D <0x0 0x349 0x4>, <0x0 0x34B 0x4>;
+	interrupt-config =3D <0x4>, <0x8>;
+};
--=20
2.17.1
