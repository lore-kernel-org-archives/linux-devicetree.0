From: <jan.tuerk@emtrion.com>
Subject: [PATCH v3 4/6] ARM: dts: imx: Add an cpu0 label for imx6dl devices.
Date: Fri, 20 Apr 2018 14:50:51 +0200
Message-ID: <20180420125108.14197-5-jan.tuerk@emtrion.com>
References: <20171220134710.64479-2-jan.tuerk@emtrion.com>
 <20180420125108.14197-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180420125108.14197-1-jan.tuerk@emtrion.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Russell King <linux@armlinux.org.uk>, Jan Tuerk <jan.tuerk@emtrion.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Jan Tuerk <jan.tuerk@emtrion.com>

Adding the label cpu0 allows the adjustment of cpu-parameters
by reference in overlaying dtsi files in the same way as it
is possible for imx6q devices.

Signed-off-by: Jan Tuerk <jan.tuerk@emtrion.com>
---
 arch/arm/boot/dts/imx6dl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
index 558bce81209d..fc658bf3a693 100644
--- a/arch/arm/boot/dts/imx6dl.dtsi
+++ b/arch/arm/boot/dts/imx6dl.dtsi
@@ -21,7 +21,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "arm,cortex-a9";
 			device_type = "cpu";
 			reg = <0>;
-- 
2.11.0
