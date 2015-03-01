From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 1/2] dt-bindings: add root compatible property for PopMetal board
Date: Sun,  1 Mar 2015 17:28:24 +0800
Message-ID: <1425202104-4752-1-git-send-email-andy.yan@rock-chips.com>
References: <1425201914-4695-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425201914-4695-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, devicetree@vger.kernel.org
Cc: naobsd@gmail.com, romain.perier@gmail.com, b.galvani@gmail.com, galak@codeaurora.org, linux-kernel@vger.kernel.org, ijc+devicetree@hellion.org.uk, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, mark.yao@rock-chips.com, Andy Yan <andy.yan@rock-chips.com>
List-Id: devicetree@vger.kernel.org

PopMetal board is a rk3288 based board made by ChipSpark, this
add root compatible property for it

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- change "PopMetal PopMetal-RK3288 board" to "ChipSPARK PopMetal-RK3288 board"

 Documentation/devicetree/bindings/arm/rockchip.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Documentation/devicetree/bindings/arm/rockchip.txt
index 6809e4e..60d4a1e 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.txt
+++ b/Documentation/devicetree/bindings/arm/rockchip.txt
@@ -22,3 +22,7 @@ Rockchip platforms device tree bindings
       - compatible = "firefly,firefly-rk3288", "rockchip,rk3288";
     or
       - compatible = "firefly,firefly-rk3288-beta", "rockchip,rk3288";
+
+- ChipSPARK PopMetal-RK3288 board:
+    Required root node properties:
+      - compatible = "chipspark,popmetal-rk3288", "rockchip,rk3288";
-- 
1.9.1
