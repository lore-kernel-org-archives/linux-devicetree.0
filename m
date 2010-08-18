From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 00/14] Versatile Express device tree port
Date: Wed, 18 Aug 2010 19:59:46 +0100
Message-ID: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset provides an initial version of device tree enabled kernel on
an ARM Versatile Express board. The patchset applies to Jeremy Kerr's tree:

	git://kernel.ubuntu.com/jk/dt/linux-2.6.git dtbimage
	commit: 4cb80ac96489220554d28f6fde527aeef83e628b

The patched kernel version is available on my public ARM git tree:

	git://linux-arm.org/linux-2.6-lp.git ve-fdt

It has been tested on HW ARM Versatile Express board, with both static and DT 
configurations.

It contains fixes for generic device tree features and clock configuration,
code to patch Versatile Express peripherals drivers and build system.

Clock names as well as amba device names are temporary waiting for OF bindings
definition (clocks).
The Versatile Express board specific init code has been split into DT and 
non-DT code in order to factor out common code between the two configs. 

A static inline function has been added to the platform bus in order 
to initialize the OF match table and avoid cluttering code with preprocessor
macros.

Drivers ( and GIC, sp804, PL310 specific code) device tree init is an initial
stab at configuring peripherals with device tree data, so some choices 
especially concerning error codes are arguable and require thorough review.

The whole patchset is a request for comments on code and methodology. 

Cheers.

Lorenzo Pieralisi (14):
  ARM: amba device memory allocation fix
  ARM: vexpress: fix clocks definition to comply with new framework
  ARM: fix add instruction to set the flags
  ARM: r1 DT mach id init
  ARM: vexpress: fix typo in addruart
  platform: add function to initialize OF match table
  drivers/smsc911x: add DT support
  ARM: versatile-i2c driver DT port
  ARM: ARM flash driver DT port
  drivers/USB: isp1760 DT platform parsing and binding
  ARM: PMU: add device tree probing
  ARM: vexpress: add board support for DT probing
  ARM: vexpress: Definition of vexpress dts specification
  ARM: vexpress: add device tree build system and dtbuImage

 arch/arm/Kconfig                                  |    4 +-
 arch/arm/Makefile                                 |    2 +-
 arch/arm/boot/Makefile                            |   10 +-
 arch/arm/boot/dt/dtb.S                            |    3 +
 arch/arm/boot/dts/vexpress.dts                    |  199 +++++++++++++++++++++
 arch/arm/include/asm/pmu.h                        |    6 +
 arch/arm/kernel/Makefile                          |    3 +-
 arch/arm/kernel/head.S                            |    2 +-
 arch/arm/kernel/pmu-of.c                          |   30 +++
 arch/arm/kernel/pmu.c                             |   18 ++-
 arch/arm/mach-vexpress/Kconfig                    |    7 +
 arch/arm/mach-vexpress/Makefile                   |    5 +-
 arch/arm/mach-vexpress/core.h                     |   15 ++-
 arch/arm/mach-vexpress/ct-ca9x4-base.c            |  108 +++++++++++
 arch/arm/mach-vexpress/ct-ca9x4-of.c              |  192 ++++++++++++++++++++
 arch/arm/mach-vexpress/ct-ca9x4.c                 |   93 ----------
 arch/arm/mach-vexpress/include/mach/clkdev.h      |    2 +-
 arch/arm/mach-vexpress/include/mach/ct-ca9x4.h    |    2 +
 arch/arm/mach-vexpress/include/mach/debug-macro.S |    2 +-
 arch/arm/mach-vexpress/v2m-base.c                 |  197 ++++++++++++++++++++
 arch/arm/mach-vexpress/v2m-of.c                   |   94 ++++++++++
 arch/arm/mach-vexpress/v2m.c                      |  167 +-----------------
 arch/arm/mm/Kconfig                               |    2 +-
 drivers/amba/bus.c                                |    2 +-
 drivers/i2c/busses/i2c-versatile.c                |    6 +
 drivers/mtd/maps/integrator-flash.c               |    6 +
 drivers/net/Makefile                              |    3 +-
 drivers/net/smsc911x-of.c                         |   53 ++++++
 drivers/net/smsc911x.c                            |   28 ++-
 drivers/net/smsc911x.h                            |    8 +
 drivers/usb/host/Makefile                         |    4 +-
 drivers/usb/host/isp1760-hcd.h                    |    7 +
 drivers/usb/host/isp1760-if.c                     |   43 +++--
 drivers/usb/host/isp1760-of.c                     |   36 ++++
 include/linux/platform_device.h                   |   11 ++
 35 files changed, 1067 insertions(+), 303 deletions(-)
 create mode 100644 arch/arm/boot/dts/vexpress.dts
 create mode 100644 arch/arm/kernel/pmu-of.c
 create mode 100644 arch/arm/mach-vexpress/ct-ca9x4-base.c
 create mode 100644 arch/arm/mach-vexpress/ct-ca9x4-of.c
 create mode 100644 arch/arm/mach-vexpress/v2m-base.c
 create mode 100644 arch/arm/mach-vexpress/v2m-of.c
 create mode 100644 drivers/net/smsc911x-of.c
 create mode 100644 drivers/usb/host/isp1760-of.c
