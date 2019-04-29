From: Gerald BAEZA <gerald.baeza@st.com>
Subject: [PATCH 5/5] ARM: dts: stm32: add ddrperfm on stm32mp157c
Date: Mon, 29 Apr 2019 10:03:39 +0000
Message-ID: <1556532194-27904-6-git-send-email-gerald.baeza@st.com>
References: <1556532194-27904-1-git-send-email-gerald.baeza@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556532194-27904-1-git-send-email-gerald.baeza@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "will.deacon@arm.com" <will.deacon@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "arnd@arndb.de" <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Gerald BAEZA <gerald.baeza@st.com>
List-Id: devicetree@vger.kernel.org

The DDRPERFM is the DDR Performance Monitor embedded
in STM32MP1 SOC.

Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp=
157c.dtsi
index f8bbfff..6883762 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -1155,6 +1155,15 @@
 			};
 		};
=20
+		ddrperfm: perf@5a007000 {
+			compatible =3D "st,stm32-ddr-pmu";
+			reg =3D <0x5a007000 0x400>;
+			clocks =3D <&rcc DDRPERFM>, <&rcc PLL2_R>;
+			clock-names =3D "bus", "ddr";
+			resets =3D <&rcc DDRPERFM_R>;
+			status =3D "okay";
+		};
+
 		usart1: serial@5c000000 {
 			compatible =3D "st,stm32h7-uart";
 			reg =3D <0x5c000000 0x400>;
--=20
2.7.4
