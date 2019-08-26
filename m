From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH 2/2] hwmon: (as370-hwmon) Add DT bindings for Synaptics AS370
 PVT
Date: Mon, 26 Aug 2019 10:02:27 +0000
Message-ID: <20190826175113.74be0368@xhacker.debian>
References: <20190826174942.2b28ff05@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826174942.2b28ff05@xhacker.debian>
Content-Language: en-US
Content-ID: <252215FE06C11B46B99BDE304DC6DA60@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for Synaptics AS370 PVT sensors.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 Documentation/devicetree/bindings/hwmon/as370.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/as370.txt

diff --git a/Documentation/devicetree/bindings/hwmon/as370.txt b/Documentat=
ion/devicetree/bindings/hwmon/as370.txt
new file mode 100644
index 000000000000..d102fe765124
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/as370.txt
@@ -0,0 +1,11 @@
+Bindings for Synaptics AS370 PVT sensors
+
+Required properties:
+- compatible : "syna,as370-hwmon"
+- reg        : address and length of the register set.
+
+Example:
+	hwmon@ea0810 {
+		compatible =3D "syna,as370-hwmon";
+		reg =3D <0xea0810 0xc>;
+	};
--=20
2.23.0.rc1
