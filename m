From: Gerald BAEZA <gerald.baeza@st.com>
Subject: [PATCH v2 2/5] dt-bindings: perf: stm32: ddrperfm support
Date: Mon, 20 May 2019 15:27:16 +0000
Message-ID: <1558366019-24214-3-git-send-email-gerald.baeza@st.com>
References: <1558366019-24214-1-git-send-email-gerald.baeza@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558366019-24214-1-git-send-email-gerald.baeza@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "will.deacon@arm.com" <will.deacon@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "arnd@arndb.de" <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Gerald BAEZA <gerald.baeza@st.com>
List-Id: devicetree@vger.kernel.org

The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.

This documentation indicates how to enable stm32-ddr-pmu driver on
DDRPERFM peripheral, via the device tree.

Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
---
 .../devicetree/bindings/perf/stm32-ddr-pmu.txt       | 20 ++++++++++++++++=
++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/stm32-ddr-pmu.tx=
t

diff --git a/Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt b/Doc=
umentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
new file mode 100644
index 0000000..9d36209
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
@@ -0,0 +1,20 @@
+* STM32 DDR Performance Monitor (DDRPERFM)
+
+Required properties:
+- compatible: must be "st,stm32-ddr-pmu".
+- reg: physical address and length of the registers set.
+- clocks: list of phandles and specifiers to all input clocks listed in
+	  clock-names property.
+- clock-names: "bus" corresponds to the DDRPERFM bus clock and "ddr" to
+	       the DDR frequency.
+- resets: phandle to the reset controller and DDRPERFM reset specifier
+
+Example:
+	ddrperfm: perf@5a007000 {
+		compatible =3D "st,stm32-ddr-pmu";
+		reg =3D <0x5a007000 0x400>;
+		clocks =3D <&rcc DDRPERFM>, <&rcc PLL2_R>;
+		clock-names =3D "bus", "ddr";
+		resets =3D <&rcc DDRPERFM_R>;
+	};
+
--=20
2.7.4
