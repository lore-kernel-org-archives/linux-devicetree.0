From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: ulcb: drop "avb_phy_int" from avb_pins
Date: Tue,  3 Oct 2017 13:57:12 +0900
Message-ID: <1507006633-28258-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1507006633-28258-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507006633-28258-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Since the Ethernet AVB driver doesn't support AVB_PHY_INT handling
and it will be handled by a phy driver as a gpio pin, this patch
removes the "avb_phy_int" from the avb_pins node.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: 133ace3f3804 ("arm64: dts: ulcb: Set drive-strength for ravb pins")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index dfec907..1a5f15a 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -254,8 +254,7 @@
 
 	avb_pins: avb {
 		mux {
-			groups = "avb_link", "avb_phy_int", "avb_mdc",
-				 "avb_mii";
+			groups = "avb_link", "avb_mdc", "avb_mii";
 			function = "avb";
 		};
 
-- 
1.9.1
