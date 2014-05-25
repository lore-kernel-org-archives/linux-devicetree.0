From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] NFC: dts: st21nfcb_i2c: Add DTS Documentation
Date: Sun, 25 May 2014 22:35:39 +0200
Message-ID: <1401050140-15050-3-git-send-email-christophe-h.ricard@st.com>
References: <1401050140-15050-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401050140-15050-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Describe the properties used by the st21nfcb NFC controller driver.
---
 .../devicetree/bindings/net/nfc/st21nfcb.txt       | 33 ++++++++++++++=
++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st21nfcb.=
txt

diff --git a/Documentation/devicetree/bindings/net/nfc/st21nfcb.txt b/D=
ocumentation/devicetree/bindings/net/nfc/st21nfcb.txt
new file mode 100644
index 0000000..3b58ae4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/st21nfcb.txt
@@ -0,0 +1,33 @@
+* STMicroelectronics SAS. ST21NFCB NFC Controller
+
+Required properties:
+- compatible: Should be "st,st21nfcb_i2c".
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
+		compatible =3D "st,st21nfcb_i2c";
+
+		reg =3D <0x08>;
+		clock-frequency =3D <400000>;
+
+		interrupt-parent =3D <&gpio5>;
+		interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
+	};
+};
--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
