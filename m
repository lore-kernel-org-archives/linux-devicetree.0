Return-Path: <SRS0=F++/=RK=outlook.com=ruizhao@kernel.org>
From: Rui Zhao <ruizhao@outlook.com>
Subject: [PATCH v2 2/2] dt-bindings: edac: arm-dmc520.txt
Date: Thu, 7 Mar 2019 01:24:05 +0000
Message-ID: <BN7PR08MB5572B3388B2D7DC8F6C7F285AE4C0@BN7PR08MB5572.namprd08.prod.outlook.com>
References: <1551921818-2825-1-git-send-email-ruizhao@outlook.com>
In-Reply-To: <1551921818-2825-1-git-send-email-ruizhao@outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "bp@alien8.de" <bp@alien8.de>, "james.morse@arm.com" <james.morse@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "okaya@kernel.org" <okaya@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, Rui Zhao <ruizhao@microsoft.com>
List-ID: <devicetree@vger.kernel.org>

From: Rui Zhao <ruizhao@microsoft.com>

dt-bindings for new EDAC driver dmc520_edac.c.

Signed-off-by: Rui Zhao <ruizhao@microsoft.com>
---
 .../devicetree/bindings/edac/arm-dmc520.txt         | 21 +++++++++++++++++=
++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/arm-dmc520.txt

diff --git a/Documentation/devicetree/bindings/edac/arm-dmc520.txt b/Docume=
ntation/devicetree/bindings/edac/arm-dmc520.txt
new file mode 100644
index 0000000..7bea7dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/arm-dmc520.txt
@@ -0,0 +1,21 @@
+* ARM DMC-520 EDAC node
+
+Required properties:
+- compatible		: "arm,dmc-520".
+- reg			: Address range of the DMC-520 registers.
+- interrupts		: DMC-520 interrupt numbers.
+- interrupt-mask	: Interrupts to be enabled, refer to interrupt_control
+			  register in DMC-520 TRM for interrupt mapping.
+
+Optional properties:
+- interrupt-shared	: set this property if and only if all DMC-520
+			  interrupts share the interrupt number.
+
+Example:
+
+dmc0: dmc@200000 {
+	compatible =3D "arm,dmc-520";
+	reg =3D <0x200000 0x80000>;
+	interrupts =3D <0x0 0x347 0x4>, <0x0 0x34B 0x4>;
+	interrupt-mask =3D <0xC>;
+};
--=20
2.7.4
