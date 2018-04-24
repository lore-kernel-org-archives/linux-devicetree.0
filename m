Return-Path: <SRS0=V8UA=HN=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  2/2] ARM: dts: iwg23s-sbc: Add EtherAVB support
Date: Tue, 24 Apr 2018 16:37:33 +0100
Message-Id: <1524584253-52936-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1524584253-52936-1-git-send-email-biju.das@bp.renesas.com>
References: <1524584253-52936-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Define the iW-RainboW-G23S board dependent part of the
EtherAVB device node.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
---
* currently u-boot sets the AVB pin configuration.

 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index d21baad..e3585da 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -12,11 +12,12 @@
 	compatible = "iwave,g23s", "renesas,r8a77470";
 
 	aliases {
+		ethernet0 = &avb;
 		serial1 = &scif1;
 	};
 
 	chosen {
-		bootargs = "ignore_loglevel";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
 		stdout-path = "serial1:115200n8";
 	};
 
@@ -26,6 +27,18 @@
 	};
 };
 
+&avb {
+	phy-handle = <&phy3>;
+	phy-mode = "gmii";
+	renesas,no-ether-link;
+	status = "okay";
+
+	phy3: ethernet-phy@3 {
+		reg = <3>;
+		micrel,led-mode = <1>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <20000000>;
 };
-- 
2.7.4
