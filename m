From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH] dt-bindings: arm: correct dt_binding_check parse error
Date: Sat, 30 Mar 2019 22:42:40 -0400
Message-ID: <20190331024240.3012-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, sugaya.taichi@socionext.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

'make dt_binding_check' fails with the following error:

  Documentation/devicetree/bindings/arm/cpus.yaml:  while scanning a
  plain scalar
    in "<unicode string>", line 231, column 19
  found a tab character that violates indentation
    in "<unicode string>", line 232, column 1
  make[1]: *** [Documentation/devicetree/bindings/Makefile:12:
    Documentation/devicetree/bindings/arm/cpus.example.dts] Error 1

Correct the parse error by replacing the tabs with spaces to keep
'make dt_binding_check' happy.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Fixes: fd73403a4862 ("dt-bindings: arm: Add SMP enable-method for Milbeaut")
---
Issue is in linux-next-20190329.

 Documentation/devicetree/bindings/arm/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 60eab6dc3c0b..591bbd012d63 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -229,7 +229,7 @@ patternProperties:
                 - renesas,r9a06g032-smp
                 - rockchip,rk3036-smp
                 - rockchip,rk3066-smp
-		- socionext,milbeaut-m10v-smp
+                - socionext,milbeaut-m10v-smp
                 - ste,dbx500-smp
 
       cpu-release-addr:
-- 
2.20.1
