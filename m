From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: salvator-common: add pfc node for USB3.0 channel 0
Date: Tue,  3 Oct 2017 17:01:12 +0900
Message-ID: <1507017672-21493-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Since a R-Car Gen3 bootloader enables the PFC of USB3.0 channel 0,
the USB3.0 host controller works without this setting on the kernel.
But, this setting should have salvator-common.dtsi. So, this patch
adds the pfc node for USB3.0 channel 0.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the renesas.git / renesas-devel-20171002-v4.14-rc3 tag.

 Since related patches are already merged into renesas-drivers.git / 
 sh-pfc-for-v4.15, this patch is possible to apply for v4.15, I think.

  https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=sh-pfc-for-v4.15&id=3627126ce39d8c7d35a9251b074fedd2edf9f743
  https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=sh-pfc-for-v4.15&id=5ec8a41a36715cf543cb7c109097fb3b4cdfb427
  https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=sh-pfc-for-v4.15&id=656285a892ce3ea9b9397826562789c0de1f5fc0

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index e41e53b..3dcb26b 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -495,6 +495,11 @@
 			bias-pull-down;
 		};
 	};
+
+	usb30_pins: usb30 {
+		groups = "usb30";
+		function = "usb30";
+	};
 };
 
 &pwm1 {
@@ -630,5 +635,8 @@
 };
 
 &xhci0 {
+	pinctrl-0 = <&usb30_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
-- 
1.9.1
