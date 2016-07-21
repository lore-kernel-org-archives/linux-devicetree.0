From: Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [PATCH] clk: mvebu: armada-39x: add clk description for supported interfaces
Date: Thu, 21 Jul 2016 12:48:10 +0200
Message-ID: <1469098090-17836-1-git-send-email-jaz@semihalf.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, thomas.petazzoni@free-electrons.com, gregory.clement@free-electrons.com, mw@semihalf.com, jaz@semihalf.com, alior@marvell.com
List-Id: devicetree@vger.kernel.org

Both SATA and second USB3.0 interface are supported in Armada-39x SoC
family. Add necessary clk description, so both xhci and sata drivers
can be correctly initialized.

The binding documentation has also been updated accordingly.

Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
---
 Documentation/devicetree/bindings/clock/mvebu-gated-clock.txt | 2 ++
 drivers/clk/mvebu/armada-39x.c                                | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mvebu-gated-clock.txt b/Documentation/devicetree/bindings/clock/mvebu-gated-clock.txt
index 660e649..cb8542d 100644
--- a/Documentation/devicetree/bindings/clock/mvebu-gated-clock.txt
+++ b/Documentation/devicetree/bindings/clock/mvebu-gated-clock.txt
@@ -86,6 +86,8 @@ ID	Clock		Peripheral
 7	pex3		PCIe 3
 8	pex0		PCIe 0
 9	usb3h0		USB3 Host 0
+10	usb3h1		USB3 Host 1
+15	sata0		SATA 0
 17	sdio		SDIO
 22	xor0		XOR 0
 28	xor1		XOR 1
diff --git a/drivers/clk/mvebu/armada-39x.c b/drivers/clk/mvebu/armada-39x.c
index efb974d..4fdfd32 100644
--- a/drivers/clk/mvebu/armada-39x.c
+++ b/drivers/clk/mvebu/armada-39x.c
@@ -142,6 +142,8 @@ static const struct clk_gating_soc_desc armada_39x_gating_desc[] __initconst = {
 	{ "pex3", NULL, 7 },
 	{ "pex0", NULL, 8 },
 	{ "usb3h0", NULL, 9 },
+	{ "usb3h1", NULL, 10 },
+	{ "sata0", NULL, 15 },
 	{ "sdio", NULL, 17 },
 	{ "xor0", NULL, 22 },
 	{ "xor1", NULL, 28 },
-- 
1.8.3.1
