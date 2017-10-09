From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  2/4] ARM: dts: iwg20d-q7: Enable HS-USB
Date: Mon,  9 Oct 2017 14:21:19 +0100
Message-ID: <1507555281-57845-3-git-send-email-biju.das@bp.renesas.com>
References: <1507555281-57845-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507555281-57845-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Enable HS-USB device for the iWave G20D-Q7 carrier board based on
RZ/G1M.
Also disable the host mode support on usb otg port by default to avoid
pin conflicts.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 1c072c0..e6b50c6 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -58,6 +58,12 @@
 	};
 };
 
+&hsusb {
+	status = "okay";
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -72,7 +78,7 @@
 };
 
 &pci0 {
-	status = "okay";
+	status = "disabled";
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
 };
-- 
1.9.1
