From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 1/2] dt-bindings: regulator: Add stm32mp1 pwr regulators
Date: Mon, 8 Apr 2019 15:24:07 +0000
Message-ID: <1554737044-9460-2-git-send-email-p.paillet@st.com>
References: <1554737044-9460-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554737044-9460-1-git-send-email-p.paillet@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

Document devicetree bindings for stm32mp1 pwr regulators.

Signed-off-by: Pascal Paillet <p.paillet@st.com>
---
 .../bindings/regulator/st,stm32mp1-pwr-reg.txt     | 43 ++++++++++++++++++=
++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32mp1=
-pwr-reg.txt

diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-re=
g.txt b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
new file mode 100644
index 0000000..e372dd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
@@ -0,0 +1,43 @@
+STM32MP1 PWR Regulators
+-----------------------
+
+Available Regulators in STM32MP1 PWR block are:
+  - reg11 for regulator 1V1
+  - reg18 for regulator 1V8
+  - usb33 for the swtich USB3V3
+
+Required properties:
+- compatible: Must be "st,stm32mp1,pwr-reg"
+- list of child nodes that specify the regulator reg11, reg18 or usb33
+  initialization data for defined regulators. The definition for each of
+  these nodes is defined using the standard binding for regulators found a=
t
+  Documentation/devicetree/bindings/regulator/regulator.txt.
+- vdd-supply: phandle to the parent supply/regulator node for vdd input
+- vdd_3v3_usbfs-supply: phandle to the parent supply/regulator node for us=
b33
+
+Example:
+
+pwr_regulators: pwr@50001000 {
+	compatible =3D "st,stm32mp1,pwr-reg";
+	reg =3D <0x50001000 0x10>;
+	vdd-supply =3D <&vdd>;
+	vdd_3v3_usbfs-supply =3D <&vdd_usb>;
+
+	reg11: reg11 {
+		regulator-name =3D "reg11";
+		regulator-min-microvolt =3D <1100000>;
+		regulator-max-microvolt =3D <1100000>;
+	};
+
+	reg18: reg18 {
+		regulator-name =3D "reg18";
+		regulator-min-microvolt =3D <1800000>;
+		regulator-max-microvolt =3D <1800000>;
+	};
+
+	usb33: usb33 {
+		regulator-name =3D "usb33";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+	};
+};
--=20
1.9.1
