From: Huang Shijie <shijie.huang@arm.com>
Subject: [PATCH] arm64: dts: juno: replace the hardcode with the proper macros
Date: Tue,  1 Sep 2015 09:41:23 +0800
Message-ID: <1441071683-3497-1-git-send-email-shijie.huang@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com
Cc: will.deacon@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Huang Shijie <shijie.huang@arm.com>
List-Id: devicetree@vger.kernel.org

The old code uses hardcode for the memtimer's interrupt property,
this patch replaces the hardcode with the proper macros.

Signed-off-by: Huang Shijie <shijie.huang@arm.com>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/a=
rm/juno-base.dtsi
index e3ee960..ad0221a 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -12,7 +12,7 @@
 =09=09status =3D "disabled";
 =09=09frame@2a830000 {
 =09=09=09frame-number =3D <1>;
-=09=09=09interrupts =3D <0 60 4>;
+=09=09=09interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 =09=09=09reg =3D <0x0 0x2a830000 0x0 0x10000>;
 =09=09};
 =09};
--=20
2.1.4
