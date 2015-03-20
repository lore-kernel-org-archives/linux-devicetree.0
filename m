From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Gta04-owner] [PATCH 0/3] tty slave device support - version 3.
Date: Fri, 20 Mar 2015 08:54:35 +0100
Message-ID: <80D7E742-4633-4CCD-B754-221387D82922@goldelico.com>
References: <20150318055437.21025.13990.stgit@notabene.brown>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150318055437.21025.13990.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Belisko Marek <marek.belisko@gmail.com>, List for communicating with real GTA04 owners <gta04-owner@goldelico.com>
List-Id: devicetree@vger.kernel.org

Hi Neil,

Am 18.03.2015 um 06:58 schrieb NeilBrown <neil@brown.name>:

> Hi again,
> here is version 3 of support for tty-slaves.
>=20
> This version introduces a new bus-type for tty-slaves,

Hm. I am still not convinced that a tty is a =84bus=93 and=20
that this is a solution for a wide-spread problem.

> and causes
> a tty-slave device to appear in /sys/devices between the uart and the
> tty.
> It effectively intercepts and calls from the tty to the uart (i.e. an=
y
> tty_operations) and applies extra functionality at that point.

>=20
> Currently the only driver intercepts open and close.
> It powers on the device on open, and powers off at last-close.

That is what the missing piece in Linux is to make the w2sg0004
chip work.

>=20
> Power can be controlled by a regulator or by toggling a GPIO.

I think such a GPIO logic has nothing to do with serial and
should be left over to the regulator logic, i.e. we need a special
regulator-w2sg0004 driver.

So I suggest to remove the GPIO logic from your=20

drivers/tty/slave/serial-power-manager.c

And then you can even get rid of adding a chip specific =84compatible=93
entry for the subnodes.

>=20
> I think I've incorporated most of the feed back I received from
> previous versions, but if I missed something - I apologize.  If
> this approach is structurally acceptable then I can fix up all the
> smaller issues.

As said I would prefer that the w2sg0004 driver is just a separate
=84regulator=93 driver as we had proposed before.

Nikolaus



>=20
> Thanks for your review,
> NeilBrown
>=20
>=20
> ---
>=20
> NeilBrown (3):
>      TTY: use class_find_device to find port in uart_suspend/resume.
>      TTY: add support for tty_slave devices.
>      tty/slaves: add a driver to power on/off UART attached devices.
>=20
>=20
> .../bindings/tty_slave/wi2wi,w2cbw003.txt          |   19 +
> .../bindings/tty_slave/wi2wi,w2sg0004.txt          |   37 +
> .../devicetree/bindings/vendor-prefixes.txt        |    1=20
> drivers/tty/Kconfig                                |    1=20
> drivers/tty/Makefile                               |    1=20
> drivers/tty/serial/serial_core.c                   |   21 -
> drivers/tty/slave/Kconfig                          |   21 +
> drivers/tty/slave/Makefile                         |    4=20
> drivers/tty/slave/serial-power-manager.c           |  510 +++++++++++=
+++++++++
> drivers/tty/slave/tty_slave_core.c                 |  136 +++++
> drivers/tty/tty_io.c                               |   60 ++
> include/linux/tty.h                                |    2=20
> include/linux/tty_slave.h                          |   26 +
> 13 files changed, 813 insertions(+), 26 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/tty_slave/wi2wi,=
w2cbw003.txt
> create mode 100644 Documentation/devicetree/bindings/tty_slave/wi2wi,=
w2sg0004.txt
> create mode 100644 drivers/tty/slave/Kconfig
> create mode 100644 drivers/tty/slave/Makefile
> create mode 100644 drivers/tty/slave/serial-power-manager.c
> create mode 100644 drivers/tty/slave/tty_slave_core.c
> create mode 100644 include/linux/tty_slave.h
>=20
> --
> Signature
>=20
> _______________________________________________
> Gta04-owner mailing list
> Gta04-owner@goldelico.com
> http://lists.goldelico.com/mailman/listinfo.cgi/gta04-owner
