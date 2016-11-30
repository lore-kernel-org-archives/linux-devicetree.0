From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/3] Altera Cyclone Passive Serial SPI FPGA Manager
Date: Tue, 29 Nov 2016 17:11:02 -0800
Message-ID: <cover.1480467185.git.stillcompiling@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds an FPGA manager for Altera cyclone FPGAs
that can program them using an spi port and a couple of gpios, using
Alteras passive serial protocol.

Changes from v2:

- Merged patch 3 and 4 as suggested in review by Moritz Fischer
- Changed FPGA_MIN_DELAY from 250 to 50 ms is the time advertized by
  Altera. This now works, as we don't assume it is done

Changes from v1:
- Changed the name from cyclone-spi-fpga-mgr to cyclone-ps-spi-fpga-mgr
  This name change was requested by Alan Tull, to be specific about which
  programming method is being employed on the fpga.
- Changed the name of the reset-gpio to config-gpio to closer match the
  way the pins are described in the Altera manual
- Moved MODULE_LICENCE, _AUTHOR, and _DESCRIPTION to the bottom

- Added a bitrev8x4() function to the bitrev headers and implemented ARM
 const, runtime, and ARM specific faster versions (This may end up
 needing to be a standalone patch)

- Moved the bitswapping into cyclonespi_write(), as requested.
  This falls short of my desired generic lsb first spi support, but is a step
  in that direction.

- Fixed whitespace problems introduced during refactoring

- Replaced magic number for initial delay with a descriptive macro
- Poll the fpga to see when it is ready rather than a fixed 1 ms sleep

Joshua Clayton (3):
  lib: add bitrev8x4()
  doc: dt: add cyclone-spi binding document
  fpga manager: Add cyclone-ps-spi driver for Altera FPGAs

 .../bindings/fpga/cyclone-ps-spi-fpga-mgr.txt      |  23 +++
 arch/arm/include/asm/bitrev.h                      |   5 +
 drivers/fpga/Kconfig                               |   7 +
 drivers/fpga/Makefile                              |   1 +
 drivers/fpga/cyclone-ps-spi.c                      | 176 +++++++++++++++++++++
 include/linux/bitrev.h                             |  26 +++
 6 files changed, 238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt
 create mode 100644 drivers/fpga/cyclone-ps-spi.c

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
