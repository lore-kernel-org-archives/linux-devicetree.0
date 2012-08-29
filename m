From: Dong Aisheng <b29396@freescale.com>
Subject: [PATCH v4 6/7] ARM: dts: imx6q: add simple-bus compatible string for anatop
Date: Wed, 29 Aug 2012 18:56:57 +0800
Message-ID: <1346237818-9498-7-git-send-email-b29396@freescale.com>
References: <1346237818-9498-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1346237818-9498-1-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, s.hauer@pengutronix.de, shawn.guo@linaro.org, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, sameo@linux.intel.com, lrg@ti.com, broonie@opensource.wolfsonmicro.com, richard.zhao@freescale.com, devicetree-discuss@lists.ozlabs.org, swarren@wwwdotorg.org
List-Id: devicetree@vger.kernel.org

From: Dong Aisheng <dong.aisheng@linaro.org>

Originally the anatop regulator devices are populated by mfd anatop driver.
Since mfd anatop driver will be deleted later, we change to populate the
regulator devices by devicetree automatically.
This will cause some warning messages as follows during boot due to device
recreation: "vdd1p1: Failed to create debugfs directory"
But it does not break any function.
Later, we will remove mfd anatop driver which can get rid of this
error message.

Acked-by: Stephen Warren <swarren@wwwdotorg.org>
Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
---
 arch/arm/boot/dts/imx6q.dtsi |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index db3fa15..52ed4d1 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -379,7 +379,7 @@
 			};
 
 			anatop: anatop@020c8000 {
-				compatible = "fsl,imx6q-anatop", "syscon";
+				compatible = "fsl,imx6q-anatop", "syscon", "simple-bus";
 				reg = <0x020c8000 0x1000>;
 				interrupts = <0 49 0x04 0 54 0x04 0 127 0x04>;
 
-- 
1.7.0.4
