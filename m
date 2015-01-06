From: <atull@opensource.altera.com>
Subject: [PATCH v8 1/4] doc: add bindings document for altera fpga manager
Date: Tue, 6 Jan 2015 14:13:36 -0600
Message-ID: <1420575219-27061-2-git-send-email-atull@opensource.altera.com>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

New bindings document for Altera fpga manager.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v5 : Move bindings to drivers/staging/fpga/Documentation/bindings

v6 : No change in this patch for v6 of the patch set

v7 : No change in this patch for v7 of the patch set

v8 : Make compatible string and name of bindings doc more chip
     specific
---
 .../bindings/altera-socfpga-fpga-mgr.txt           |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 drivers/staging/fpga/Documentation/bindings/altera-socfpga-fpga-mgr.txt

diff --git a/drivers/staging/fpga/Documentation/bindings/altera-socfpga-fpga-mgr.txt b/drivers/staging/fpga/Documentation/bindings/altera-socfpga-fpga-mgr.txt
new file mode 100644
index 0000000..9b027a6
--- /dev/null
+++ b/drivers/staging/fpga/Documentation/bindings/altera-socfpga-fpga-mgr.txt
@@ -0,0 +1,17 @@
+Altera SOCFPGA FPGA Manager
+
+Required properties:
+- compatible : should contain "altr,socfpga-fpga-mgr"
+- reg        : base address and size for memory mapped io.
+               - The first index is for FPGA manager register access.
+               - The second index is for writing FPGA configuration data.
+- interrupts : interrupt for the FPGA Manager device.
+
+Example:
+
+	hps_0_fpgamgr: fpgamgr@0xff706000 {
+		compatible = "altr,socfpga-fpga-mgr";
+		reg = <0xFF706000 0x1000
+		       0xFFB90000 0x1000>;
+		interrupts = <0 175 4>;
+	};
-- 
1.7.9.5
