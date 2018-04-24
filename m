From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Tue, 24 Apr 2018 18:34:51 +0200
Message-ID: <20180424163458.11947-1-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, "H . Nikolaus Schaller" <hns@goldelico.com>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

This series adds a new subsystem for GNSS receivers (e.g. GPS
receivers).

While GNSS receivers are typically accessed using a UART interface they
often also support other I/O interfaces such as I2C, SPI and USB, while
yet other devices use iomem or even some form of remote-processor
messaging (rpmsg).
    
The new GNSS subsystem abstracts the underlying interface and provides a
new "gnss" class type, which exposes a character-device interface (e.g.
/dev/gnss0) to user space. This allows GNSS receivers to have a
representation in the Linux device model, something which is important
not least for power management purposes and which also allows for easy
detection and (eventually) identification of GNSS devices.

Note that the character-device interface provides raw access to whatever
protocol the receiver is (currently) using, such as NMEA 0183, UBX or
SiRF Binary. These protocols are expected to be continued to be handled
by user space for the time being, even if some hybrid solutions are also
conceivable (e.g. to have kernel drivers issue management commands).

This will still allow for better platform integration by allowing GNSS
devices and their resources (e.g. regulators and enable-gpios) to be
described by firmware and managed by kernel drivers rather than
platform-specific scripts and services.
    
While the current interface is kept minimal, it could be extended using
IOCTLs, sysfs or uevents as needs and proper abstraction levels are
identified and determined (e.g. for device and feature identification).

Another possible extension is to add generic 1PPS support.

I decided to go with a custom character-device interface rather than
pretend that these abstract GNSS devices are still TTY devices (e.g.
/dev/ttyGNSS0). Obviously, modifying line settings or reading modem
control signals does not make any sense for a device using, say, a
USB (not USB-serial) or iomem interface. This also means, however, that
user space would no longer be able to set the line speed to match a new
port configuration that can be set using the various GNSS protocols when
the underlying interface is indeed a UART; instead this would need to be
taken care of by the driver.

Also note that writes are always synchronous instead of requiring user
space to call tcdrain() after every command.

This all seems to work well-enough (e.g. with gpsd), but please let me
know if I've overlooked something which would indeed require a TTY
interface instead.

As proof-of-concept I have implemented drivers for receivers based on
two common GNSS chipsets (SiRFstar and u-blox), but due to lack of
hardware these have so far only been tested using mockup devices and a
USB-serial-based GPS device (using out-of-tree code). [ Let me know if
you've got any evalutation kits to spare. ]

Finally, note that documentation (including kerneldoc) remains to be
written, but hopefully this will not hinder review given that the
current interfaces are fairly self-describing.

Johan


Johan Hovold (7):
  gnss: add GNSS receiver subsystem
  dt-bindings: add generic gnss binding
  gnss: add generic serial driver
  dt-bindings: gnss: add u-blox binding
  gnss: add driver for u-blox receivers
  dt-bindings: gnss: add sirfstar binding
  gnss: add driver for sirfstar-based receivers

 .../devicetree/bindings/gnss/gnss.txt         |  36 ++
 .../devicetree/bindings/gnss/sirfstar.txt     |  38 ++
 .../devicetree/bindings/gnss/u-blox.txt       |  31 ++
 .../devicetree/bindings/vendor-prefixes.txt   |   4 +
 MAINTAINERS                                   |   7 +
 drivers/Kconfig                               |   2 +
 drivers/Makefile                              |   1 +
 drivers/gnss/Kconfig                          |  43 ++
 drivers/gnss/Makefile                         |  16 +
 drivers/gnss/core.c                           | 385 ++++++++++++++++
 drivers/gnss/serial.c                         | 288 ++++++++++++
 drivers/gnss/serial.h                         |  47 ++
 drivers/gnss/sirf.c                           | 415 ++++++++++++++++++
 drivers/gnss/ubx.c                            | 133 ++++++
 include/linux/gnss.h                          |  64 +++
 15 files changed, 1510 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gnss/gnss.txt
 create mode 100644 Documentation/devicetree/bindings/gnss/sirfstar.txt
 create mode 100644 Documentation/devicetree/bindings/gnss/u-blox.txt
 create mode 100644 drivers/gnss/Kconfig
 create mode 100644 drivers/gnss/Makefile
 create mode 100644 drivers/gnss/core.c
 create mode 100644 drivers/gnss/serial.c
 create mode 100644 drivers/gnss/serial.h
 create mode 100644 drivers/gnss/sirf.c
 create mode 100644 drivers/gnss/ubx.c
 create mode 100644 include/linux/gnss.h

-- 
2.17.0
