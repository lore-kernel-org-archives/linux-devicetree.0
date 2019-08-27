From: Gerald BAEZA <gerald.baeza@st.com>
Subject: [PATCH v3 2/5] dt-bindings: perf: stm32: ddrperfm support
Date: Tue, 27 Aug 2019 15:08:19 +0000
Message-ID: <1566918464-23927-3-git-send-email-gerald.baeza@st.com>
References: <1566918464-23927-1-git-send-email-gerald.baeza@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566918464-23927-1-git-send-email-gerald.baeza@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Cc: Gerald BAEZA <gerald.baeza@st.com>
List-Id: devicetree@vger.kernel.org

The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.

This documentation indicates how to enable stm32-ddr-pmu driver on
DDRPERFM peripheral, via the device tree.

Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
---
 Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt | 16 ++++++++++++=
++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/stm32-ddr-pmu.tx=
t

diff --git a/Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt b/Doc=
umentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
new file mode 100644
index 0000000..87ab12e
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
@@ -0,0 +1,16 @@
+* STM32 DDR Performance Monitor (DDRPERFM)
+
+Required properties:
+- compatible: must be "st,stm32-ddr-pmu".
+- reg: physical address and length of the registers set.
+- clocks: phandle and specifier for DDRPERFM input clock
+- resets: phandle and specifier for DDRPERFM reset
+
+Example:
+	ddrperfm: perf@5a007000 {
+		compatible =3D "st,stm32-ddr-pmu";
+		reg =3D <0x5a007000 0x400>;
+		clocks =3D <&rcc DDRPERFM>;
+		resets =3D <&rcc DDRPERFM_R>;
+	};
+
--=20
2.7.4
