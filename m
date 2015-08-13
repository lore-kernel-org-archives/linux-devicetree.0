From: <atull@opensource.altera.com>
Subject: [PATCH v10 2/8] fpga manager: add sysfs interface document
Date: Thu, 13 Aug 2015 12:37:26 -0500
Message-ID: <1439487452-23977-4-git-send-email-atull@opensource.altera.com>
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
