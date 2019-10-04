From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/2] dt-bindings: gpio: brcm: Add bindings for xgs-iproc
Date: Fri,  4 Oct 2019 14:25:24 +1300
Message-ID: <20191004012525.26647-2-chris.packham@alliedtelesis.co.nz>
References: <20191004012525.26647-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004012525.26647-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, richard.laing@alliedtelesis.co.nz
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

This GPIO controller is present on a number of Broadcom switch ASICs
with integrated SoCs. It is similar to the nsp-gpio and iproc-gpio
blocks but different enough to require a separate driver.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../bindings/gpio/brcm,xgs-iproc.txt          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,xgs-iproc=
.txt

diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.txt b/=
Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.txt
new file mode 100644
index 000000000000..328b844c82dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc.txt
@@ -0,0 +1,41 @@
+Broadcom XGS iProc GPIO controller
+
+This controller is the Chip Common A GPIO present on a number of Broadco=
m
+switch ASICs with integrated SoCs.
+
+Required properties:
+- compatible:
+    Must be "brcm,iproc-gpio-cca"
+
+- reg:
+    The first region defines the base I/O address containing
+    the GPIO controller registers. The second region defines
+    the I/O address containing the Chip Common A interrupt
+    registers.
+
+Optional properties:
+
+- interrupts:
+    The interrupt shared by all GPIO lines for this controller.
+
+- #interrupt-cells:
+    Should be <2>.  The first cell is the GPIO number, the second should=
 specify
+    flags.
+
+    See also Documentation/devicetree/bindings/interrupt-controller/inte=
rrupts.txt
+
+- interrupt-controller:
+    Marks the device node as an interrupt controller
+
+Example:
+	gpioa: gpio@18000060 {
+		compatible =3D "brcm,iproc-gpio-cca";
+		#gpio-cells =3D <2>;
+		reg =3D <0x18000060 0x50>,
+		      <0x18000000 0x50>;
+		ngpios =3D <12>;
+		gpio-controller;
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+		interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+	};
--=20
2.23.0
