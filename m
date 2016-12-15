From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree updates for 4.10
Date: Thu, 15 Dec 2016 08:51:13 -0600
Message-ID: <CAL_JsqLX-hppGY5+sj8PsVoV8KK05CzsiQVPfSS=AeEevxXmJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull. There's a trivial conflict in vendor-prefixes.txt. The
resolution is take both lines, but 'nvd' is also not sorted correctly
and it should come after 'nuvoton'.

Rob


The following changes since commit bc33b0ca11e3df467777a4fa7639ba488c9d4911:

  Linux 4.9-rc4 (2016-11-05 16:23:36 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.10

for you to fetch changes up to 61eb3a04f9789c5e4f7498a2f171b82a567cea6b:

  dt: pwm: bcm2835: fix typo in clocks property name (2016-12-09 15:37:58 -0600)

----------------------------------------------------------------
DeviceTree updates for 4.10:

- Add various vendor prefixes.

- Fix NUMA node handling when "numa=off" is passed on kernel command
  line.

- Coding style Clean-up of overlay handling code.

- DocBook fixes in DT platform driver code

- Altera SoCFPGA binding addtions for freeze bridge, arria10 FPGA
  manager and FPGA bridges.

- Couple of printk message fixes.

----------------------------------------------------------------
Alan Tull (3):
      ARM: socfpga: add bindings document for fpga bridge drivers
      ARM: socfpga: add bindings doc for arria10 fpga manager
      add bindings document for altera freeze bridge

David Daney (1):
      of, numa: Return NUMA_NO_NODE from disable of_node_to_nid() if
nid not possible.

Dinh Nguyen (3):
      dt-bindings: Add Macnica Americas vendor prefix
      dt-bindings: Add vendor prefix for Terasic Inc.
      dt-bindings: Add vendor prefix for Samtec

Fabio Estevam (1):
      dt-bindings: Add vendor prefix for Udoo

Frank Rowand (12):
      of: Remove comments that state the obvious, to reduce clutter
      of: Remove excessive printks to reduce clutter.
      of: Convert comparisons to zero or NULL to logical expressions
      of: Rename functions to more accurately reflect what they do
      of: Remove prefix "__of_" from local function names
      of: Rename variables to better reflect purpose or follow convention
      of: Update structure of code to be clearer, also remove BUG_ON()
      of: Remove redundant size check
      of: Update comments to reflect changes and increase clarity
      of: Add back an error message, restructured
      of: Move setting of pointer to beside test for non-null
      of: Remove unused variable overlay_symbols

Geert Uytterhoeven (2):
      dt/bindings: arm-boards: Remove skeleton.dtsi inclusion from example
      devicetree: bindings: Add vendor prefix for Oki

Greentime Hu (1):
      devicetree: bindings: Add vendor prefix for Andes Technology Corporation

Johan Hovold (2):
      of/platform: fix of_platform_device_destroy comment
      of/platform: clarify of_find_device_by_node refcounting

Marcin Nowakowski (1):
      drivers/of: fix missing pr_cont()s in of_print_phandle_args

Marek Vasut (1):
      of: Add vendor prefix for Aries Embedded GmbH

Moritz Fischer (1):
      of: Fix issue where code would fall through to error case.

Nathan Sullivan (1):
      devicetree: add vendor prefix for National Instruments

Rob Herring (1):
      Revert "of: base: add support to get machine model name"

Sudeep Holla (1):
      of: base: add support to get machine model name

Vladimir Zapolskiy (2):
      dt-bindings: add MYIR Tech hardware vendor prefix
      dt: pwm: bcm2835: fix typo in clocks property name

 Documentation/devicetree/bindings/arm/arm-boards   |   3 +-
 .../bindings/fpga/altera-fpga2sdram-bridge.txt     |  16 +
 .../bindings/fpga/altera-freeze-bridge.txt         |  23 ++
 .../bindings/fpga/altera-hps2fpga-bridge.txt       |  39 +++
 .../bindings/fpga/altera-socfpga-a10-fpga-mgr.txt  |  19 ++
 .../devicetree/bindings/pwm/pwm-bcm2835.txt        |   2 +-
 .../devicetree/bindings/vendor-prefixes.txt        |   9 +
 drivers/of/base.c                                  |   9 +-
 drivers/of/of_numa.c                               |   7 +-
 drivers/of/platform.c                              |   6 +-
 drivers/of/resolver.c                              | 358 +++++++++------------
 11 files changed, 277 insertions(+), 214 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
 create mode 100644
Documentation/devicetree/bindings/fpga/altera-freeze-bridge.txt
 create mode 100644
Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
 create mode 100644
Documentation/devicetree/bindings/fpga/altera-socfpga-a10-fpga-mgr.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
