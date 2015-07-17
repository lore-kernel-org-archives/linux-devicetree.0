From: <atull@opensource.altera.com>
Subject: [PATCH v9 2/7] staging: usage documentation for simple fpga bus
Date: Fri, 17 Jul 2015 10:51:12 -0500
Message-ID: <1437148277-5405-3-git-send-email-atull@opensource.altera.com>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, Alan Tull <atull@opensource.altera.com>, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, pavel@denx.de, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add a document spelling out usage of the simple fpga bus.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 .../staging/fpga/Documentation/simple-fpga-bus.txt |   48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 drivers/staging/fpga/Documentation/simple-fpga-bus.txt

diff --git a/drivers/staging/fpga/Documentation/simple-fpga-bus.txt b/drivers/staging/fpga/Documentation/simple-fpga-bus.txt
new file mode 100644
index 0000000..9df519f
--- /dev/null
+++ b/drivers/staging/fpga/Documentation/simple-fpga-bus.txt
@@ -0,0 +1,48 @@
+   Simple FPGA Bus
+
+   Alan Tull 2015
+
+   Overview
+   --------
+The simple FPGA bus adds device tree overlay support for FPGA's.  Loading a
+DT overlay will result in the FGPA getting an image loaded, its bridges will
+be released, and the DT populated for nodes below the simple-fpga-bus.  This
+results in drivers getting probed for the hardware that just got added.  This
+is intended to support the FPGA usage where the FPGA has hardware that
+requires drivers.  Removing the overlay will result in the drivers getting
+removed and the bridges being disabled.
+
+
+   Requirements
+   ------------
+ 1. An FPGA image that has a hardware block or blocks that use drivers that are
+    supported in the kernel.
+ 2. A device tree overlay.
+ 3. A FPGA manager driver supporting writing the FPGA.
+ 4. FPGA bridge resets supported as reset controllers.
+
+The DT overlay includes bindings (documented in bindings/simple-fpga-bus.txt)
+that specify:
+ * Which fpga manager to use
+ * Which image file to load
+ * Flags indicating whether this this image is for full reconfiguration or
+   partial.
+ * a list of resets that should be released.  These enable the FPGA bridges.
+ * child nodes specifying the devices that will be added with appropriate
+   compatible strings, etc.
+
+Since this code uses the firmware interface to get the image and DT overlay,
+they currently have to be files on the filesystem.  It doesn't have to be that
+way forever as DT bindings could be added to point to other sources for the
+image.
+
+
+   Sequence
+   --------
+ 1. Load the DT overlay.  One convenient way to do that is to use Pantelis'
+    handy configfs interface (more below).
+ 2. The simple FPGA bus gets probed and will do the following:
+    a. call the fpga manager core to program the FPGA
+    b. release the FPGA bridges
+    c. call of_platform_populate resulting in device drivers getting probed.
+
-- 
1.7.9.5
