From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/5] arm64: dts: renesas: r8a7795: Add usb companion property in EHCI
Date: Wed, 26 Jul 2017 20:29:36 +0900
Message-ID: <1501068580-3981-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501068580-3981-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

This patch adds the "companion" property in the EHCI ch0, ch1 and
ch2 nodes to wait for the usb companion controller startup at resume.

Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[remove ch3 node and revise the commit log]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 95af1e1..b8ffbc6 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1584,6 +1584,7 @@
 			clocks = <&cpg CPG_MOD 703>;
 			phys = <&usb2_phy0>;
 			phy-names = "usb";
+			companion= <&ohci0>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 703>;
 			status = "disabled";
@@ -1596,6 +1597,7 @@
 			clocks = <&cpg CPG_MOD 702>;
 			phys = <&usb2_phy1>;
 			phy-names = "usb";
+			companion= <&ohci1>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
 			status = "disabled";
@@ -1608,6 +1610,7 @@
 			clocks = <&cpg CPG_MOD 701>;
 			phys = <&usb2_phy2>;
 			phy-names = "usb";
+			companion= <&ohci2>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 701>;
 			status = "disabled";
-- 
1.9.1
