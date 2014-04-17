From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: [PATCH RFC v2 4/4] mtd: nand: Add a devicetree binding for onfi timing parameters
Date: Fri, 18 Apr 2014 01:28:40 +0530
Message-ID: <3ce233c6-0549-41bb-a417-3f66cc707cfa@CH1EHSMHS043.ehs.local>
References: <1397764720-29846-1-git-send-email-punnaia@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1397764720-29846-1-git-send-email-punnaia@xilinx.com>
Sender: linux-doc-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, michal.simek@xilinx.com, grant.likely@linaro.org, gregkh@linuxfoundation.org, jason@lakedaemon.net, ezequiel.garcia@free-electrons.com, arnd@arndb.de, dwmw2@infradead.org, computersforpeace@gmail.com, artem.bityutskiy@linux.intel.com, pekon@ti.com, jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com, joern@logfs.org
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

Added binding information for onfi timing parameters as per the
onfi 1.0 specification. So, nand controllers that have support for
configuring any of these timing parameters can use this binding
information.

Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
---
 Documentation/devicetree/bindings/mtd/nand.txt |   46 ++++++++++++++++++++++++
 1 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index b53f92e..4901091 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -19,3 +19,49 @@ errors per {size} bytes".
 The interpretation of these parameters is implementation-defined, so not all
 implementations must support all possible combinations. However, implementations
 are encouraged to further specify the value(s) they support.
+
+Timing parameters:
+  Based on onfi specification 1.0, following are defined parameters.Each
+controller should add supported parameters to IP node.
+All the timing parameters are in nano second time units.
+
+- nand-tADL-ns   : ALE to data loading time
+- nand-tALH-ns   : ALE hold time
+- nand-tALS-ns   : ALE setup time
+- nand-tAR-ns    : ALE to RE# delay
+- nand-tBERS-ns  : Block erase time
+- nand-tCEA-ns   : CE# access time
+- nand-tCCS-ns   : Change column setup time
+- nand-tCH-ns    : CE# hold time
+- nand-tCHZ-ns   : CE# high to output hi-Z
+- nand-tCLH-ns   : CLE hold time
+- nand-tCLR-ns   : CLE to RE# delay
+- nand-tCLS-ns   : CLE setup time
+- nand-tCOH-ns   : CE# high to output hold
+- nand-tCS-ns    : CE# setup time
+- nand-tDH-ns    : Data hold time
+- nand-tDS-ns    : Data setup time
+- nand-tFEAT-ns  : Busy time for Set Features and Get Features
+- nand-tIEBSY-ns : Busy time for interleaved erase operation
+- nand-tIPBSY-ns : Busy time for interleaved program operation
+- nand-tIR-ns    : Output hi-Z to RE# low
+- nand-tPCBSY-ns : Program cache busy time
+- nand-tPROG-ns  : Page program time
+- nand-tR-ns     : Page read time
+- nand-tRC-ns    : RE# cycle time
+- nand-tRCBSY-ns : Read cache busy time
+- nand-tREA-ns   : RE# access time
+- nand-tREH-ns   : RE# high hold time
+- nand-tRHOH-ns  : RE# high to output hold
+- nand-tRHW-ns   : RE# high to WE# low
+- nand-tRHZ-ns   : RE# high to output hi-z
+- nand-tRLOH-ns  : RE# low to output hold
+- nand-tRP-ns    : RE# pulse width
+- nand-tRR-ns    : Ready to RE# low
+- nand-tRST-ns   : Device reset time
+- nand-tWB-ns    : WE# high to R/B# low
+- nand-tWC-ns    : WE# cycle time
+- nand-tWH-ns    : WE# high hold time
+- nand-tWHR-ns   : WE# high to RE# low
+- nand-tWP-ns    : WE# pulse width
+- nand-tWW-ns    : WP# transition to WE# low
-- 
1.7.4


