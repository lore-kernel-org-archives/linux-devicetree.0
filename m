From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 1/6] ARM: dts: mmp2: trivial whitespace fix
Date: Wed, 28 Aug 2019 09:26:24 +0200
Message-ID: <20190828072629.285760-2-lkundrak@v3.sk>
References: <20190828072629.285760-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828072629.285760-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

A missing space before a curly brace.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 arch/arm/boot/dts/mmp2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index b6f40743e07b0..50b6c38b39cc3 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -379,7 +379,7 @@
 			};
 		};
=20
-		soc_clocks: clocks{
+		soc_clocks: clocks {
 			compatible =3D "marvell,mmp2-clock";
 			reg =3D <0xd4050000 0x1000>,
 			      <0xd4282800 0x400>,
--=20
2.21.0
