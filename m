From: <atull@opensource.altera.com>
Subject: [PATCH v10 5/8] staging: usage documentation for simple fpga bus
Date: Thu, 13 Aug 2015 12:37:29 -0500
Message-ID: <1439487452-23977-7-git-send-email-atull@opensource.altera.com>
References: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add a document spelling out usage of the simple fpga bus.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v9:  Initial version of this patch in patchset

v10: s/fpga/FPGA/g
     improve formatting
     some rewriting
     move to staging/simple-fpga-bus
---
 .../Documentation/simple-fpga-bus.txt              |   58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 drivers/staging/simple-fpga-bus/Documentation/simple-fpga-bus.txt

diff --git a/drivers/staging/simple-fpga-bus/Documentation/simple-fpga-bus.txt b/drivers/staging/simple-fpga-bus/Documentation/simple-fpga-bus.txt
new file mode 100644
index 0000000..c96d705
--- /dev/null
+++ b/drivers/staging/simple-fpga-bus/Documentation/simple-fpga-bus.txt
@@ -0,0 +1,58 @@
+Simple FPGA Bus
+
+Alan Tull 2015
+
+Overview
+========
+
+The simple FPGA bus adds device tree overlay support for FPGA's.  Loading a
+DT overlay will result in the FPGA getting an image loaded, its bridges will
+be released, and the DT populated for nodes below the simple-fpga-bus.  This
+results in drivers getting probed for the hardware that just got added.  This
+is intended to support the FPGA usage where the FPGA has hardware that
+requires drivers.  Removing the overlay will result in the drivers getting
+removed and the bridges being disabled.
+
+The simple FPGA bus will need to disable and enable bridges that will only
+affect the child devices that are below the bus.  These are pointed to by
+phandles to their resets.  If partial reconfiguration is to be done, then
+bridges will need to be added within the FPGA design to protect the rest of the
+bus when one part of the FPGA design is being reconfigured.
+
+
+Sequence
+========
+
+Load the DT overlay.  One way to do that from user space is to use Pantelis'
+DT-Overlay configfs interface.
+
+This causes the simple FPGA bus go be probed and will do the following:
+ 1. Disable the FPGA bridges.
+ 2. Call the FPGA manager core to program the FPGA.
+ 3. Release the FPGA bridges.
+ 4. Call of_platform_populate resulting in device drivers getting probed.
+
+
+Requirements
+============
+
+ 1. An FPGA image that has a hardware block or blocks that use drivers that are
+    supported in the kernel.
+ 2. A device tree overlay (example is in the simple-fpga-bus bindings document).
+ 3. A FPGA manager driver supporting writing the FPGA.
+ 4. FPGA bridge resets supported as reset controllers.
+
+The DT overlay includes bindings (documented in bindings/simple-fpga-bus.txt)
+that specify:
+ * Which FPGA manager to use.
+ * Which image file to load.
+ * Flags indicating whether this this image is for full reconfiguration or
+   partial.
+ * A list of resets that control the FPGA bridges.
+ * Child nodes specifying the devices that will be added with appropriate
+   compatible strings, etc.
+
+Since this code uses the firmware interface to get the image and DT overlay,
+they currently have to be files on the file system.  It doesn't have to be that
+way forever as DT bindings could be added to point to other sources for the
+image.
-- 
1.7.9.5

