From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] dt-bindings: arm: fix YAML whitespace in cpus.yaml
Date: Fri,  5 Apr 2019 23:25:39 -0700
Message-ID: <20190406062538.31325-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Paul Walmsley <paul@pwsan.com>, Sugaya Taichi <sugaya.taichi@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Running 'make dt_binding_check' fails for
Documentation/devicetree/bindings/arm/cpus.yaml.  This is due to tabs
used for indentation:

$ dt-doc-validate Documentation/devicetree/bindings/arm/cpus.yaml
Documentation/devicetree/bindings/arm/cpus.yaml:  while scanning a plain scalar
  in "<unicode string>", line 230, column 19
found a tab character that violates indentation
  in "<unicode string>", line 231, column 1
$

Fixes: fd73403a4862842e89d7d2063cfe9e25bbe9c991 ("dt-bindings: arm: Add SMP enable-method for Milbeaut")
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Sugaya Taichi <sugaya.taichi@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 365dcf384d73..82dd7582e945 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -228,7 +228,7 @@ patternProperties:
                 - renesas,r9a06g032-smp
                 - rockchip,rk3036-smp
                 - rockchip,rk3066-smp
-		- socionext,milbeaut-m10v-smp
+                - socionext,milbeaut-m10v-smp
                 - ste,dbx500-smp
 
       cpu-release-addr:
-- 
2.20.1
