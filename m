Return-Path: <SRS0=Ks1j=SF=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH V3 13/13] ARM: dts: iwg23s-sbc: Enable HS-USB
Date: Wed,  3 Apr 2019 11:28:44 +0100
Message-Id: <1554287324-22312-14-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Enable HS-USB device for the iWave SBC based on RZ/G1C.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V2-->V3
 * No change
V1-->V2
 * New patch
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 366832c..2840eb0 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -123,6 +123,10 @@
 	};
 };
 
+&hsusb0 {
+	status = "okay";
+};
+
 &i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
