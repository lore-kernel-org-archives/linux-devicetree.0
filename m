From: NeilBrown <neil@brown.name>
Subject: [PATCH 0/3] tty slave device support - version 3.
Date: Wed, 18 Mar 2015 16:58:31 +1100
Message-ID: <20150318055437.21025.13990.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>
Cc: GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi again,
 here is version 3 of support for tty-slaves.

 This version introduces a new bus-type for tty-slaves, and causes
 a tty-slave device to appear in /sys/devices between the uart and the
 tty.
 It effectively intercepts and calls from the tty to the uart (i.e. any
 tty_operations) and applies extra functionality at that point.

 Currently the only driver intercepts open and close.
 It powers on the device on open, and powers off at last-close.

 Power can be controlled by a regulator or by toggling a GPIO.

 I think I've incorporated most of the feed back I received from
 previous versions, but if I missed something - I apologize.  If
 this approach is structurally acceptable then I can fix up all the
 smaller issues.

Thanks for your review,
NeilBrown


---

NeilBrown (3):
      TTY: use class_find_device to find port in uart_suspend/resume.
      TTY: add support for tty_slave devices.
      tty/slaves: add a driver to power on/off UART attached devices.


 .../bindings/tty_slave/wi2wi,w2cbw003.txt          |   19 +
 .../bindings/tty_slave/wi2wi,w2sg0004.txt          |   37 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 
 drivers/tty/Kconfig                                |    1 
 drivers/tty/Makefile                               |    1 
 drivers/tty/serial/serial_core.c                   |   21 -
 drivers/tty/slave/Kconfig                          |   21 +
 drivers/tty/slave/Makefile                         |    4 
 drivers/tty/slave/serial-power-manager.c           |  510 ++++++++++++++++++++
 drivers/tty/slave/tty_slave_core.c                 |  136 +++++
 drivers/tty/tty_io.c                               |   60 ++
 include/linux/tty.h                                |    2 
 include/linux/tty_slave.h                          |   26 +
 13 files changed, 813 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/tty_slave/wi2wi,w2cbw003.txt
 create mode 100644 Documentation/devicetree/bindings/tty_slave/wi2wi,w2sg0004.txt
 create mode 100644 drivers/tty/slave/Kconfig
 create mode 100644 drivers/tty/slave/Makefile
 create mode 100644 drivers/tty/slave/serial-power-manager.c
 create mode 100644 drivers/tty/slave/tty_slave_core.c
 create mode 100644 include/linux/tty_slave.h

--
Signature
