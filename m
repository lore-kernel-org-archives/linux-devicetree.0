From: Dong Aisheng <b29396@freescale.com>
Subject: [PATCH v2 3/7] ARM: imx6q: add anatop support into syscon
Date: Mon, 27 Aug 2012 15:24:41 +0800
Message-ID: <1346052285-4344-4-git-send-email-b29396@freescale.com>
References: <1346052285-4344-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1346052285-4344-1-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linus.walleij@stericsson.com, s.hauer@pengutronix.de, shawn.guo@linaro.org, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com, sameo@linux.intel.com, lrg@ti.com, broonie@opensource.wolfsonmicro.com, richard.zhao@freescale.com, devicetree-discuss@lists.ozlabs.org, swarren@wwwdotorg.org
List-Id: devicetree@vger.kernel.org

From: Dong Aisheng <dong.aisheng@linaro.org>

There're a few anatop registers need to be accessed by different modules.
Add anatop registers into syscon support for easy access.

Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
---
 arch/arm/boot/dts/imx6q.dtsi |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index bea21bc..db3fa15 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -378,8 +378,8 @@
 				interrupts = <0 87 0x04 0 88 0x04>;
 			};
 
-			anatop@020c8000 {
-				compatible = "fsl,imx6q-anatop";
+			anatop: anatop@020c8000 {
+				compatible = "fsl,imx6q-anatop", "syscon";
 				reg = <0x020c8000 0x1000>;
 				interrupts = <0 49 0x04 0 54 0x04 0 127 0x04>;
 
-- 
1.7.0.4
