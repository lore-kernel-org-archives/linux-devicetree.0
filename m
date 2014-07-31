From: Kever Yang <kever.yang@gmail.com>
Subject: [PATCH v2 1/4] Documentation: dt-bindings: add dt binding info for Rockchip dwc2
Date: Wed, 30 Jul 2014 21:29:56 -0700
Message-ID: <1406780999-17798-2-git-send-email-kever.yang@rock-chips.com>
References: <1406780999-17798-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406780999-17798-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Zimmerman <paulz@synopsys.com>
Cc: dianders@chromium.org, heiko@sntech.de, olof@lixom.net, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, wulf@rock-chips.com, lyz@rock-chips.com, hj@rock-chips.com, huangtao@rock-chips.com, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Porter <mporter@linaro.org>, Paul Zimmerman <Paul.Zimmerman@synopsys.com>, Kishon Vijay Abraham I <kishon@ti.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This add necessary dwc2 binding documentation for Rockchip socs:
rk3066, rk3188 and rk3288

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2:
- Split out dr_mode and rk3288 bindings.
- add compatible "snps,dwc2" bingding info

 Documentation/devicetree/bindings/usb/dwc2.txt |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 801a284..6a87b27 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -4,6 +4,9 @@ Platform DesignWare HS OTG USB 2.0 controller
 Required properties:
 - compatible : One of:
   - brcm,bcm2835-usb: The DWC2 USB controller instance in the BCM2835 SoC.
+  - rockchip,rk3066-usb: The DWC2 USB controller instance in the rk3066 Soc;
+  - "rockchip,rk3188-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3188 Soc;
+  - "rockchip,rk3288-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3288 Soc;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
-- 
1.7.9.5
