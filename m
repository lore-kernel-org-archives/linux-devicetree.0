From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 09/11] nfc: st-nci: Add device tree documentation for spi phy
Date: Fri, 14 Aug 2015 22:33:38 +0200
Message-ID: <1439584420-5446-10-git-send-email-christophe-h.ricard@st.com>
References: <1439584420-5446-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439584420-5446-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add st-nci-spi phy devicetree documentation

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/net/nfc/st-nci-i2c.txt     | 33 ++++++++++++++=
++++++++
 .../devicetree/bindings/net/nfc/st-nci-spi.txt     | 31 ++++++++++++++=
++++++
 .../devicetree/bindings/net/nfc/st-nci.txt         | 33 --------------=
--------
 3 files changed, 64 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci-i2=
c.txt
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci-sp=
i.txt
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci.tx=
t

diff --git a/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt b=
/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
new file mode 100644
index 0000000..d707588
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
@@ -0,0 +1,33 @@
+* STMicroelectronics SAS. ST NCI NFC Controller
+
+Required properties:
+- compatible: Should be "st,st21nfcb-i2c" or "st,st21nfcc-i2c".
+- clock-frequency: I=C2=B2C work frequency.
+- reg: address on the bus
+- interrupt-parent: phandle for the interrupt gpio controller
+- interrupts: GPIO interrupt to which the chip is connected
+- reset-gpios: Output GPIO pin used to reset the ST21NFCB
+
+Optional SoC Specific Properties:
+- pinctrl-names: Contains only one value - "default".
+- pintctrl-0: Specifies the pin control groups used for this controlle=
r.
+
+Example (for ARM-based BeagleBoard xM with ST21NFCB on I2C2):
+
+&i2c2 {
+
+	status =3D "okay";
+
+	st21nfcb: st21nfcb@8 {
+
+		compatible =3D "st,st21nfcb-i2c";
+
+		reg =3D <0x08>;
+		clock-frequency =3D <400000>;
+
+		interrupt-parent =3D <&gpio5>;
+		interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
+
+		reset-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
+	};
+};
diff --git a/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt b=
/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt
new file mode 100644
index 0000000..525681b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt
@@ -0,0 +1,31 @@
+* STMicroelectronics SAS. ST NCI NFC Controller
+
+Required properties:
+- compatible: Should be "st,st21nfcb-spi"
+- spi-max-frequency: Maximum SPI frequency (<=3D 10000000).
+- interrupt-parent: phandle for the interrupt gpio controller
+- interrupts: GPIO interrupt to which the chip is connected
+- reset-gpios: Output GPIO pin used to reset the ST21NFCB
+
+Optional SoC Specific Properties:
+- pinctrl-names: Contains only one value - "default".
+- pintctrl-0: Specifies the pin control groups used for this controlle=
r.
+
+Example (for ARM-based BeagleBoard xM with ST21NFCB on SPI4):
+
+&mcspi4 {
+
+	status =3D "okay";
+
+	st21nfcb: st21nfcb@0 {
+
+		compatible =3D "st,st21nfcb-spi";
+
+		clock-frequency =3D <4000000>;
+
+		interrupt-parent =3D <&gpio5>;
+		interrupts =3D <2 IRQ_TYPE_EDGE_RISING>;
+
+		reset-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
+	};
+};
diff --git a/Documentation/devicetree/bindings/net/nfc/st-nci.txt b/Doc=
umentation/devicetree/bindings/net/nfc/st-nci.txt
deleted file mode 100644
index d707588..0000000
--- a/Documentation/devicetree/bindings/net/nfc/st-nci.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* STMicroelectronics SAS. ST NCI NFC Controller
-
-Required properties:
-- compatible: Should be "st,st21nfcb-i2c" or "st,st21nfcc-i2c".
-- clock-frequency: I=C2=B2C work frequency.
-- reg: address on the bus
-- interrupt-parent: phandle for the interrupt gpio controller
-- interrupts: GPIO interrupt to which the chip is connected
-- reset-gpios: Output GPIO pin used to reset the ST21NFCB
-
-Optional SoC Specific Properties:
-- pinctrl-names: Contains only one value - "default".
-- pintctrl-0: Specifies the pin control groups used for this controlle=
r.
-
-Example (for ARM-based BeagleBoard xM with ST21NFCB on I2C2):
-
-&i2c2 {
-
-	status =3D "okay";
-
-	st21nfcb: st21nfcb@8 {
-
-		compatible =3D "st,st21nfcb-i2c";
-
-		reg =3D <0x08>;
-		clock-frequency =3D <400000>;
-
-		interrupt-parent =3D <&gpio5>;
-		interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
-
-		reset-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
-	};
-};
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
