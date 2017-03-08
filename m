From: Moritz Fischer <mdf@kernel.org>
Subject: [PATCH v2] ARM: zynq: Add #io-channel-cells to (x)adc node for iio-hwmon
Date: Wed,  8 Mar 2017 12:11:24 -0800
Message-ID: <1489003884-2489-1-git-send-email-mdf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Moritz Fischer <mdf@kernel.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Julia Cartwright <julia@ni.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fix

OF: /iio_hwmon: could not get #io-channel-cells for
/amba/adc@f8007100
OF: /iio_hwmon: could not get #io-channel-cells for
/amba/adc@f8007100
OF: /iio_hwmon: could not get #io-channel-cells for
/amba/adc@f8007100

by adding the #io-channel-cells property.

Signed-off-by: Moritz Fischer <mdf@kernel.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Sören Brinkmann <soren.brinkmann@xilinx.com>
Cc: Julia Cartwright <julia@ni.com>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
---

Changes from v1:
- fix messed up commit message
---
 arch/arm/boot/dts/zynq-7000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index f3ac9bf..98233a8 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -72,6 +72,7 @@
 			interrupts = <0 7 4>;
 			interrupt-parent = <&intc>;
 			clocks = <&clkc 12>;
+			#io-channel-cells = <1>;
 		};
 
 		can0: can@e0008000 {
-- 
2.7.4
