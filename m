From: Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v4 3/4] Documentation: devicetree: rockchip: Document rk3399-evb
Date: Wed, 27 Apr 2016 15:54:52 +0800
Message-ID: <1461743693-10671-4-git-send-email-jay.xu@rock-chips.com>
References: <1461743693-10671-1-git-send-email-jay.xu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461743693-10671-1-git-send-email-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lintao@rock-chips.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, heiko@sntech.de, huangtao@rock-chips.com, davidriley@chromium.org, dianders@chromium.org, jwerner@chromium.org, smbarber@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Use "rockchip,rk3399-evb" compatible string for Rockchip RK3399
evaluation board.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
changes in v4:
- none

changes in v3:
- modify title (Rob)

 Documentation/devicetree/bindings/arm/rockchip.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Documentation/devicetree/bindings/arm/rockchip.txt
index 2549519..6491b56 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.txt
+++ b/Documentation/devicetree/bindings/arm/rockchip.txt
@@ -101,4 +101,8 @@ Rockchip platforms device tree bindings
 
 - Rockchip RK3228 Evaluation board:
     Required root node properties:
-      - compatible = "rockchip,rk3228-evb", "rockchip,rk3228";
+     - compatible = "rockchip,rk3228-evb", "rockchip,rk3228";
+
+- Rockchip RK3399 evb:
+    Required root node properties:
+      - compatible = "rockchip,rk3399-evb", "rockchip,rk3399";
-- 
1.9.1
