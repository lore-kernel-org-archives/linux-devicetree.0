From: Yunzhi Li <lyz@rock-chips.com>
Subject: [PATCH v1 3/3] ARM: dts: rockchip: add dwc2 ahb reset property for rk3288
Date: Tue, 11 Aug 2015 15:56:27 +0800
Message-ID: <1439279787-26674-3-git-send-email-lyz@rock-chips.com>
References: <1439279787-26674-1-git-send-email-lyz@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439279787-26674-1-git-send-email-lyz@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jwerner@chromium.org, dianders@chromium.org
Cc: huangtao@rock-chips.com, cf@rock-chips.com, hl@rock-chips.com, wulf@rock-chips.com, gregory.herrero@intel.com, linux-rockchip@lists.infradead.org, Yunzhi Li <lyz@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds dwc2 reset property for rk3288 dwc2 usb
controller to fix FIFO setting bug

Signed-off-by: Yunzhi Li <lyz@rock-chips.com>

---

 arch/arm/boot/dts/rk3288.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 22316d0..440aa42 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -473,6 +473,10 @@
 		dr_mode = "host";
 		phys = <&usbphy2>;
 		phy-names = "usb2-phy";
+		resets = <&cru SRST_USBHOST1_AHB>,
+			 <&cru SRST_USBHOST1_PHY>,
+			 <&cru SRST_USBHOST1_CON>;
+		reset-names = "ahb", "phy", "con";
 		status = "disabled";
 	};
 
@@ -490,6 +494,10 @@
 		g-use-dma;
 		phys = <&usbphy0>;
 		phy-names = "usb2-phy";
+		resets = <&cru SRST_USBOTG_AHB>,
+			 <&cru SRST_USBOTG_PHY>,
+			 <&cru SRST_USBOTG_CON>;
+		reset-names = "ahb", "phy", "con";
 		status = "disabled";
 	};
 
-- 
2.0.0
