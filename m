From: Sanchayan Maity <maitysanchayan@gmail.com>
Subject: [RFC PATCH 3/4] ARM: dts: vfxxx: Make Vybrid match only on it's own compatible string
Date: Tue, 15 Mar 2016 14:08:29 +0530
Message-ID: <93b58b1da20b4276fed29b9faaab20dd4c6f88a4.1458030082.git.maitysanchayan@gmail.com>
References: <cover.1458030082.git.maitysanchayan@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1458030082.git.maitysanchayan@gmail.com>
In-Reply-To: <cover.1458030082.git.maitysanchayan@gmail.com>
References: <cover.1458030082.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter.Chen@nxp.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stefan@agner.ch, ivan.ivanov@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, shawnguo@kernel.org, marcel@ziswiler.com, Sanchayan Maity <maitysanchayan@gmail.com>
List-Id: devicetree@vger.kernel.org

Remove the compatible string "fsl,imx27-usb" from being used to
match on usb device nodes for Vybrid. This is required for specifying
that Vybrid USB controller is a dual role but not a true OTG controller
using the CI_HDRC_DUAL_ROLE_NOT_OTG flag in the corresponding ci_hdrc_imx
driver.

Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
---
 arch/arm/boot/dts/vfxxx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 5e49fbd..c2d1b5d 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -452,7 +452,7 @@
 			};
 
 			usbdev0: usb@40034000 {
-				compatible = "fsl,vf610-usb", "fsl,imx27-usb";
+				compatible = "fsl,vf610-usb";
 				reg = <0x40034000 0x800>;
 				interrupts = <75 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks VF610_CLK_USBC0>;
-- 
2.7.3
