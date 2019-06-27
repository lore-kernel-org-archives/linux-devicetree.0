Return-Path: <SRS0=n/3y=U2=bootlin.com=miquel.raynal@kernel.org>
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 1/4] clk: mvebu: armada-37xx-periph: add PCIe gated clock
Date: Thu, 27 Jun 2019 14:52:42 +0200
Message-Id: <20190627125245.26788-2-miquel.raynal@bootlin.com>
In-Reply-To: <20190627125245.26788-1-miquel.raynal@bootlin.com>
References: <20190627125245.26788-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

The PCIe clock is a gated clock which has the same source as GbE0
(both IPs share a set of registers). This source clock is called
'gbe_core' in the driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 4c20093a42fb..1e18c5a875bd 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -304,6 +304,7 @@ PERIPH_CLK_GATE_DIV(gbe_bm, 12, DIV_SEL1, 0, clk_table1);
 PERIPH_CLK_FULL_DD(sdio, 11, 14, DIV_SEL0, DIV_SEL0, 3, 6);
 PERIPH_CLK_FULL_DD(usb32_usb2_sys, 16, 16, DIV_SEL0, DIV_SEL0, 9, 12);
 PERIPH_CLK_FULL_DD(usb32_ss_sys, 17, 18, DIV_SEL0, DIV_SEL0, 15, 18);
+static PERIPH_GATE(pcie, 14);
 
 static struct clk_periph_data data_sb[] = {
 	REF_CLK_MUX_DD(gbe_50),
@@ -319,6 +320,7 @@ static struct clk_periph_data data_sb[] = {
 	REF_CLK_FULL_DD(sdio),
 	REF_CLK_FULL_DD(usb32_usb2_sys),
 	REF_CLK_FULL_DD(usb32_ss_sys),
+	REF_CLK_GATE(pcie, "gbe_core"),
 	{ },
 };
 
-- 
2.19.1
