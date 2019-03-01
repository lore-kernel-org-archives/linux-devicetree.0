Return-Path: <SRS0=f0E1=RE=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r8a77995: draak: Remove hsusb node
Date: Fri,  1 Mar 2019 11:05:48 +0000
Message-Id: <1551438348-22119-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Patch "usb: common: Consider only available nodes for dr_mode"
fixes the way the DT gets parsed to identify the USB controller
driving the PHY, as such we don't need hsusb to specify dr_mode,
in fact we don't need to enable the hsusb node at all since
the USB interface on the board works as USB host only.

Fixes: 5c6479d9b25b ("arm64: dts: renesas: r8a7799{0|5}: add/enable USB2.0 peripheral")
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
index db2bed1..5f13b8b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
@@ -207,11 +207,6 @@
 	clock-frequency = <48000000>;
 };
 
-&hsusb {
-	dr_mode = "host";
-	status = "okay";
-};
-
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
