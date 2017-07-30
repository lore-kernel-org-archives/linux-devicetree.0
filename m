From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH] arm64: dts: realtek: Clean up RTD1295 UART reg property
Date: Sun, 30 Jul 2017 13:17:36 +0200
Message-ID: <20170730111737.22888-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The downstream RTD1195 and apparently RTD1295 trees have a modified 8250
serial driver that acknowledges its interrupts using the second reg area,
which is an irq mux.

Drop these unused second reg entries for the UART nodes.

Fixes: 72a7786c0a0d ("ARM64: dts: Add Realtek RTD1295 and Zidoo X9S")
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm64/boot/dts/realtek/rtd1295.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/realtek/rtd1295.dtsi b/arch/arm64/boot/dts/realtek/rtd1295.dtsi
index d8f84666c8ce..43da91fce2b1 100644
--- a/arch/arm64/boot/dts/realtek/rtd1295.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd1295.dtsi
@@ -89,8 +89,7 @@
 
 		uart0: serial@98007800 {
 			compatible = "snps,dw-apb-uart";
-			reg = <0x98007800 0x400>,
-			      <0x98007000 0x100>;
+			reg = <0x98007800 0x400>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			clock-frequency = <27000000>;
@@ -99,8 +98,7 @@
 
 		uart1: serial@9801b200 {
 			compatible = "snps,dw-apb-uart";
-			reg = <0x9801b200 0x100>,
-			      <0x9801b00c 0x100>;
+			reg = <0x9801b200 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			clock-frequency = <432000000>;
@@ -109,8 +107,7 @@
 
 		uart2: serial@9801b400 {
 			compatible = "snps,dw-apb-uart";
-			reg = <0x9801b400 0x100>,
-			      <0x9801b00c 0x100>;
+			reg = <0x9801b400 0x100>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			clock-frequency = <432000000>;
-- 
2.12.3
