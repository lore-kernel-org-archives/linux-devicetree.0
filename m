From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 0/7] Introduce PTX1K Boot FPGA driver
Date: Fri,  7 Oct 2016 18:21:57 +0300
Message-ID: <1475853724-22557-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org, Georgi Vlaev <gvlaev@juniper.net>, Frank Rowand <frowand.list@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-kernel@vger.kernel.org, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Wim Van Sebroeck <wim@iguana.be>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

Add Juniper's PTX1K Boot FPGA driver. Those FPGAs
are present in Juniper's PTX series of routers.

The MFD driver provices watchdog/mtd/hwmon devices.

There are full device tree binding documents for the
master mfd driver and for the slave driver.

This patchset is against mainline as of today: v4.8-9431-g3477d16
and is dependent on the "Juniper prerequisites" and
"Juniper infrastructure" patchsets sent earlier.

Georgi Vlaev (7):
  mfd: Add PTX1K I2CS BootFPGA MFD driver
  mfd: dt-bindings: Add bindings for the Juniper PTX1K Boot FPGA
  watchdog: Add PTX1K I2CS BootFPGA watchdog driver.
  watchdog: ptx1kbf-wdt: Add ptx1kbf device tree bindings
  mtd: ptx1kbf: Add PTX1K BootFPGA MTD driver
  mtd: ptx1kbf: Bindings for Juniper's PTX1K Boot FPGA
  hwmon: ptx1kbf: Add PTX1K I2CS BootFPGA sensor driver

 .../devicetree/bindings/mfd/jnx-ptx1k-bootfpga.txt |  34 ++
 .../devicetree/bindings/mtd/ptx1kbf-mtd.txt        |  23 +
 .../bindings/watchdog/jnx-ptx1kbf-wdt.txt          |  17 +
 drivers/hwmon/Kconfig                              |  17 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/jnx_ptx1kbf_hwmon.c                  | 123 ++++
 drivers/mfd/Kconfig                                |  11 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ptx1k-bootfpga.c                       | 462 ++++++++++++++
 drivers/mtd/devices/Kconfig                        |  10 +
 drivers/mtd/devices/Makefile                       |   1 +
 drivers/mtd/devices/jnx_ptx1kbf_mtd.c              | 677 +++++++++++++++++++++
 drivers/watchdog/Kconfig                           |  15 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/jnx_ptx1kbf_wdt.c                 | 229 +++++++
 include/linux/mfd/ptx1k-bootfpga.h                 |  93 +++
 16 files changed, 1715 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/jnx-ptx1k-bootfpga.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ptx1kbf-mtd.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/jnx-ptx1kbf-wdt.txt
 create mode 100644 drivers/hwmon/jnx_ptx1kbf_hwmon.c
 create mode 100644 drivers/mfd/ptx1k-bootfpga.c
 create mode 100644 drivers/mtd/devices/jnx_ptx1kbf_mtd.c
 create mode 100644 drivers/watchdog/jnx_ptx1kbf_wdt.c
 create mode 100644 include/linux/mfd/ptx1k-bootfpga.h

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
