Return-Path: <SRS0=0JaT=O6=martin.sperl.org=kernel@kernel.org>
From: kernel@martin.sperl.org
Subject: [PATCH V5 0/4] Microchip mcp25xxfd can controller driver
Date: Fri, 21 Dec 2018 09:29:46 +0000
Message-Id: <20181221092950.14192-1-kernel@martin.sperl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: linux-can@vger.kernel.org, devicetree@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, Mark Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Martin Sperl <kernel@martin.sperl.org>, Sukkin Pang <skp@skpang.co.uk>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, Wilhelm Leichtfried <Wilhelm.Leichtfried@microchip.com>, Thomas Kopp <Thomas.Kopp@microchip.com>, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Brad Hanson <Brad.Hanson@arity.com>, Teemu Keskinarkaus <teemu.keskinarkaus@crosscontrol.com>
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

The driver has not been heavily optimized yet so there are a few
"low hanging fruit" that have been left out from earlier versions
of the patch set for sake of simplicity.

These optimizations shall be added as extra patches in a later cycle.

Still the driver is able to handle reception of 99.95% of all CAN frames
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

The driver also allows to use the INT pins as GPIOs.
It also exposes lots of internal data/statistics via debugfs.

On the HW side some errata related to SRAM access have been found
during the development of the patchsets. Since then an errata for
the controller has been shared by microchip.
All of mitigations that we could think (including the use of SPI-CRC
transfers) or special ordering of transfers are not effective in avoiding
the SERR issue. That is why we are only able to reach 99.95% rate, because
when this issue occurres then there is the need to reconfigure the
controller and that takes some time which can not get used to process
frames. Fortunately this only happens on highly congested systems, but it
is more likely to occur on low end systems.

Version 5 of the patchset is a big reorganization of the patchset
into different components (basic controller management, GPIO and CAN)
and has split out each of those compüonents/functions into separate
source files for the sake of readability.

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

Martin Sperl (4):
  dt-binding: can: mcp25xxfd: document device tree bindings
  can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD driver basics
  can: mcp25xxfd: add gpiolib support for GPIO0/1 (aka. INT0/INT1)
  can: mcp25xxfd: Add Microchip mcp25xxfd CAN FD driver

 .../bindings/net/can/microchip,mcp25xxfd.txt       |   32 +
 drivers/net/can/spi/Kconfig                        |    2 +
 drivers/net/can/spi/Makefile                       |    2 +
 drivers/net/can/spi/mcp25xxfd/Kconfig              |    5 +
 drivers/net/can/spi/mcp25xxfd/Makefile             |   11 +
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h          |  279 +++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c     | 1204 ++++++++++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c      |  803 +++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h      |  760 ++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c |  479 ++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c  |  723 ++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c   |  208 ++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c   |  824 ++++++++++++++
 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c     |  199 ++++
 14 files changed, 5531 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.txt
 create mode 100644 drivers/net/can/spi/mcp25xxfd/Kconfig
 create mode 100644 drivers/net/can/spi/mcp25xxfd/Makefile
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_base.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can.h
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_fifo.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_int.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_rx.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_can_tx.c
 create mode 100644 drivers/net/can/spi/mcp25xxfd/mcp25xxfd_gpio.c

--
2.11.0
