From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: [PATCH AUTOSEL 4.18 129/131] MIPS: mscc: ocelot: fix length of memory
 address space for MIIM
Date: Sun, 2 Sep 2018 13:05:45 +0000
Message-ID: <20180902064601.183036-129-alexander.levin@microsoft.com>
References: <20180902064601.183036-1-alexander.levin@microsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902064601.183036-1-alexander.levin@microsoft.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Quentin Schulz <quentin.schulz@bootlin.com>, Paul Burton <paul.burton@mips.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "jhogan@kernel.org" <jhogan@kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, Sasha Levin <Alexander.Levin@microsoft.com>
List-Id: devicetree@vger.kernel.org

From: Quentin Schulz <quentin.schulz@bootlin.com>

[ Upstream commit 49e5bb13adc11fe6e2e40f65c04f3a461aea1fec ]

The length of memory address space for MIIM0 is from 0x7107009c to
0x710700bf included which is 36 bytes long in decimal, or 0x24 bytes in
hexadecimal and not 0x36.

Fixes: 49b031690abe ("MIPS: mscc: Add switch to ocelot")

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Paul Burton <paul.burton@mips.com>
Patchwork: https://patchwork.linux-mips.org/patch/20013/
Cc: robh+dt@kernel.org
Cc: mark.rutland@arm.com
Cc: ralf@linux-mips.org
Cc: jhogan@kernel.org
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: thomas.petazzoni@bootlin.com
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 arch/mips/boot/dts/mscc/ocelot.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/=
ocelot.dtsi
index 4f33dbc67348..7096915f26e0 100644
--- a/arch/mips/boot/dts/mscc/ocelot.dtsi
+++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
@@ -184,7 +184,7 @@
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			compatible =3D "mscc,ocelot-miim";
-			reg =3D <0x107009c 0x36>, <0x10700f0 0x8>;
+			reg =3D <0x107009c 0x24>, <0x10700f0 0x8>;
 			interrupts =3D <14>;
 			status =3D "disabled";
=20
--=20
2.17.1
