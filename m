Return-Path: <SRS0=k+DT=RJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 9/9] arm64: dts: renesas: r8a774c0-cat874: Enable extcon support
Date: Wed,  6 Mar 2019 09:07:26 +0000
Message-Id: <1551863246-11656-10-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch enables extcon framework support to receive connect and
disconnect notification.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 2a4631d..1a78254 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -84,7 +84,7 @@
 	status = "okay";
 	clock-frequency = <100000>;
 
-	hd3ss3220@47 {
+	hd3ss3220: hd3ss3220@47 {
 		compatible = "ti,hd3ss3220";
 		reg = <0x47>;
 		interrupt-parent = <&gpio6>;
@@ -166,6 +166,7 @@
 
 &usb3_peri0 {
 	companion = <&xhci0>;
+	extcon = <&hd3ss3220>;
 
 	status = "okay";
 };
-- 
2.7.4
