From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [RFC PATCH 4/9] of: mtd: add NAND timings bindings documentation
Date: Wed,  8 Jan 2014 15:21:59 +0100
Message-ID: <1389190924-26226-5-git-send-email-b.brezillon@overkiz.com>
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, David Woodhouse <dwmw2@infradead.org>, Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, dev@linux-sunxi.org, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: devicetree@vger.kernel.org

Add a NAND timing properties to NAND dt doc.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 Documentation/devicetree/bindings/mtd/nand.txt |   34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index 03855c8..0dff600 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -5,3 +5,37 @@
   "soft_bch".
 - nand-bus-width : 8 or 16 bus width if not present 8
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
+
+nand timings definition expressed in nanoseconds (found in NAND datasheets):
+ - tCLS-min : CLE setup time
+ - tCLH-min : CLE Hold time
+ - tCS-min : CE# setup time
+ - tCH-min : CE# hold time
+ - tWP-min : WE# pulse width
+ - tALS-min : ALE setup time
+ - tALH-min : ALE hold time
+ - tDS-min : Data setup time
+ - tDH-min : Data hold time
+ - tWC-min : Write cycle time
+ - tWH-min : WE# high hold time
+ - tR-max : Data transfer from cell to register
+ - tAR-min : ALE to RE# delay
+ - tCLR-min : CLE to RE# delay
+ - tRR-min : Ready to RE# low
+ - tRP-min : RE# pulse width
+ - tWB-max : WE# high to busy
+ - tRC-min : Read cycle time
+ - tREA-max : RE# access time
+ - tRHZ-max : RE# high to output high Z
+ - tCHZ-max : CE# high to output high Z
+ - tRHOH-min : RE# high to output hold
+ - tRLOH-min : RE# low to output hold
+ - tCOH-min : RE# or CE# high to output hold
+ - tREH-min : RE# high hold time
+ - tWHR-min : WE# high to RE# low
+ - tRHW-min : RE# high to WE# low
+ - tIR-min : Output high Z to RE# low
+ - tCR-min : CE# low to RE# low
+ - tADL-min : Address to data loading time
+ - tRST-max : Device resetting time
+ - tWW-min : Write protection time
-- 
1.7.9.5

