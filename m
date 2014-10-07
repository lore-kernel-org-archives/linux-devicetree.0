From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/16] tpm: dts: st33zp24_i2c: Add DTS Documentation
Date: Tue,  7 Oct 2014 21:44:53 +0200
Message-ID: <1412711101-988-9-git-send-email-christophe-h.ricard@st.com>
References: <1412711101-988-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412711101-988-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

st33zp24 tpm can be seen as a trivial i2c device as other i2c tpm.
However several other properties needs to be documented such as lpcpd.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/security/tpm/st33zp24.txt  | 35 ++++++++++++++=
++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/st33=
zp24.txt

diff --git a/Documentation/devicetree/bindings/security/tpm/st33zp24.tx=
t b/Documentation/devicetree/bindings/security/tpm/st33zp24.txt
new file mode 100644
index 0000000..75302c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/security/tpm/st33zp24.txt
@@ -0,0 +1,35 @@
+* STMicroelectronics SAS. ST33ZP24 TPM SoC
+
+Required properties:
+- compatible: Should be "st,st33zp24_i2c".
+- clock-frequency: I=C2=B2C work frequency.
+- reg: address on the bus
+
+Option ST33ZP24 Properties:
+- interrupt-parent: phandle for the interrupt gpio controller
+- interrupts: GPIO interrupt to which the chip is connected
+- lpcpd-gpios: Output GPIO pin used for enabling/disabling the ST33ZP2=
4
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
+        st33zp24: st33zp24@1 {
+
+                compatible =3D "st,st33zp24_i2c";
+
+                reg =3D <0x01>;
+                clock-frequency =3D <400000>;
+
+                interrupt-parent =3D <&gpio5>;
+                interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
+
+                lpcpd-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
+        };
+};
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
