From: Roman Volkov <rvolkov@v1ros.org>
Subject: [PATCH v3 RESEND 2/2] dts: vt8500: Fix errors in SDHC node for WM8505
Date: Sun,  1 Mar 2015 23:48:07 +0300
Message-ID: <1425242887-7594-3-git-send-email-rvolkov@v1ros.org>
References: <1425226007-2757-3-git-send-email-rvolkov@v1ros.org>
 <1425242887-7594-1-git-send-email-rvolkov@v1ros.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425242887-7594-1-git-send-email-rvolkov@v1ros.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Prisk <linux@prisktech.co.nz>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>, Roman Volkov <rvolkov@v1ros.org>
List-Id: devicetree@vger.kernel.org

According to datasheet, the registers space of SDHC controller is 1Kb,
not '0x1000', the correct value should be '0x400'. Bracket interrupt
numbers individually per recommendations.

Signed-off-by: Roman Volkov <rvolkov@v1ros.org>
---
 arch/arm/boot/dts/wm8505.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/wm8505.dtsi b/arch/arm/boot/dts/wm8505.dtsi
index a1a854b..e9ef539 100644
--- a/arch/arm/boot/dts/wm8505.dtsi
+++ b/arch/arm/boot/dts/wm8505.dtsi
@@ -281,8 +281,8 @@
 
 		sdhc@d800a000 {
 			compatible = "wm,wm8505-sdhc";
-			reg = <0xd800a000 0x1000>;
-			interrupts = <20 21>;
+			reg = <0xd800a000 0x400>;
+			interrupts = <20>, <21>;
 			clocks = <&clksdhc>;
 			bus-width = <4>;
 		};
-- 
2.3.1
