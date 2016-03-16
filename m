From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 1/8] arm64: dts: rockchip: Clean up /memory nodes
Date: Wed, 16 Mar 2016 14:58:39 +0100
Message-ID: <1458136727-32075-2-git-send-email-afaerber@suse.de>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458136727-32075-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

A dtc update results in warnings for nodes with reg property but withou=
t
unit address in the node name, so rename /memory to /memory@0.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v4: New - complements GeekBox patch 4/8
=20
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi | 2 +-
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3368-evb.dtsi
index 06bbe421db37..e4c91e86e9b6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi
@@ -48,7 +48,7 @@
 		stdout-path =3D "serial2:115200n8";
 	};
=20
-	memory {
+	memory@0 {
 		device_type =3D "memory";
 		reg =3D <0x0 0x0 0x0 0x40000000>;
 	};
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts b/arch/arm64/b=
oot/dts/rockchip/rk3368-r88.dts
index a1d1aa9c16fe..5c63f8982128 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
@@ -51,7 +51,7 @@
 		stdout-path =3D "serial2:115200n8";
 	};
=20
-	memory {
+	memory@0 {
 		device_type =3D "memory";
 		reg =3D <0x0 0x0 0x0 0x40000000>;
 	};
--=20
2.6.2
