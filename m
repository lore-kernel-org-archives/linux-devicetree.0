From: Fei Wang <w.f@huawei.com>
Subject: [PATCH 6/8] dt-bindings: mtcmos: Document Hi6220 mtcmos driver
Date: Wed, 30 Sep 2015 19:05:09 +0800
Message-ID: <1443611111-3196-7-git-send-email-w.f@huawei.com>
References: <1443611111-3196-1-git-send-email-w.f@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443611111-3196-1-git-send-email-w.f@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, khilman@linaro.org, sameo@linux.intel.com, lee.jones@linaro.org, broonie@kernel.org, lgirdwood@gmail.com
Cc: bintian.wang@huawei.com, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, puck.chen@hisilicon.com, xuyiping@hisilicon.com, kong.kongxinwei@hisilicon.com, z.liuxinliang@hisilicon.com, william.wfei@gmail.com, zhongkaihua@huawei.com, w.f@huawei.com
List-Id: devicetree@vger.kernel.org

Document the new compatible for Hisilicon Hi6220 mtcmos driver.

Signed-off-by: Fei Wang <w.f@huawei.com>
---
 .../bindings/regulator/hisilicon,hi6220-mtcmos.txt |   32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/hisilicon,hi6220-mtcmos.txt

diff --git a/Documentation/devicetree/bindings/regulator/hisilicon,hi6220-mtcmos.txt b/Documentation/devicetree/bindings/regulator/hisilicon,hi6220-mtcmos.txt
new file mode 100644
index 0000000..748ac62
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/hisilicon,hi6220-mtcmos.txt
@@ -0,0 +1,32 @@
+Hi6220 mtcmos Voltage regulators
+
+Required parent device properties:
+- compatible: Must be "hisilicon,hi6220-mtcmos-driver"
+- hisilicon,mtcmos-steady-us: The time to wait for power steady
+- hisilicon,mtcmos-sc-on-base: address of hi6220 soc control register
+
+Required child device properties:
+- regulator-name: The name of mtcmos
+- hisilicon,ctrl-regs: offset of ctrl-regs
+- hisilicon,ctrl-data: the bit to ctrl the regulator
+
+Example:
+        mtcmos {
+                compatible = "hisilicon,hi6220-mtcmos-driver";
+                hisilicon,mtcmos-steady-us = <10>;
+                hisilicon,mtcmos-sc-on-base  = <0xf7800000>;
+                hisilicon,mtcmos-acpu-on-base = <0xf65a0000>;
+
+                mtcmos1: regulator@a1{
+                        regulator-name = "G3D_PD_VDD";
+                        regulator-compatible = "mtcmos1";
+                        hisilicon,ctrl-regs = <0x830 0x834 0x83c>;
+                        hisilicon,ctrl-data = <1 0x1>;
+                };
+                mtcmos2: regulator@a2{
+                        regulator-name = "SOC_MED";
+                         regulator-compatible = "mtcmos2";
+                        hisilicon,ctrl-regs = <0x830 0x834 0x83c>;
+                        hisilicon,ctrl-data = <2 0x1>;
+                };
+        };
-- 
1.7.9.5
