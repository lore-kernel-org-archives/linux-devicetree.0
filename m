From: <atull@opensource.altera.com>
Subject: [PATCH v13 1/6] fpga: add usage documentation for simple fpga bus
Date: Tue, 3 Nov 2015 11:10:59 -0600
Message-ID: <1446570664-10293-2-git-send-email-atull@opensource.altera.com>
References: <1446570664-10293-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1446570664-10293-1-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, gregkh@linuxfoundation.org, monstr@monstr.eu, michal.simek@xilinx.com, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, pantelis.antoniou@konsulko.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add a document spelling out usage of the simple fpga bus.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
Reviewed-by: Moritz Fischer <moritz.fischer@ettus.com>
---
v9:  Initial version of this patch in patchset
v10: s/fpga/FPGA/g
     improve formatting
     some rewriting
     move to staging/simple-fpga-bus
v11: No change in this patch for v11 of the patch set
v12: Moved out of staging
     Small changes due to using FPGA bridge framework and not
     representing the bridges as resets.
v13: Fix some nits
---
 Documentation/fpga/simple-fpga-bus.txt | 58 ++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/fpga/simple-fpga-bus.txt

diff --git a/Documentation/fpga/simple-fpga-bus.txt b/Documentation/fpga/simple-fpga-bus.txt
new file mode 100644
index 0000000..9b04826
--- /dev/null
+++ b/Documentation/fpga/simple-fpga-bus.txt
@@ -0,0 +1,58 @@
+Simple FPGA Bus
+
+Alan Tull 2015
+
+Overview
+========
+
+The simple FPGA bus adds device tree overlay support for FPGAs.  Loading a DT
+overlay will result in the FPGA getting programmed with an image, its bridges
+will be released, and the DT populated for nodes below the simple-fpga-bus.
+This results in drivers getting probed for the hardware that just got added.
+This is intended to support the FPGA usage where the FPGA has hardware that
+requires drivers.  Removing the overlay will result in the drivers getting
+removed and the bridges being disabled.
+
+The simple FPGA bus will need to disable and enable bridges that will only
+affect the child devices that are below the bus.  If partial reconfiguration
+is to be done, then bridges will need to be added within the FPGA design to
+protect the rest of the bus when one part of the FPGA design is being
+reconfigured.
+
+
+Sequence
+========
+
+Load the DT overlay.  One way to do that from user space is to use Pantelis'
+DT-Overlay configfs interface.
+
+This causes the simple FPGA bus to be probed and will do the following:
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
+ 4. FPGA bridge drivers.
+
+The DT overlay includes bindings (documented in bindings/simple-fpga-bus.txt)
+that specify:
+ * Which FPGA manager to use.
+ * Which image file to load.
+ * Flags indicating whether this this image is for full reconfiguration or
+   partial.
+ * A list of FPGA bridges.
+ * Child nodes specifying the devices that will be added with appropriate
+   compatible strings, etc.
+
+Since this code uses the firmware interface to get the image and DT overlay,
+they currently have to be files on the file system.  It doesn't have to be that
+way forever as DT bindings could be added to point to other sources for the
+image.
-- 
1.9.1

