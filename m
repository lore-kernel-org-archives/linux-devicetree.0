From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 07/10] tpm/tpm_i2c_stm_st33/dts/st33zp24-i2c: Rename st33zp24 dts documentation
Date: Sat, 10 Jan 2015 12:20:28 +0100
Message-ID: <1420888831-17491-8-git-send-email-christophe-h.ricard@st.com>
References: <1420888831-17491-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420888831-17491-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PeterHuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

st33zp24 exists in i2c and spi version. Both have different possible
configuration.
st33zp24.txt is renamed st33zp24-i2c.txt.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 .../bindings/security/tpm/st33zp24-i2c.txt         | 36 ++++++++++++++=
++++++++
 .../devicetree/bindings/security/tpm/st33zp24.txt  | 36 --------------=
--------
 2 files changed, 36 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/st33=
zp24-i2c.txt
 delete mode 100644 Documentation/devicetree/bindings/security/tpm/st33=
zp24.txt

diff --git a/Documentation/devicetree/bindings/security/tpm/st33zp24-i2=
c.txt b/Documentation/devicetree/bindings/security/tpm/st33zp24-i2c.txt
new file mode 100644
index 0000000..3ad115e
--- /dev/null
+++ b/Documentation/devicetree/bindings/security/tpm/st33zp24-i2c.txt
@@ -0,0 +1,36 @@
+* STMicroelectronics SAS. ST33ZP24 TPM SoC
+
+Required properties:
+- compatible: Should be "st,st33zp24-i2c".
+- clock-frequency: I=C2=B2C work frequency.
+- reg: address on the bus
+
+Optional ST33ZP24 Properties:
+- interrupt-parent: phandle for the interrupt gpio controller
+- interrupts: GPIO interrupt to which the chip is connected
+- lpcpd-gpios: Output GPIO pin used for ST33ZP24 power management D1/D=
2 state.
+If set, power must be present when the platform is going into sleep/hi=
bernate mode.
+
+Optional SoC Specific Properties:
+- pinctrl-names: Contains only one value - "default".
+- pintctrl-0: Specifies the pin control groups used for this controlle=
r.
+
+Example (for ARM-based BeagleBoard xM with ST33ZP24 on I2C2):
+
+&i2c2 {
+
+        status =3D "okay";
+
+        st33zp24: st33zp24@13 {
+
+                compatible =3D "st,st33zp24-i2c";
+
+                reg =3D <0x13>;
+                clock-frequency =3D <400000>;
+
+                interrupt-parent =3D <&gpio5>;
+                interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
+
+                lpcpd-gpios =3D <&gpio5 15 GPIO_ACTIVE_HIGH>;
+        };
+};
diff --git a/Documentation/devicetree/bindings/security/tpm/st33zp24.tx=
t b/Documentation/devicetree/bindings/security/tpm/st33zp24.txt
deleted file mode 100644
index 0a7361d..0000000
--- a/Documentation/devicetree/bindings/security/tpm/st33zp24.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-* STMicroelectronics SAS. ST33ZP24 TPM SoC
-
-Required properties:
-- compatible: Should be "st,st33zp24-i2c".
-- clock-frequency: I=C2=B2C work frequency.
-- reg: address on the bus
-
-Optional ST33ZP24 Properties:
-- interrupt-parent: phandle for the interrupt gpio controller
-- interrupts: GPIO interrupt to which the chip is connected
-- lpcpd-gpios: Output GPIO pin used for ST33ZP24 power management D1/D=
2 state.
-If set, power must be present when the platform is going into sleep/hi=
bernate mode.
-
-Optional SoC Specific Properties:
-- pinctrl-names: Contains only one value - "default".
-- pintctrl-0: Specifies the pin control groups used for this controlle=
r.
-
-Example (for ARM-based BeagleBoard xM with ST33ZP24 on I2C2):
-
-&i2c2 {
-
-        status =3D "okay";
-
-        st33zp24: st33zp24@13 {
-
-                compatible =3D "st,st33zp24-i2c";
-
-                reg =3D <0x013>;
-                clock-frequency =3D <400000>;
-
-                interrupt-parent =3D <&gpio5>;
-                interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
-
-                lpcpd-gpios =3D <&gpio5 15 GPIO_ACTIVE_HIGH>;
-        };
-};
--=20
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
