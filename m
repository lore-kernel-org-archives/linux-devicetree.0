From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH 1/4] Documentation: dt-bindings: add dt binding info for Rockchip dwc2
Date: Tue, 29 Jul 2014 18:31:10 -0700
Message-ID: <1406683873-18194-2-git-send-email-kever.yang@rock-chips.com>
References: <963258>
 <1406683873-18194-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406683873-18194-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, paulz@synopsys.com, gregkh@linuxfoundation.org, mporter@linaro.org, kishon@ti.com, balbi@ti.com
Cc: swarren@wwwdotorg.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, kever.yang@rock-chips.com, addy.ke@rock-chips.com, xjq@rock-chips.com, cf@rock-chips.com, lyz@rock-chips.com, wulf@rock-chips.com, dianders@chromium.org, olof@lixom.net, sonnyrao@chromium.org
List-Id: devicetree@vger.kernel.org

This add necessary dwc2 binding documentation for Rockchip socs:
rk3066, rk3188 and rk3288

add dr_mode as optional properties.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---
 Documentation/devicetree/bindings/usb/dwc2.txt |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index aa91034..eb80d7b 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -4,6 +4,9 @@ Platform DesignWare HS OTG USB 2.0 controller
 Required properties:
 - compatible : One of:
   - brcm,bcm2835-usb: The DWC2 USB controller instance in the BCM2835 SoC.
+  - rockchip,rk3066-usb: The DWC2 USB controller instance in the rk3066 Soc;
+  - "rockchip,rk3188-usb","rockchip,rk3066-usb": for rk3188 Soc;
+  - "rockchip,rk3288-usb","rockchip,rk3066-usb": for rk3288 Soc;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
@@ -15,6 +18,8 @@ Optional properties:
 - phys: phy provider specifier
 - phy-names: shall be "usb2-phy"
 Refer to phy/phy-bindings.txt for generic phy consumer properties
+- dr_mode: shall be one of "host", "peripheral" and "otg"
+  Refer to usb/generic.txt
 
 Example:
 
-- 
1.7.9.5
