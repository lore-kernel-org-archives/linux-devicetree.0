From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/4] dt-bindings: arm: rockchip: Add binding for Rock960 board
Date: Mon, 10 Sep 2018 20:43:54 +0530
Message-ID: <20180910151356.25946-3-manivannan.sadhasivam@linaro.org>
References: <20180910151356.25946-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180910151356.25946-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, robh+dt@kernel.org
Cc: vicencb@gmail.com, shawn.lin@rock-chips.com, ezequiel@collabora.com, enric.balletbo@collabora.com, pbrobinson@gmail.com, tom@vamrs.com, dev@vamrs.com, stephen@vamrs.com, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for Rock960 board from Vamrs Limited.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/rockchip.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Documentation/devicetree/bindings/arm/rockchip.txt
index acfd3c773dd0..aaad9e2ff9a3 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.txt
+++ b/Documentation/devicetree/bindings/arm/rockchip.txt
@@ -5,6 +5,10 @@ Rockchip platforms device tree bindings
     Required root node properties:
       - compatible = "vamrs,ficus", "rockchip,rk3399";
 
+- 96boards RK3399 Rock960 (ROCK960 Consumer Edition)
+    Required root node properties:
+      - compatible = "vamrs,rk3399-rock960", "rockchip,rk3399";
+
 - Amarula Vyasa RK3288 board
     Required root node properties:
       - compatible = "amarula,vyasa-rk3288", "rockchip,rk3288";
-- 
2.17.1
