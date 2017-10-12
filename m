From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: salvator-common: add dr_mode property for USB2.0 channel 0
Date: Thu, 12 Oct 2017 18:23:30 +0900
Message-ID: <1507800210-13403-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Since Salvator-X[S] have a USB2.0 dual-role channel (CN9), this patch
adds dr_mode property for USB2.0 channel 0 (EHCI/OHCI and HS-USB)
as "otg".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch based on the renesas.git / renesas-devel-20171011-v4.14-rc4 tag.

 Using dual-role channel (or not) is related to the type of USB receptor on
 board specification. So, I added the property into the salvator-common.dtsi.

 This property will be used by phy-rcar-gen3-usb2 driver in the future [1].
 However, adding this property without the [1] patch will not cause any
 side-effects.

 [1] : https://patchwork.kernel.org/patch/10001113/


 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 3dcb26b..9bd409b 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -282,6 +282,7 @@
 };
 
 &ehci0 {
+	dr_mode = "otg";
 	status = "okay";
 };
 
@@ -294,6 +295,7 @@
 };
 
 &hsusb {
+	dr_mode = "otg";
 	status = "okay";
 };
 
@@ -356,6 +358,7 @@
 };
 
 &ohci0 {
+	dr_mode = "otg";
 	status = "okay";
 };
 
-- 
1.9.1
