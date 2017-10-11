From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2] ARM: dts: iwg20d-q7: Enable HS-USB
Date: Wed, 11 Oct 2017 10:04:33 +0100
Message-ID: <1507712673-57370-1-git-send-email-biju.das@bp.renesas.com>
References: <20171010073057.GK2518@verge.net.au>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171010073057.GK2518@verge.net.au>
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
v1-->v2 
    * Dropped "status" property,to disable host mode support on USB otg 
      port by default.

This patch has been tested against renesas-dev tag 20171011-v4.14-rc4.

 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 1c072c0..efd8af9 100644
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
@@ -72,7 +78,6 @@
 };
 
 &pci0 {
-	status = "okay";
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
 };
-- 
1.9.1
