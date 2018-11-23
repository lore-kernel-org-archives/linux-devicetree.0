Return-Path: <SRS0=DtIy=OC=bootlin.com=miquel.raynal@kernel.org>
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/4] dt-bindings: clk: armada3700: fix typo in SoC name
Date: Fri, 23 Nov 2018 10:44:42 +0100
Message-Id: <20181123094444.27956-4-miquel.raynal@bootlin.com>
In-Reply-To: <20181123094444.27956-1-miquel.raynal@bootlin.com>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

This documentation is about Armada 3700 SoCs.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/clock/armada3700-periph-clock.txt     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
index 1e3370ba189f..85972715e593 100644
--- a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
+++ b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
@@ -9,7 +9,7 @@ bridge.
 The peripheral clock consumer should specify the desired clock by
 having the clock ID in its "clocks" phandle cell.
 
-The following is a list of provided IDs for Armada 370 North bridge clocks:
+The following is a list of provided IDs for Armada 3700 North bridge clocks:
 ID	Clock name	Description
 -----------------------------------
 0	mmc		MMC controller
@@ -30,7 +30,7 @@ ID	Clock name	Description
 15	eip97		EIP 97
 16	cpu		CPU
 
-The following is a list of provided IDs for Armada 370 South bridge clocks:
+The following is a list of provided IDs for Armada 3700 South bridge clocks:
 ID	Clock name	Description
 -----------------------------------
 0	gbe-50		50 MHz parent clock for Gigabit Ethernet
-- 
2.19.1
