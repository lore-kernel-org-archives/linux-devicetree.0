From: Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH v4 1/2] dt-bindings: timer: Add binding doc for nxp system
 counter timer
Date: Tue, 21 May 2019 07:18:48 +0000
Message-ID: <20190521072355.12928-1-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <EC89990D38395545B1C0999B3062C664@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Bai Ping <ping.bai@nxp.com>

Add the binding doc for nxp system counter timer module.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
change v1->v2
 - remove the blank line at EOF
change v2->v3
 - update the binding example based on the driver change
change v3->v4
 - no change
---
 .../bindings/timer/nxp,sysctr-timer.txt       | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,sysctr-time=
r.txt

diff --git a/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt b=
/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt
new file mode 100644
index 000000000000..d57659996d62
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,sysctr-timer.txt
@@ -0,0 +1,25 @@
+NXP System Counter Module(sys_ctr)
+
+The system counter(sys_ctr) is a programmable system counter which provide=
s
+a shared time base to Cortex A15, A7, A53, A73, etc. it is intended for us=
e in
+applications where the counter is always powered and support multiple,
+unrelated clocks. The compare frame inside can be used for timer purpose.
+
+Required properties:
+
+- compatible :      should be "nxp,sysctr-timer"
+- reg :             Specifies the base physical address and size of the co=
mapre
+                    frame and the counter control, read & compare.
+- interrupts :      should be the first compare frames' interrupt
+- clocks : 	    Specifies the counter clock.
+- clock-names: 	    Specifies the clock's name of this module
+
+Example:
+
+	system_counter: timer@306a0000 {
+		compatible =3D "nxp,sysctr-timer";
+		reg =3D <0x306a0000 0x20000>;/* system-counter-rd & compare */
+		clocks =3D <&clk_8m>;
+		clock-names =3D "per";
+		interrupts =3D <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+	};
--=20
2.21.0
