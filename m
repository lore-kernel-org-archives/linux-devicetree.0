From: Huang Shijie <b32955@freescale.com>
Subject: [PATCH 3/6] ARM: dts: imx6qdl: add more information for WEIM
Date: Mon, 20 May 2013 16:48:59 +0800
Message-ID: <1369039742-10893-4-git-send-email-b32955@freescale.com>
References: <1369039742-10893-1-git-send-email-b32955@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1369039742-10893-1-git-send-email-b32955@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org
Cc: rob.herring@calxeda.com, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, Huang Shijie <b32955@freescale.com>
List-Id: devicetree@vger.kernel.org

Add the clock and compatible information for the weim.
Also adds the weim label.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 arch/arm/boot/dts/imx6qdl.dtsi |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 42e461c..f21d259 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -744,9 +744,11 @@
 				reg = <0x021b4000 0x4000>;
 			};
 
-			weim@021b8000 {
+			weim: weim@021b8000 {
+				compatible = "fsl,imx6q-weim";
 				reg = <0x021b8000 0x4000>;
 				interrupts = <0 14 0x04>;
+				clocks = <&clks 196>;
 			};
 
 			ocotp@021bc000 {
-- 
1.7.1
