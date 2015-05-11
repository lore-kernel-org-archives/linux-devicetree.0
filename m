From: NeilBrown <neil@brown.name>
Subject: [PATCH 0/4] UART slave device support - version 4
Date: Mon, 11 May 2015 11:56:14 +1000
Message-ID: <20150511013540.5709.93626.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robherring2@gmail.com>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>
Cc: GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all,
 here is version 4 of my "UART slave device" patch set, previously
 known as "tty slave devices".

 The most obvious change is the name.  I realized that this isn't
 really about "tty"s at all - it is about UARTs.

 When a device is connected to a UART via RS-232 (or similar), there
 is a DTR line that can be used for power management, and other "modem
 control" lines.

 On an embedded board, it is very likely that there is no "DTR", and
 any power management need to be done using some completely separate
 mechanism.

 So these "slaves" are really just for devices permanently attached to
 UARTs without a full "RS-232" (or similar) connection.  The driver
 does all the extra control beyond Tx/Rx.

 The core serial code now "initializes" the "tty device" but may not
 "add" it.
 If it successfully finds a slave device, it gives the tty device to
 the slave.  If not, it calls "device_add()" itself.

 The slave device is responsible for adding the tty device when it is
 ready.

 There are two things that I'm not entirely happy with.

 Firstly there is the "uart_slave_activate()" call in tty_init_dev().
 Possibly this belongs more in tty_driver_install_tty(), but it is a
 bit out-off-place in either.
 To make it really clean I think I would need to create my own
 "tty_driver" which mirrors the one supplied by the uart but has a
 few little modification.  But that seems like a lot of clumsy work
 for very little gain.

 Secondly, between the creation of the slave device and the binding of
 a driver to it I'm holding an extra reference to the "tty_driver".
 This is to prevent calls to destruct_tty_driver().
 destruct_tty_driver() will unregister all the tty devices.
 But it cannot get at the uart_slave devices.
 I'm not at all sure I have the device unregistering side of things
 right.  As I was writing the code I imagined that I could arrange it
 so that then the tty was unregistered, that would drop the last ref
 on the slave and it would go away... I don't think that is right
 after all.  So that bit needs more work.

 Should the slave devices only be removed when the "uart_slave_core"
 modules is removed?

 And I'd very much like comment on the changed to be uart-based
 rather than tty-based.

 I've tested this set and it seems to work ... except that something
 is sadly broken with bluetooth support in 4.1-rc1 so I've only really
 tested the GPS driver.  I guess it is time to rebase to -rc3.


Thanks,
NeilBrown

---

NeilBrown (4):
      TTY: use class_find_device to find port in uart_suspend/resume.
      TTY: split tty_register_device_attr into 'initialize' and 'add' parts.
      TTY: add support for uart_slave devices.
      tty/slaves: add a driver to power on/off UART attached devices.


 .../bindings/uart_slave/wi2wi,w2cbw003.txt         |   19 +
 .../bindings/uart_slave/wi2wi,w2sg0004.txt         |   37 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 
 drivers/tty/serial/Kconfig                         |    1 
 drivers/tty/serial/Makefile                        |    2 
 drivers/tty/serial/serial_core.c                   |   30 +
 drivers/tty/serial/slave/Kconfig                   |   21 +
 drivers/tty/serial/slave/Makefile                  |    3 
 drivers/tty/serial/slave/serial-power-manager.c    |  510 ++++++++++++++++++++
 drivers/tty/serial/slave/uart_slave_core.c         |  168 +++++++
 drivers/tty/tty_io.c                               |  111 +++-
 drivers/tty/tty_port.c                             |   24 +
 include/linux/tty.h                                |   10 
 include/linux/uart_slave.h                         |   29 +
 14 files changed, 918 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/uart_slave/wi2wi,w2cbw003.txt
 create mode 100644 Documentation/devicetree/bindings/uart_slave/wi2wi,w2sg0004.txt
 create mode 100644 drivers/tty/serial/slave/Kconfig
 create mode 100644 drivers/tty/serial/slave/Makefile
 create mode 100644 drivers/tty/serial/slave/serial-power-manager.c
 create mode 100644 drivers/tty/serial/slave/uart_slave_core.c
 create mode 100644 include/linux/uart_slave.h

--
Signature
