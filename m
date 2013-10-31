From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 2/2] ARM: dts: Update Samsung sysreg binding document
Date: Thu, 31 Oct 2013 10:16:54 +0530
Message-ID: <1383194814-18897-2-git-send-email-sachin.kamat@linaro.org>
References: <1383194814-18897-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1383194814-18897-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org
List-Id: devicetree@vger.kernel.org

Added a binding example for reference and updated the
node name.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../devicetree/bindings/arm/samsung/sysreg.txt     |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
index 5039c0a12f55..f165567a9df0 100644
--- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
@@ -1,7 +1,13 @@
 SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
 
 Properties:
- - name : should be 'sysreg';
+ - name : should be 'syscon';
  - compatible : should contain "samsung,<chip name>-sysreg", "syscon";
    For Exynos4 SoC series it should be "samsung,exynos4-sysreg", "syscon";
  - reg : offset and length of the register set.
+
+Example:
+	syscon@10010000 {
+		compatible = "samsung,exynos4-sysreg", "syscon";
+		reg = <0x10010000 0x400>;
+	};
-- 
1.7.9.5
