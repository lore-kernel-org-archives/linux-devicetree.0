From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/6] dt: Update binding information for mvebu gating clocks with Armada 375
Date: Mon, 10 Feb 2014 18:32:46 +0100
Message-ID: <1392053569-28037-4-git-send-email-gregory.clement@free-electrons.com>
References: <1392053569-28037-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392053569-28037-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the binding information for the gating clocks of the Armada 375 SoCs

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../bindings/clock/mvebu-gated-clock.txt           | 31 +++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/mvebu-gated-clock.txt b/Documentation/devicetree/bindings/clock/mvebu-gated-clock.txt
index fc2910fa7e45..cbecec1f64fa 100644
--- a/Documentation/devicetree/bindings/clock/mvebu-gated-clock.txt
+++ b/Documentation/devicetree/bindings/clock/mvebu-gated-clock.txt
@@ -1,6 +1,6 @@
 * Gated Clock bindings for Marvell EBU SoCs
 
-Marvell Armada 370/XP, Dove and Kirkwood allow some peripheral clocks to be
+Marvell Armada 370/375/XP, Dove and Kirkwood allow some peripheral clocks to be
 gated to save some power. The clock consumer should specify the desired clock
 by having the clock ID in its "clocks" phandle cell. The clock ID is directly
 mapped to the corresponding clock gating control bit in HW to ease manual clock
@@ -22,6 +22,34 @@ ID	Clock	Peripheral
 28	ddr	DDR Cntrl
 30	sata1	SATA Host 0
 
+The following is a list of provided IDs for Armada 375:
+ID	Clock		Peripheral
+-----------------------------------
+2	mu		Management Unit
+3	pp		Packet Processor
+4	ptp		PTP
+5	pex0		PCIe 0 Clock out
+6	pex1		PCIe 1 Clock out
+8	audio		Audio Cntrl
+11	nd_clk		Nand Flash Cntrl
+14	sata0_link	SATA 0 Link
+15	sata0_core	SATA 0 Core
+16	usb3		USB3 Host
+17	sdio		SDHCI Host
+18	usb		USB Host
+19	gop		Gigabit Ethernet MAC
+20	sata1_link	SATA 1 Link
+21	sata1_core	SATA 1 Core
+22	xor0		XOR DMA 0
+23	xor1		XOR DMA 0
+24	copro		Coprocessor
+25	tdm		Time Division Mplx
+28	crypto0_enc	Cryptographic Unit Port 0 Encryption
+29	crypto0_core	Cryptographic Unit Port 0 Core
+30	crypto1_enc	Cryptographic Unit Port 1 Encryption
+31	crypto1_core	Cryptographic Unit Port 1 Core
+
+
 The following is a list of provided IDs for Armada XP:
 ID	Clock	Peripheral
 -----------------------------------
@@ -95,6 +123,7 @@ ID	Clock	Peripheral
 Required properties:
 - compatible : shall be one of the following:
 	"marvell,armada-370-gating-clock" - for Armada 370 SoC clock gating
+	"marvell,armada-375-gating-clock" - for Armada 375 SoC clock gating
 	"marvell,armada-xp-gating-clock" - for Armada XP SoC clock gating
 	"marvell,dove-gating-clock" - for Dove SoC clock gating
 	"marvell,kirkwood-gating-clock" - for Kirkwood SoC clock gating
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
