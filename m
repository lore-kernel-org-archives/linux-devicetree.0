Return-Path: <SRS0=f0E1=RE=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 3/4] arm64: dts: renesas: r8a774c0-cat874: Add USB-HOST support
Date: Fri,  1 Mar 2019 11:05:47 +0000
Message-Id: <1551438348-22119-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, ebiharaml@si-linux.co.jp
List-ID: <devicetree@vger.kernel.org>

This patch adds USB 2.0 HOST support to the CAT874 board.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index f86b3628..7d3b76f 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -76,10 +76,20 @@
 	};
 };
 
+&ehci0 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <48000000>;
 };
 
+&ohci0 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
 };
@@ -128,3 +138,8 @@
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&usb2_phy0 {
+	renesas,no-otg-pins;
+	status = "okay";
+};
-- 
2.7.4
