From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v10 14/15] ARM: dts: imx6: add anatop phandle for usbphy
Date: Thu, 20 Feb 2014 13:14:43 +0800
Message-ID: <1392873284-9386-15-git-send-email-peter.chen@freescale.com>
References: <1392873284-9386-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1392873284-9386-1-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: balbi@ti.com, shawn.guo@linaro.org, robh+dt@kernel.org, grant.likely@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, peter.chen@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add anatop phandle for usbphy

Signed-off-by: Peter Chen <peter.chen@freescale.com>
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm/boot/dts/imx6qdl.dtsi |    2 ++
 arch/arm/boot/dts/imx6sl.dtsi  |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index fb28b2e..047b147 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -557,6 +557,7 @@
 				reg = <0x020c9000 0x1000>;
 				interrupts = <0 44 0x04>;
 				clocks = <&clks 182>;
+				fsl,anatop = <&anatop>;
 			};
 
 			usbphy2: usbphy@020ca000 {
@@ -564,6 +565,7 @@
 				reg = <0x020ca000 0x1000>;
 				interrupts = <0 45 0x04>;
 				clocks = <&clks 183>;
+				fsl,anatop = <&anatop>;
 			};
 
 			snvs@020cc000 {
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 28558f1..30322b5 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -489,6 +489,7 @@
 				reg = <0x020c9000 0x1000>;
 				interrupts = <0 44 0x04>;
 				clocks = <&clks IMX6SL_CLK_USBPHY1>;
+				fsl,anatop = <&anatop>;
 			};
 
 			usbphy2: usbphy@020ca000 {
@@ -496,6 +497,7 @@
 				reg = <0x020ca000 0x1000>;
 				interrupts = <0 45 0x04>;
 				clocks = <&clks IMX6SL_CLK_USBPHY2>;
+				fsl,anatop = <&anatop>;
 			};
 
 			snvs@020cc000 {
-- 
1.7.8


