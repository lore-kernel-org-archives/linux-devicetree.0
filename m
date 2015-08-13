From: <atull@opensource.altera.com>
Subject: [PATCH v10 1/8] usage documentation for FPGA manager core
Date: Thu, 13 Aug 2015 12:37:25 -0500
Message-ID: <1439487452-23977-3-git-send-email-atull@opensource.altera.com>
References: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
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
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, Alan Tull <atull@opensource.altera.com>, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, pavel@denx.de, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add a document on the new FPGA manager core.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v9:  initial version where this patch was added

v10: requested cleanups to formatting and otherwise
     s/fpga/FPGA/g
     rewrite implementation section to not reference socfpga.c by name
     other rewrites
     Moved to Documentation/fpga/
---
 Documentation/fpga/fpga-mgr.txt |  171 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 Documentation/fpga/fpga-mgr.txt

diff --git a/Documentation/fpga/fpga-mgr.txt b/Documentation/fpga/fpga-mgr.txt
new file mode 100644
index 0000000..c5259e4
--- /dev/null
+++ b/Documentation/fpga/fpga-mgr.txt
@@ -0,0 +1,171 @@
+FPGA Manager Core
+
+Alan Tull 2015
+
+Overview
+========
+
+The FPGA manager core exports a set of functions for programming an FPGA with
+image.  The API is manufacturer agnostic.  All manufacturer specifics are
+hidden away in a low level driver which registers a set of ops with the core.
+The FPGA image data itself is very manufacturer specific, but for our purposes
+it's just binary data.  The FPGA manager core won't parse it.
+
+
+API Functions:
+==============
+
+To program the FPGA from a file or from a buffer:
+-------------------------------------------------
+
+	int fpga_mgr_buf_load(struct fpga_manager *mgr, u32 flags,
+		              const char *buf, size_t count);
+
+Load the FPGA from an image which exists as a buffer in memory.
+
+	int fpga_mgr_firmware_load(struct fpga_manager *mgr, u32 flags,
+		                   const char *image_name);
+
+Load the FPGA from an image which exists as a file.  The image file must be on
+the firmware search path (see the firmware class documentation).
+
+For both these functions, flags == 0 for normal full reconfiguration or
+FPGA_MGR_PARTIAL_RECONFIG for partial reconfiguration.  If successful, the FPGA
+ends up in operating mode.  Return 0 on success or a negative error code.
+
+
+To get/put a reference to a FPGA manager:
+-----------------------------------------
+
+	struct fpga_manager *of_fpga_mgr_get(struct device_node *node);
+
+	void fpga_mgr_put(struct fpga_manager *mgr);
+
+Given a DT node, get an exclusive reference to a FPGA manager or release
+the reference.
+
+
+To register or unregister the low level FPGA-specific driver:
+-------------------------------------------------------------
+
+	int fpga_mgr_register(struct device *dev, const char *name,
+		              const struct fpga_manager_ops *mops,
+		              void *priv);
+
+	void fpga_mgr_unregister(struct device *dev);
+
+Use of these two functions is described below in "How To Support a new FPGA
+device."
+
+
+How to write an image buffer to a supported FPGA
+================================================
+/* Include to get the API */
+#include <linux/fpga/fpga-mgr.h>
+
+/* device node that specifies the FPGA manager to use */
+struct device_node *mgr_node = ...
+
+/* FPGA image is in this buffer.  count is size of the buffer. */
+char *buf = ...
+int count = ...
+
+/* flags indicates whether to do full or partial reconfiguration */
+int flags = 0;
+
+int ret;
+
+/* Get exclusive control of FPGA manager */
+struct fpga_manager *mgr = of_fpga_mgr_get(mgr_node);
+
+/* Load the buffer to the FPGA */
+ret = fpga_mgr_buf_load(mgr, flags, buf, count);
+
+/* Release the FPGA manager */
+fpga_mgr_put(mgr);
+
+
+How to write an image file to a supported FPGA
+==============================================
+/* Include to get the API */
+#include <linux/fpga/fpga-mgr.h>
+
+/* device node that specifies the FPGA manager to use */
+struct device_node *mgr_node = ...
+
+/* FPGA image is in this file which is on the firmware search path */
+const char *path = "fpga-image-9.rbf"
+
+/* flags indicates whether to do full or partial reconfiguration */
+int flags = 0;
+
+int ret;
+
+/* Get exclusive control of FPGA manager */
+struct fpga_manager *mgr = of_fpga_mgr_get(mgr_node);
+
+/* Get the firmware image (path) and load it to the FPGA */
+ret = fpga_mgr_firmware_load(mgr, flags, path);
+
+/* Release the FPGA manager */
+fpga_mgr_put(mgr);
+
+
+How to support a new FPGA device
+================================
+To add another FPGA manager, write a driver that implements a set of ops.  The
+probe function calls fpga_mgr_register(), such as:
+
+static const struct fpga_manager_ops socfpga_fpga_ops = {
+       .write_init = socfpga_fpga_ops_configure_init,
+       .write = socfpga_fpga_ops_configure_write,
+       .write_complete = socfpga_fpga_ops_configure_complete,
+       .state = socfpga_fpga_ops_state,
+};
+
+static int socfpga_fpga_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct socfpga_fpga_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* ... do ioremaps, get interrupts, etc. and save
+	   them in priv... */
+
+	return fpga_mgr_register(dev, "Altera SOCFPGA FPGA Manager",
+				 &socfpga_fpga_ops, priv);
+}
+
+static int socfpga_fpga_remove(struct platform_device *pdev)
+{
+	fpga_mgr_unregister(&pdev->dev);
+
+	return 0;
+}
+
+
+The ops will implement whatever device specific register writes are needed to
+do the programming sequence for this particular FPGA.  These ops return 0 for
+success or negative error codes otherwise.
+
+The programming sequence is:
+ 1. .write_init
+ 2. .write (may be called once or multiple times)
+ 3. .write_complete
+
+The .write_init function will prepare the FPGA to receive the image data.
+
+The .write function writes a buffer to the FPGA. The buffer may be contain the
+whole FPGA image or may be a smaller chunk of an FPGA image.  In the latter
+case, this function is called multiple times for successive chunks.
+
+The .write_complete function is called after all the image has been written
+to put the FPGA into operating mode.
+
+The ops include a .state function which will read the hardware FPGA manager and
+return a code of type enum fpga_mgr_states.  It doesn't result in a change in
+hardware state.
-- 
1.7.9.5
