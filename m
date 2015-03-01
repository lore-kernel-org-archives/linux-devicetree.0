From: Roman Volkov <rvolkov@v1ros.org>
Subject: [PATCH v3 RESEND 1/2] dts: vt8500: Add SDHC node to DTS file for WM8650
Date: Sun,  1 Mar 2015 23:48:06 +0300
Message-ID: <1425242887-7594-2-git-send-email-rvolkov@v1ros.org>
References: <1425226007-2757-3-git-send-email-rvolkov@v1ros.org>
 <1425242887-7594-1-git-send-email-rvolkov@v1ros.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425242887-7594-1-git-send-email-rvolkov@v1ros.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Prisk <linux@prisktech.co.nz>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>, Roman Volkov <rvolkov@v1ros.org>
List-Id: devicetree@vger.kernel.org

Since WM8650 has the same 'WMT' SDHC controller as WM8505, and the driver
is already in the kernel, this node enables the controller support for
WM8650

Signed-off-by: Roman Volkov <rvolkov@v1ros.org>
Reviewed-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/wm8650.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/wm8650.dtsi b/arch/arm/boot/dts/wm8650.dtsi
index b1c59a7..e12213d 100644
--- a/arch/arm/boot/dts/wm8650.dtsi
+++ b/arch/arm/boot/dts/wm8650.dtsi
@@ -187,6 +187,15 @@
 			interrupts = <43>;
 		};
 
+		sdhc@d800a000 {
+			compatible = "wm,wm8505-sdhc";
+			reg = <0xd800a000 0x400>;
+			interrupts = <20>, <21>;
+			clocks = <&clksdhc>;
+			bus-width = <4>;
+			sdon-inverted;
+		};
+
 		fb: fb@d8050800 {
 			compatible = "wm,wm8505-fb";
 			reg = <0xd8050800 0x200>;
-- 
2.3.1
