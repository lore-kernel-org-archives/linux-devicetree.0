From: Kever Yang <kever.yang@gmail.com>
Subject: [PATCH v2 3/4] ARM: dts: add rk3288 dwc2 controller support
Date: Wed, 30 Jul 2014 21:29:58 -0700
Message-ID: <1406780999-17798-4-git-send-email-kever.yang@rock-chips.com>
References: <1406780999-17798-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406780999-17798-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Zimmerman <paulz@synopsys.com>
Cc: dianders@chromium.org, heiko@sntech.de, olof@lixom.net, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, wulf@rock-chips.com, lyz@rock-chips.com, hj@rock-chips.com, huangtao@rock-chips.com, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

rk3288 has two kind of usb controller, this add the dwc2 controller
for otg and host1.

Controller can works with usb PHY default setting and Vbus on.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2:
- change the node name from 'dwc2' to 'usb'

 arch/arm/boot/dts/rk3288.dtsi |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index abc51f5..9555857 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -646,5 +646,25 @@
 			clock-names = "baudclk", "apb_pclk";
 			status = "disabled";
 		};
+
+		usb_otg: usb@ff580000 {
+			compatible = "rockchip,rk3288-usb", "rockchip,rk3066-usb",
+					"snps,dwc2";
+			reg = <0xff580000 0x40000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru HCLK_OTG0>;
+			clock-names = "otg";
+			status = "disabled";
+		};
+
+		usb_host1: usb@ff540000 {
+			compatible = "rockchip,rk3288-usb", "rockchip,rk3066-usb",
+					"snps,dwc2";
+			reg = <0xff540000 0x40000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru HCLK_USBHOST1>;
+			clock-names = "otg";
+			status = "disabled";
+		};
 	};
 };
-- 
1.7.9.5
