From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 23/69] ARM: dts: at91: sama5d2: use the divided clock for SMC
Date: Wed,  5 Dec 2018 04:42:01 -0500
Message-ID: <20181205094247.6556-23-sashal@kernel.org>
References: <20181205094247.6556-1-sashal@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205094247.6556-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Romain Izard <romain.izard.pro@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Romain Izard <romain.izard.pro@gmail.com>

[ Upstream commit 4ab7ca092c3c7ac8b16aa28eba723a8868f82f14 ]

The SAMA5D2 is different from SAMA5D3 and SAMA5D4, as there are two
different clocks for the peripherals in the SoC. The Static Memory
controller is connected to the divided master clock.

Unfortunately, the device tree does not correctly show this and uses the
master clock directly. This clock is then used by the code for the NAND
controller to calculate the timings for the controller, and we end up with
slow NAND Flash access.

Fix the device tree, and the performance of Flash access is improved.

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/sama5d2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index b1a26b42d190..a8e4b89097d9 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -308,7 +308,7 @@
 				  0x1 0x0 0x60000000 0x10000000
 				  0x2 0x0 0x70000000 0x10000000
 				  0x3 0x0 0x80000000 0x10000000>;
-			clocks = <&mck>;
+			clocks = <&h32ck>;
 			status = "disabled";
 
 			nand_controller: nand-controller {
-- 
2.17.1
