From: Sugaya Taichi <sugaya.taichi@socionext.com>
Subject: [PATCH v4 02/10] dt-bindings: arm: Add SMP enable-method for Milbeaut
Date: Wed, 27 Feb 2019 13:52:05 +0900
Message-ID: <1551243125-10597-1-git-send-email-sugaya.taichi@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Sugaya Taichi <sugaya.taichi@socionext.com>
List-Id: devicetree@vger.kernel.org

This adds a compatible string "socionext,milbeaut-m10v-smp"
for Milbeaut M10V to the 32 bit ARM CPU device tree binding.

Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 298c17b..365dcf3 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -228,6 +228,7 @@ patternProperties:
                 - renesas,r9a06g032-smp
                 - rockchip,rk3036-smp
                 - rockchip,rk3066-smp
+		- socionext,milbeaut-m10v-smp
                 - ste,dbx500-smp
 
       cpu-release-addr:
-- 
1.9.1
