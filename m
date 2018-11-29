From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] ARM: dts: socfpga: remove incorrect 0x leading
Date: Thu, 29 Nov 2018 13:56:49 +0100
Message-ID: <20181129125649.4060-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

unit-address does not have a leading "0x" (the number is assumed to be hexadecimal).

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/socfpga.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index b38f8c240558..715009b8a0a8 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -728,7 +728,7 @@
 			arm,prefetch-offset = <7>;
 		};
 
-		l3regs@0xff800000 {
+		l3regs@ff800000 {
 			compatible = "altr,l3regs", "syscon";
 			reg = <0xff800000 0x1000>;
 		};
-- 
2.19.1
