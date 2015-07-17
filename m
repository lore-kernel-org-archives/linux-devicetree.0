From: <atull@opensource.altera.com>
Subject: [PATCH v9 1/7] staging: usage documentation for FPGA manager core
Date: Fri, 17 Jul 2015 10:51:11 -0500
Message-ID: <1437148277-5405-2-git-send-email-atull@opensource.altera.com>
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

Add a document on the new FPGA manager core.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 drivers/staging/fpga/Documentation/fpga-mgr.txt |  117 +++++++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 drivers/staging/fpga/Documentation/fpga-mgr.txt

diff --git a/drivers/staging/fpga/Documentation/fpga-mgr.txt b/drivers/staging/fpga/Documentation/fpga-mgr.txt
new file mode 100644
index 0000000..b5b6ed4
--- /dev/null
+++ b/drivers/staging/fpga/Documentation/fpga-mgr.txt
@@ -0,0 +1,117 @@
+  FPGA Manager Core
+
+  Alan Tull 2015
+
+  Overview
+  --------
+The FPGA manager core exports a set of functions for programming an image to a
+FPGA.  All manufacturor specifics are hidden away in a low level driver.  The
+API is manufacturor agnostic.  Of course the FPGA image data itself is very
+manufacturor specific but for our purposes it's just data in a buffer or file
+or something.  The FPGA manager core won't parse it or know anything about it.
+
+
+  Files
+  -----
+drivers/staging/fpga/fpga-mgr.c
+include/linux/fpga/fpga-mgr.h
+
+
+  The API Functions
+  ----------------
+The API that is exported is currently 6 functions:
+
+   int fpga_mgr_buf_load(struct fpga_manager *mgr,
+                         u32 flags,
+                         const char *buf,
+                         size_t count);
+
+An FPGA image exists as a buffer in memory.  Load it into the FPGA.  The FPGA
+ends up in operating mode or return a negative error code.
+
+   int fpga_mgr_firmware_load(struct fpga_manager *mgr,
+                              u32 flags,
+                              const char *image_name);
+
+An FPGA image exists as a file that is on the firmware search path (see the
+firmware class documentation).  Load as above.
+
+   struct fpga_manager *of_fpga_mgr_get(struct device_node *node);
+
+Given a DT node, get a reference to a fpga manager.
+
+   void fpga_mgr_put(struct fpga_manager *mgr);
+
+Release the reference to the fpga manager.
+
+   int fpga_mgr_register(struct device *dev,
+                         const char *name,
+                         const struct fpga_manager_ops *mops,
+                         void *priv);
+   void fpga_mgr_unregister(struct device *dev);
+
+Register/unregister the lower level device specific driver.
+
+
+  How To Write an Image Buffer to a supported FPGA
+  ------------------------------------------------
+/* device node that specifies the fpga manager to use */
+struct device_node *mgr_node;
+
+/* FPGA image is in this buffer.  count is size of buf. */
+char *buf;
+int count;
+int ret;
+
+struct fpga_manager *mgr = of_fpga_mgr_get(mgr_node);
+ret = fpga_mgr_buf_load(mgr, flags, buf, count);
+fpga_mgr_put(mgr);
+
+
+  How To Write an Image File to a supported FPGA
+  ------------------------------------------------
+/* device node that specifies the fpga manager to use */
+struct device_node *mgr_node;
+
+/* FPGA image is in this buffer.  count is size of buf. */
+const char *path = "fpga-image-9.rbf"
+int ret;
+
+struct fpga_manager *mgr = of_fpga_mgr_get(mgr_node);
+ret = fpga_mgr_firmware_load(mgr, flags, path);
+fpga_mgr_put(mgr);
+
+
+  How To Support a new FPGA device
+  --------------------------------
+To add another fpga manager, look at the bottom part of socfpga.c for an
+example, starting with the declaration of socfpga_fpga_ops.
+
+static const struct fpga_manager_ops socfpga_fpga_ops = {
+       .write_init = socfpga_fpga_ops_configure_init,
+       .write = socfpga_fpga_ops_configure_write,
+       .write_complete = socfpga_fpga_ops_configure_complete,
+       .state = socfpga_fpga_ops_state,
+};
+
+You will want to create a platform driver that has a set of ops like that
+and then register it with fpga_mgr_register in your probe function.  Your
+ops will implement whatever device specific register writes needed and
+will return negative error codes if things don't go well.
+
+The programming seqence is:
+ 1. .write_init
+ 2. .write (may be called once or multiple times)
+ 3. .write_complete
+
+The .write_init function will prepare the FPGA to receive the image data.
+
+The .write function receives an image buffer or a chunk of the image and
+writes it the FPGA.  The buffer may arrive as one chunk or a bunck of
+small chunks through this function being called multiple times.
+
+The .write_complete function is called after all the image has been written
+to put the FPGA into operating mode.
+
+The .state function will read your hardware and return a code of type
+"enum fpga_mgr_states".  It doesn't result in a change in hardware state.
-- 
1.7.9.5
