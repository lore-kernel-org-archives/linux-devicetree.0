Return-Path: <SRS0=k+DT=RJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 7/9] arm64: dts: renesas: r8a774c0-cat874: enable USB3.0 host/peripheral device node
Date: Wed,  6 Mar 2019 09:07:24 +0000
Message-Id: <1551863246-11656-8-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch enables USB3.0 host/peripheral device node for r8a774c0
cat874 board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch depends on commit 35ed6229c0f0d079f2
("usb: gadget: udc: renesas_usb3: Add bindings for r8a774c0")
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 959919a..73b51e2 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -124,6 +124,11 @@
 		function = "sdhi0";
 		power-source = <1800>;
 	};
+
+	usb30_pins: usb30 {
+		groups = "usb30", "usb30_id";
+		function = "usb30";
+	};
 };
 
 &scif2 {
@@ -146,3 +151,16 @@
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&usb3_peri0 {
+	companion = <&xhci0>;
+
+	status = "okay";
+};
+
+&xhci0 {
+	pinctrl-0 = <&usb30_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.7.4
