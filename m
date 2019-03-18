From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH] dt-bindings: cpu: Fix JSON schema
Date: Mon, 18 Mar 2019 11:05:21 +0100
Message-ID: <20190318100521.29109-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Sugaya Taichi <sugaya.taichi@socionext.com>, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

Commit fd73403a4862 ("dt-bindings: arm: Add SMP enable-method for
Milbeaut") added support for a new cpu enable-method, but did so using
tabulations to ident. This is however invalid in the syntax, and resulted
in a failure when trying to use that schemas for validation.

Use spaces instead of tabs to indent to fix this.

Fixes: fd73403a4862 ("dt-bindings: arm: Add SMP enable-method for Milbeaut")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
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
