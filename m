From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 01/10] arm64: dts: renesas: salvator-common: Override EtherAVB phy-mode
Date: Tue, 27 Feb 2018 11:22:45 +0100
Message-ID: <1519726974-23160-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1519726974-23160-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519726974-23160-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: geert@linux-m68k.org, horms@verge.net.au, sergei.shtylyov@cogentembedded.com, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As the PHY interface installed on the Salvator-X[S] board, provides TX
channel delay, make the "phy-mode" property a board-specific one, meant
to override the one specified in the SoC DTSI.

Follow up patches will reset the r8a7795/96/965 SoC DTSI to use "rgmii"
mode and let the board files override that.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 8e8ec30..c725f9b 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -279,6 +279,7 @@
 	pinctrl-0 = <&avb_pins>;
 	pinctrl-names = "default";
 	phy-handle = <&phy0>;
+	phy-mode = "rgmii-txid";
 	status = "okay";
 
 	phy0: ethernet-phy@0 {
-- 
2.7.4
