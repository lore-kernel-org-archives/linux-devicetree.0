From: Jacky Bai <ping.bai@nxp.com>
Subject: [PATCH v2 1/2] Doc: bindings: Add binding doc for nxp system counter
 timer
Date: Wed, 12 Dec 2018 05:28:23 +0000
Message-ID: <1544592770-19996-1-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the binding doc for nxp system counter timer module.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
change v1->v2
 - remove the blank line at EOF
---
 .../devicetree/bindings/timer/nxp,sysctr_timer.txt | 26 ++++++++++++++++++=
++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,sysctr_time=
r.txt

diff --git a/Documentation/devicetree/bindings/timer/nxp,sysctr_timer.txt b=
/Documentation/devicetree/bindings/timer/nxp,sysctr_timer.txt
new file mode 100644
index 0000000..21f1527
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,sysctr_timer.txt
@@ -0,0 +1,26 @@
+NXP System Counter Module(sys_ctr)
+
+The system counter(sys_ctr) is a programmable system counter which provide=
s
+a shared time base to Cortex A15, A7, A53, A73, etc. it is intended for us=
e in
+applications where the counter is always powered and support multiple,
+unrelated clocks.
+
+Required properties:
+
+- compatible :      should be "nxp,sysctr-timer"
+- reg :             Specifies the base physical address and size of the co=
mapre
+                    frame and the counter control, read & compare.
+- interrupts :      should be the compare frames' interrupt
+- clock-frequency : Specifies the counter clock frequency.
+
+Example:
+
+	system_counter: timer@306a0000 {
+		compatible =3D "nxp,sysctr-timer";
+		reg =3D <0x0 0x306a0000 0x0 0x10000>, /* system-counter-rd base */
+		      <0x0 0x306b0000 0x0 0x10000>, /* system-counter-cmp base */
+		      <0x0 0x306c0000 0x0 0x10000>; /* system-counter-ctrl base */
+		clock-frequency =3D <8000000>;
+		interrupts =3D <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+	};
--=20
1.9.1
