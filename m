From: Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v5 0/3] Altera Cyclone Passive Serial SPI FPGA Manager
Date: Wed,  7 Dec 2016 13:04:37 -0800
Message-ID: <cover.1481139171.git.stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alan Tull <atull@opensource.altera.com>, Moritz Fischer <moritz.fischer@ettus.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, Joshua Clayton <stillcompiling@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Anatolij Gustschin <agust@denx.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series adds an FPGA manager for Altera cyclone FPGAs
that can program them using an spi port and a couple of gpios, using
Alteras passive serial protocol.

Still need an ACK from Russell King on the ARM specific portion of 
patch 1. Any comment/criticism on the addition of bitrev8x4() to bitrev.h
would be welcome as well.

Changes from v4:
- Added the needed return statement to __arch_bitrev8x4()
- Added Rob Herrings ACK for and fix a typo in the commit log of patch 2

Changes from v3:
- Fixed up the state() function to return the state of the status pin
  reqested by Alan Tull
- Switched the pin to ACTIVE_LOW and coresponding logic level, and updated
  the corresponding documentation. Thanks Rob Herring for pointing out my
  mistake.
- Per Rob Herring, switched from "gpio" to "gpios" in dts

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
  doc: dt: add cyclone-ps-spi binding document
  fpga manager: Add cyclone-ps-spi driver for Altera FPGAs

 .../bindings/fpga/cyclone-ps-spi-fpga-mgr.txt      |  25 +++
 arch/arm/include/asm/bitrev.h                      |   6 +
 drivers/fpga/Kconfig                               |   7 +
 drivers/fpga/Makefile                              |   1 +
 drivers/fpga/cyclone-ps-spi.c                      | 181 +++++++++++++++++++++
 include/linux/bitrev.h                             |  26 +++
 6 files changed, 246 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/cyclone-ps-spi-fpga-mgr.txt
 create mode 100644 drivers/fpga/cyclone-ps-spi.c

-- 
2.9.3
