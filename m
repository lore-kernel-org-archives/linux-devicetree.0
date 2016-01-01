From: Roman Volkov <v1ron@mail.ru>
Subject: [PATCH v3 RESEND 1/2] dts: vt8500: Add SDHC node to DTS file for WM8650
Date: Fri,  1 Jan 2016 16:38:11 +0300
Message-ID: <1451655492-2569-2-git-send-email-v1ron@mail.ru>
References: <1451655492-2569-1-git-send-email-v1ron@mail.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451655492-2569-1-git-send-email-v1ron@mail.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org, linux+armsoc@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Alexey Charkov <alchark@gmail.com>, Roman Volkov <rvolkov@v1ros.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Tony Prisk <linux@prisktech.co.nz>
List-Id: devicetree@vger.kernel.org

From: Roman Volkov <rvolkov@v1ros.org>

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
