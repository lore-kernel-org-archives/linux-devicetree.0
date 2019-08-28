From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH v2 1/8] regulator: add binding for the SY8824C voltage
 regulator
Date: Wed, 28 Aug 2019 06:08:52 +0000
Message-ID: <20190828135734.05aa51ec@xhacker.debian>
References: <20190828135646.52457ac3@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828135646.52457ac3@xhacker.debian>
Content-Language: en-US
Content-ID: <48C12E409EA8FD48808A9AA0DA49990A@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SY8824C is an I2C-controlled adjustable voltage regulator made by
Silergy Corp.

Add its device tree binding.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 .../devicetree/bindings/regulator/sy8824x.txt | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/sy8824x.txt

diff --git a/Documentation/devicetree/bindings/regulator/sy8824x.txt b/Docu=
mentation/devicetree/bindings/regulator/sy8824x.txt
new file mode 100644
index 000000000000..ff8d1af04f7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/sy8824x.txt
@@ -0,0 +1,20 @@
+SY8824C Voltage regulator
+
+Required properties:
+- compatible: Must be "silergy,sy8824c"
+- reg: I2C slave address
+
+Any property defined as part of the core regulator binding, defined in
+./regulator.txt, can also be used.
+
+Example:
+
+	vcore: regulator@00 {
+		compatible =3D "silergy,sy8824c";
+		reg =3D <0x66>;
+		regulator-name =3D "vcore";
+		regulator-min-microvolt =3D <800000>;
+		regulator-max-microvolt =3D <1150000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
--=20
2.23.0.rc1
