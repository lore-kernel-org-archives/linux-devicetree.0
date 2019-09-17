From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] dt-bindings: arm: rockchip: fix Theobroma-System board bindings
Date: Tue, 17 Sep 2019 10:34:53 +0200
Message-ID: <20190917083453.25744-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, christoph.muellner@theobroma-systems.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

The naming convention for the existing Theobroma boards is
soc-q7module-baseboard, so rk3399-puma-haikou and the in-kernel
devicetrees also follow that scheme.

For some reason in the binding a wrong or outdated naming slipped
in which does not match the used devicetrees and makes the dt-schema
complain now.

Fix this by using the names used in the wild by actual boards.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 7ecee58842f5..d85983de7919 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -501,12 +501,12 @@ properties:
 
       - description: Theobroma Systems RK3368-uQ7 with Haikou baseboard
         items:
-          - const: tsd,rk3368-uq7-haikou
+          - const: tsd,rk3368-lion-haikou
           - const: rockchip,rk3368
 
       - description: Theobroma Systems RK3399-Q7 with Haikou baseboard
         items:
-          - const: tsd,rk3399-q7-haikou
+          - const: tsd,rk3399-puma-haikou
           - const: rockchip,rk3399
 
       - description: Tronsmart Orion R68 Meta
-- 
2.20.1
