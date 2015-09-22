From: <atull@opensource.altera.com>
Subject: [PATCH v11 0/4] FPGA Manager Framework
Date: Tue, 22 Sep 2015 10:21:07 -0500
Message-ID: <1442935271-10375-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
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

This patch set adds the FPGA manager core which exports API functions that
write an image to a FPGA

I'm holding off on the DT overlay support a little for now.

The core's API is minimal to start with: only 6 functions.  This gives a
manufacturer-agnostic interface for programming FPGA's such that higher
level interfaces (such as DT Overlays) can be shared.

Alan Tull (4):
  usage documentation for FPGA manager core
  fpga manager: add sysfs interface document
  add FPGA manager core
  fpga manager: add driver for socfpga fpga manager

 Documentation/ABI/testing/sysfs-class-fpga-manager |   37 ++
 Documentation/fpga/fpga-mgr.txt                    |  171 ++++++
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/fpga/Kconfig                               |   24 +
 drivers/fpga/Makefile                              |    9 +
 drivers/fpga/fpga-mgr.c                            |  382 ++++++++++++
 drivers/fpga/socfpga.c                             |  616 ++++++++++++++++++++
 include/linux/fpga/fpga-mgr.h                      |  127 ++++
 9 files changed, 1369 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-manager
 create mode 100644 Documentation/fpga/fpga-mgr.txt
 create mode 100644 drivers/fpga/Kconfig
 create mode 100644 drivers/fpga/Makefile
 create mode 100644 drivers/fpga/fpga-mgr.c
 create mode 100644 drivers/fpga/socfpga.c
 create mode 100644 include/linux/fpga/fpga-mgr.h

-- 
1.7.9.5
