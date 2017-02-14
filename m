From: Eddie Cai <eddie.cai.linux@gmail.com>
Subject: [PATCH V3 1/2] dt-bindings: add Asus Tinker board
Date: Tue, 14 Feb 2017 18:07:30 +0800
Message-ID: <1487066851-25142-2-git-send-email-eddie.cai.linux@gmail.com>
References: <1487066851-25142-1-git-send-email-eddie.cai.linux@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487066851-25142-1-git-send-email-eddie.cai.linux@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Eddie Cai <eddie.cai@rock-chips.com>, Eddie Cai <eddie.cai.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Eddie Cai <eddie.cai@rock-chips.com>

Tinker board is a credit card size develop board designed by Asus.
Powered by RK3288.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Documentation/devicetree/bindings/arm/rockchip.txt
index cc4ace6..226ee91 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.txt
+++ b/Documentation/devicetree/bindings/arm/rockchip.txt
@@ -1,5 +1,8 @@
 Rockchip platforms device tree bindings
 ---------------------------------------
+- Asus Tinker board
+    Required root node properties:
+      - compatible = "asus,rk3288-tinker", "rockchip,rk3288";
 
 - Kylin RK3036 board:
     Required root node properties:
-- 
2.7.4
