From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH v2 2/2] hwmon: (as370-hwmon) Add DT bindings for Synaptics
 AS370 PVT
Date: Tue, 27 Aug 2019 03:44:57 +0000
Message-ID: <20190827113337.384457f6@xhacker.debian>
References: <20190827113214.13773d45@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827113214.13773d45@xhacker.debian>
Content-Language: en-US
Content-ID: <81C5B70750D99244A7F4EAFA30C0A6DF@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
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
