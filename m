From: Peter Rosin <peda@axentia.se>
Subject: [PATCH] powerpc/fsl/dts: fix the i2c-mux compatible for t104xqds
Date: Thu,  3 Aug 2017 14:59:34 +0200
Message-ID: <20170803125934.14960-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

The sanctioned compatible is "nxp,pca9547".

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 arch/powerpc/boot/dts/fsl/t104xqds.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi b/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
index 2fd4cbe7098f..615479732252 100644
--- a/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xqds.dtsi
@@ -269,7 +269,7 @@
 
 		i2c@118000 {
 			pca9547@77 {
-				compatible = "philips,pca9547";
+				compatible = "nxp,pca9547";
 				reg = <0x77>;
 			};
 			rtc@68 {
-- 
2.11.0
