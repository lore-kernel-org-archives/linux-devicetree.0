From: <atull@opensource.altera.com>
Subject: [PATCH v5 2/6] fpga manager: add sysfs interface document
Date: Wed, 17 Dec 2014 10:54:45 -0600
Message-ID: <1418835289-15752-3-git-send-email-atull@opensource.altera.com>
References: <1418835289-15752-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418835289-15752-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Add documentation under drivers/staging for new fpga manager's
sysfs interface.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v5  : (actually second version, but keeping version numbers
      aligned with rest of patch series)
      Move document to drivers/staging/fpga/Documentation/ABI
---
 .../Documentation/ABI/sysfs-class-fpga-manager     |   38 ++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager

diff --git a/drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager b/drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager
new file mode 100644
index 0000000..eb600f2
--- /dev/null
+++ b/drivers/staging/fpga/Documentation/ABI/sysfs-class-fpga-manager
@@ -0,0 +1,38 @@
+What:		/sys/class/fpga_manager/<fpga>/name
+Date:		October 2014
+KernelVersion:	3.18
+Contact:	Alan Tull <atull@opensource.altera.com>
+Description:	Name of low level driver.
+
+What:		/sys/class/fpga_manager/<fpga>/firmware
+Date:		October 2014
+KernelVersion:	3.18
+Contact:	Alan Tull <atull@opensource.altera.com>
+Description:	Name of the FPGA image file to load using firmware class.
+
+What:		/sys/class/fpga_manager/<fpga>/reset
+Date:		October 2014
+KernelVersion:	3.18
+Contact:	Alan Tull <atull@opensource.altera.com>
+Description:	Write 1 to reset the FPGA
+
+What:		/sys/class/fpga_manager/<fpga>/state
+Date:		October 2014
+KernelVersion:	3.18
+Contact:	Alan Tull <atull@opensource.altera.com>
+Description:	Read state of fpga framework state machine as a string.
+		Valid states may vary by manufacturer; superset is:
+		* unknown		= can't determine state
+		* power_off		= FPGA power is off
+		* power_up		= FPGA reports power is up
+		* reset			= FPGA held in reset state
+		* firmware_request	= firmware class request in progress
+		* firmware_request_err	= firmware request failed
+		* write_init		= FPGA being prepared for programming
+		* write_init_err	= Error while preparing FPGA for
+					  programming
+		* write			= FPGA ready to receive image data
+		* write_err		= Error while programming
+		* write_complete	= Doing post programming steps
+		* write_complete_err	= Error while doing post programming
+		* operating		= FPGA is programmed and operating
-- 
1.7.9.5
