From: Luis Araneda <luaraneda@gmail.com>
Subject: [PATCH] arm: dts: zynq: Fix memory size on the Zybo Z7 board
Date: Tue, 26 Jun 2018 19:20:25 -0400
Message-ID: <20180626232025.14003-1-luaraneda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Luis Araneda <luaraneda@gmail.com>
List-Id: devicetree@vger.kernel.org

According to the reference manual, the board has two Micron
MT41K256M16HA-125 DDR3L memory ICs, which have 512 MiB each

Tested on a ZYBO-Z7-20 board

Signed-off-by: Luis Araneda <luaraneda@gmail.com>
---
 arch/arm/boot/dts/zynq-zybo-z7.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zynq-zybo-z7.dts b/arch/arm/boot/dts/zynq-zybo-z7.dts
index 1e713dc98..bc81ebee5 100644
--- a/arch/arm/boot/dts/zynq-zybo-z7.dts
+++ b/arch/arm/boot/dts/zynq-zybo-z7.dts
@@ -13,7 +13,7 @@
 
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x20000000>;
+		reg = <0x0 0x40000000>;
 	};
 
 	chosen {
-- 
2.18.0
