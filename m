Return-Path: <atull@kernel.org>
From: atull@opensource.altera.com
Subject: [PATCH v11 2/4] fpga manager: add sysfs interface document
Date: Wed,  7 Oct 2015 16:36:27 +0100
Message-Id: <1444232189-5762-3-git-send-email-atull@opensource.altera.com>
In-Reply-To: <1444232189-5762-1-git-send-email-atull@opensource.altera.com>
References: <1444232189-5762-1-git-send-email-atull@opensource.altera.com>
To: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, Alan Tull <atull@opensource.altera.com>
List-ID: <devicetree@vger.kernel.org>

From: Alan Tull <atull@opensource.altera.com>

Add documentation under drivers/staging for new fpga manager's
sysfs interface.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
v5  : (actually second version, but keeping version numbers
      aligned with rest of patch series)
      Move document to drivers/staging/fpga/Documentation/ABI

v6  : No change in this patch for v6 of the patch set
v7  : No change in this patch for v7 of the patch set
v8  : No change in this patch for v8 of the patch set

v9  : Remove 'firmware' and 'reset' files
      Update state strings

v10 : Clarifications about state attribute
      Move to Documentation/ABI/testing/

v11 : No change in this patch for v11 of the patch set
---
 Documentation/ABI/testing/sysfs-class-fpga-manager |   37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-manager

diff --git a/Documentation/ABI/testing/sysfs-class-fpga-manager b/Documentation/ABI/testing/sysfs-class-fpga-manager
new file mode 100644
index 0000000..23056c5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-fpga-manager
@@ -0,0 +1,37 @@
+What:		/sys/class/fpga_manager/<fpga>/name
+Date:		August 2015
+KernelVersion:	4.3
+Contact:	Alan Tull <atull@opensource.altera.com>
+Description:	Name of low level fpga manager driver.
+
+What:		/sys/class/fpga_manager/<fpga>/state
+Date:		August 2015
+KernelVersion:	4.3
+Contact:	Alan Tull <atull@opensource.altera.com>
+Description:	Read fpga manager state as a string.
+		The intent is to provide enough detail that if something goes
+		wrong during FPGA programming (something that the driver can't
+		fix) then userspace can know, i.e. if the firmware request
+		fails, that could be due to not being able to find the firmware
+		file.
+
+		This is a superset of FPGA states and fpga manager driver
+		states.  The fpga manager driver is walking through these steps
+		to get the FPGA into a known operating state.  It's a sequence,
+		though some steps may get skipped.  Valid FPGA states will vary
+		by manufacturer; this is a superset.
+
+		* unknown		= can't determine state
+		* power off		= FPGA power is off
+		* power up		= FPGA reports power is up
+		* reset			= FPGA held in reset state
+		* firmware request	= firmware class request in progress
+		* firmware request error = firmware request failed
+		* write init		= preparing FPGA for programming
+		* write init error	= Error while preparing FPGA for
+					  programming
+		* write			= FPGA ready to receive image data
+		* write error		= Error while programming
+		* write complete	= Doing post programming steps
+		* write complete error	= Error while doing post programming
+		* operating		= FPGA is programmed and operating
-- 
1.7.9.5
