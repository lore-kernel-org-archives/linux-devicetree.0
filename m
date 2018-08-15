From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 4/4] dt-bindings: phy-rockchip-inno-usb2: add new rockchip,force-bvalid property.
Date: Wed, 15 Aug 2018 11:59:34 +0200
Message-ID: <20180815095934.11205-5-enric.balletbo@collabora.com>
References: <20180815095934.11205-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180815095934.11205-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: amstan@chromium.org, groeck@google.com, kieran.bingham@ideasonboard.com, kernel@collabora.com, bleung@chromium.org, heiko@sntech.de, devicetree@vger.kernel.org, Frank Wang <frank.wang@rock-chips.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This property is used when the otg-id pin is not connected. When this
property is set it forces to set the B-Device Session Valid bit when the
port works as device and clears that bit when the port works as host.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 .../devicetree/bindings/phy/phy-rockchip-inno-usb2.txt       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
index 2d4808d3920b..55761f466c41 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
@@ -48,6 +48,11 @@ Optional properties:
 		See ./phy-bindings.txt for details.
  - rockchip,utmi-avalid : boolean, use the avalid register to get vbus status.
 			  Otherwise, use the bvalid register.
+ - rockchip,force-bvalid : boolean, set this to force the B-Device Session
+			  Valid bit when the usb port is in device mode. This
+			  is used when the otg-id pin is not connected.
+			  Only supported in case of compatible being:
+			  * "rockchip,rk3399-usb2phy"
 
 Example:
 
-- 
2.18.0
