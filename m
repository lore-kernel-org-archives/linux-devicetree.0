Return-Path: <SRS0=whS5=QY=martin.sperl.org=kernel@kernel.org>
From: kernel@martin.sperl.org
Subject: [PATCH V6 0/9] Microchip mcp25xxfd can controller driver
Date: Sun, 17 Feb 2019 11:01:53 +0000
Message-Id: <20190217110202.31986-1-kernel@martin.sperl.org>
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Martin Sperl <kernel@martin.sperl.org>
List-ID: <devicetree@vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

This patchset adds a driver for the mcp25xxfd CanFD controller.

Most of the features of the controller are supported by this driver
release.

The controller includes a few features that the current core Can(FD)
implementation does not support: * Transmit Bandwidth Sharing bits
  - this waits for a configurable number of syncronization bits before
    atempting to transmit the next frame - for the moment controllable
    via a module parameter
* SID11 with CanFD frames
  - at this moment not supported by driver
* 3 transmit attempts in addition to ONE_SHOT
* transmitter delay compensation configurations
* micro second exact transmission and reception timestamps
  - used internally by driver
* variable number of tx-fifos
  - exposed via module parameter at this moment

The driver driver has been split into several patches - first just
initial setup of each section and then driver optimization patches.

As requested the driver has now also been split out into smaller
files for individual components of the driver - in the hope that this
has not been producing regressions...

The driver is able to handle reception of 99.95% of all CAN frames
of a 100% saturated 1MHz Can2.0 Bus with Frames with standard IDs and
DLC=0 on a Raspberry Pi 3. Note that this statistics is without injection
into the network stack, which then drops about 60% of all frames.

At this time the SPI bus is utilized 75% (when counting CS asserted)
and 60% from a SPI-Clock perspective.

On the Rasberry pi 3 in such a situation we are using 100% of one
CPU for the interrupt thread (as the spi driver is using polling for
short transfers) and this has exposed a performance inefficiency in the
spi framework that shows as the the spi-worker thread also consuming
CPU cycles (30% of one CPU in this test case) unnecessarily.

The driver also allows to use the INT0/1 pins as GPIOs.
Lots of internal data/statistics is exposed via debugfs.

On the HW side some errata related to SRAM access have been found
during the development of the patchsets. Since then an errata for
the controller has been shared by microchip.

At this very moment there is no 100% mitigation for this (besides
a newer version of the silicon).
The only instance where this is probably not an issue is when using
a SPI bus driver that reliably deasserts CS in the "requested"
time-frame of a few Can clock cycles.

When the spi-bus-driver is using GPIO-CS (which is nowadays the preferred
implementation of spi-bus-drivers) then we have to rely on
interrupt and interrupt worker thread scheduling latencies to be fast
enough to fullfill the requirements of the mcp2517fd of SCK stop to
CS-deassert. To achive this a faster CPU is needed and preferably more
cores.

A lot of possible mitigations have been investigated (Fifo ordering in
SRAM, the use of CRC SPI commands,...), but none have been successful.
That is why we are only able to reach 99.95% rate, because
when this issue occurres then there is the need to reconfigure the
controller and that takes some time which can not get used to process
frames. Fortunately this only happens on highly congested systems, but it
is more likely to occur on low end systems.

So as an example almost everything related to can-transmission can get
found in mcp25xxfd_can_tx.c. mcp25xxfd_can_rx.c is responsible for
can-reception and mcp25xxfd_can_int.c for interrupt handling.

This also reduces the size of the individual patches to below 128k
so that the linux-can mailing-list should accepts the patch.

Changelog:
  V1 -> V2: new more generic name based on feedback from microchip
            cleanup of code (checkpatch)
            address all feedback on code
            handle (HW) systemerrors in a much better/reliable way
            cleanup of dt custom properties removing (most) gpio
              related properties
            implemented GPIOLIB support as per feedback
  V2 -> V3: added vendor-prefix for gpio-opendrain to dt-binding
            added gpio-controller to dt-binding
	    added feedback by Rob Herring
	    waited for other feedback regarding the code
  V3 -> V4: resend
            Patch-1 (dt) added: Reviewed-by: Rob Herring <robh@kernel.org>
  V4 -> V5: reorganisation of the patchset into smaller patches
            review of the whole driver code for better modularization
  V5 -> V6: Major refactoring as per feedback from Wilhelm Grandegger
	    Fixing bugs reported by several other parties
            Split out of optimizations into separate patches

Martin Sperl (9):
  dt-binding: can: mcp25xxfd: document device tree bindings
  can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD driver basics
  can: mcp25xxfd: add gpiolib support for GPIO0/1 (aka. INT0/INT1)
  can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD driver
  can: mcp25xxfd: optimize TEF read avoiding unnecessary SPI transfers
  can: mcp25xxfd: optimize TEF reads reading multiple TEFs in one go
  can: mcp25xxfd: optimize SPI reads of FIFOs in can2.0 mode
  can: mcp25xxfd: add prediction of CanFD frames sizes based on history
  can: mcp25xxfd: optimize reception of big CanFD frame reception with
    BRS

 .../bindings/net/can/microchip,mcp25xxfd.txt       |  32 +
 drivers/net/can/spi/Kconfig                        |   2 +
 drivers/net/can/spi/Makefile                       |   2 +
 drivers/net/can/spi/mcp25xxfd/Kconfig              |   5 +
 drivers/net/can/spi/mcp25xxfd/Makefile             |  18 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c     | 281 ++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.h     |  14 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c      | 684 ++++++++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h      |  56 ++
 .../net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c  | 235 ++++++
 .../net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.h  |  44 ++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c | 347 +++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.h |  16 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_id.h   |  69 ++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c  | 705 ++++++++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.h  |  17 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h | 203 ++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c   | 521 ++++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.h   |  18 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c   | 794 +++++++++++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.h   |  86 +++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_clock.c    | 485 +++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_clock.h    |  28 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_cmd.c      | 312 ++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_cmd.h      |  84 +++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_crc.c      |  31 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_crc.h      |  15 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_debugfs.c  | 110 +++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_debugfs.h  |  30 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_ecc.c      |  75 ++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_ecc.h      |  16 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c     | 194 +++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.h     |  16 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_int.c      |  73 ++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_int.h      |  15 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h     |  83 +++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_regs.h     | 661 +++++++++++++++++
 37 files changed, 6377 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.txt
 create mode 100644 drivers/net/can/spi/mcp25xxfd/Kconfig
 create mode 100644 drivers/net/can/spi/mcp25xxfd/Makefile
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_debugfs.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_id.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_priv.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_clock.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_clock.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_cmd.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_cmd.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_crc.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_crc.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_debugfs.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_debugfs.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_ecc.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_ecc.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_int.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_int.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_priv.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_regs.h

--
2.11.0
