From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 05/10] ARM64: dts: rockchip: Add eMMC to GeekBox
Date: Mon,  8 Feb 2016 03:17:34 +0100
Message-ID: <1454897859-7601-6-git-send-email-afaerber@suse.de>
References: <1454897859-7601-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454897859-7601-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v2: New
=20
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts b/arch/arm=
64/boot/dts/rockchip/rk3368-geekbox.dts
index a8dcf3c2b0c1..e4523a74050f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
@@ -89,6 +89,21 @@
 	};
 };
=20
+&emmc {
+	status =3D "okay";
+	bus-width =3D <8>;
+	cap-mmc-highspeed;
+	clock-frequency =3D <150000000>;
+	disable-wp;
+	keep-power-in-suspend;
+	non-removable;
+	num-slots =3D <1>;
+	vmmc-supply =3D <&vcc_io>;
+	vqmmc-supply =3D <&vcc18_flash>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&emmc_clk>, <&emmc_cmd>, <&emmc_bus8>;
+};
+
 &gmac {
 	status =3D "okay";
 	phy-supply =3D <&vcc_lan>;
--=20
2.6.2
