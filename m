From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v2 5/6] dt-bindings: clock: add DT binding for the peripheral clocks on Armada 3700
Date: Fri,  8 Jul 2016 00:37:50 +0200
Message-ID: <1467931071-31004-6-git-send-email-gregory.clement@free-electrons.com>
References: <1467931071-31004-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1467931071-31004-1-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Romain Perier <romain.perier@free-electrons.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>
List-Id: devicetree@vger.kernel.org

This commit adds the DT binding documentation for the peripheral clocks
used in the Marvell Armada 3700 SoCs.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/armada3700-periph-clock.txt     | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
new file mode 100644
index 000000000000..1e3370ba189f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
@@ -0,0 +1,70 @@
+* Peripheral Clock bindings for Marvell Armada 37xx SoCs
+
+Marvell Armada 37xx SoCs provide peripheral clocks which are
+used as clock source for the peripheral of the SoC.
+
+There are two different blocks associated to north bridge and south
+bridge.
+
+The peripheral clock consumer should specify the desired clock by
+having the clock ID in its "clocks" phandle cell.
+
+The following is a list of provided IDs for Armada 370 North bridge clocks:
+ID	Clock name	Description
+-----------------------------------
+0	mmc		MMC controller
+1	sata_host	Sata Host
+2	sec_at		Security AT
+3	sac_dap		Security DAP
+4	tsecm		Security Engine
+5	setm_tmx	Serial Embedded Trace Module
+6	avs		Adaptive Voltage Scaling
+7	sqf		SPI
+8	pwm		PWM
+9	i2c_2		I2C 2
+10	i2c_1		I2C 1
+11	ddr_phy		DDR PHY
+12	ddr_fclk	DDR F clock
+13	trace		Trace
+14	counter		Counter
+15	eip97		EIP 97
+16	cpu		CPU
+
+The following is a list of provided IDs for Armada 370 South bridge clocks:
+ID	Clock name	Description
+-----------------------------------
+0	gbe-50		50 MHz parent clock for Gigabit Ethernet
+1	gbe-core	parent clock for Gigabit Ethernet core
+2	gbe-125		125 MHz parent clock for Gigabit Ethernet
+3	gbe1-50		50 MHz clock for Gigabit Ethernet port 1
+4	gbe0-50		50 MHz clock for Gigabit Ethernet port 0
+5	gbe1-125	125 MHz clock for Gigabit Ethernet port 1
+6	gbe0-125	125 MHz clock for Gigabit Ethernet port 0
+7	gbe1-core	Gigabit Ethernet core port 1
+8	gbe0-core	Gigabit Ethernet core port 0
+9	gbe-bm		Gigabit Ethernet Buffer Manager
+10	sdio		SDIO
+11	usb32-sub2-sys	USB 2 clock
+12	usb32-ss-sys	USB 3 clock
+
+Required properties:
+
+- compatible : shall be "marvell,armada-3700-periph-clock-nb" for the
+  north bridge block, or
+  "marvell,armada-3700-periph-clock-sb" for the south bridge block
+- reg : must be the register address of North/South Bridge Clock register
+- #clock-cells : from common clock binding; shall be set to 1
+
+- clocks : list of the parent clock phandle in the following order:
+  TBG-A P, TBG-B P, TBG-A S, TBG-B S and finally the xtal clock.
+
+
+Example:
+
+nb_perih_clk: nb-periph-clk@13000{
+	compatible = "marvell,armada-3700-periph-clock-nb";
+	reg = <0x13000 0x1000>;
+	clocks = <&tbg 0>, <&tbg 1>, <&tbg 2>,
+	<&tbg 3>, <&xtalclk>;
+	#clock-cells = <1>;
+};
-- 
2.5.0

