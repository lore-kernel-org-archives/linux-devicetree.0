From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 2/6] dt-bindings: phy-rockchip-typec: move extcon property to be optional.
Date: Thu,  1 Mar 2018 10:24:16 +0100
Message-ID: <20180301092420.1191-3-enric.balletbo@collabora.com>
References: <20180301092420.1191-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180301092420.1191-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, heiko@sntech.de
Cc: groeck@chromium.org, gwendal@chromium.org, kernel@collabora.com, vicencb@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The extcon property is used to detect the cable-state but some boards,
like Sapphire, currently does not seem to support, others might just not
need, as are supposed to work in host-mode only. So, extcon property is
not really a required property, move to be optional instead.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
index 6ea867e3176f..a66f23a01129 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
@@ -14,6 +14,8 @@ Required properties:
  - resets : a list of phandle + reset specifier pairs
  - reset-names : string reset name, must be:
 		 "uphy", "uphy-pipe", "uphy-tcphy"
+
+Optional properties:
  - extcon : extcon specifier for the Power Delivery
 
 Note, there are 2 type-c phys for RK3399, and they are almost identical, except
-- 
2.16.1
