From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 0/7] gnss: add new GNSS subsystem
Date: Tue, 24 Apr 2018 19:40:00 +0200
Message-ID: <31CF06C6-D6ED-4930-8D81-12256A518059@goldelico.com>
References: <20180424163458.11947-1-johan@kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424163458.11947-1-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Johan,

> Am 24.04.2018 um 18:34 schrieb Johan Hovold <johan@kernel.org>:
>=20
> This series adds a new subsystem for GNSS receivers (e.g. GPS
> receivers).

Great!

>=20
> While GNSS receivers are typically accessed using a UART interface =
they
> often also support other I/O interfaces such as I2C, SPI and USB, =
while
> yet other devices use iomem or even some form of remote-processor
> messaging (rpmsg).
>=20
> The new GNSS subsystem abstracts the underlying interface and provides =
a
> new "gnss" class type, which exposes a character-device interface =
(e.g.
> /dev/gnss0) to user space. This allows GNSS receivers to have a
> representation in the Linux device model, something which is important
> not least for power management purposes and which also allows for easy
> detection and (eventually) identification of GNSS devices.
>=20
> Note that the character-device interface provides raw access to =
whatever
> protocol the receiver is (currently) using, such as NMEA 0183, UBX or
> SiRF Binary. These protocols are expected to be continued to be =
handled
> by user space for the time being, even if some hybrid solutions are =
also
> conceivable (e.g. to have kernel drivers issue management commands).
>=20
> This will still allow for better platform integration by allowing GNSS
> devices and their resources (e.g. regulators and enable-gpios) to be
> described by firmware and managed by kernel drivers rather than
> platform-specific scripts and services.
>=20
> While the current interface is kept minimal, it could be extended =
using
> IOCTLs, sysfs or uevents as needs and proper abstraction levels are
> identified and determined (e.g. for device and feature =
identification).
>=20
> Another possible extension is to add generic 1PPS support.

would be nice but not first priority.

>=20
> I decided to go with a custom character-device interface rather than
> pretend that these abstract GNSS devices are still TTY devices (e.g.
> /dev/ttyGNSS0). Obviously, modifying line settings or reading modem
> control signals does not make any sense for a device using, say, a
> USB (not USB-serial) or iomem interface. This also means, however, =
that
> user space would no longer be able to set the line speed to match a =
new
> port configuration that can be set using the various GNSS protocols =
when
> the underlying interface is indeed a UART; instead this would need to =
be
> taken care of by the driver.
>=20
> Also note that writes are always synchronous instead of requiring user
> space to call tcdrain() after every command.
>=20
> This all seems to work well-enough (e.g. with gpsd), but please let me
> know if I've overlooked something which would indeed require a TTY
> interface instead.

tcgetattr() / tcsetattr() for controlling line disciplines, e.g.
stty -icanon </dev/ttyGNSS0 do not work.

It may be possible to use non-blocking I/O or select() or threads
to achieve the same result but may be more complex.

But gpsd seems not to make use of it (or has a built-in fallback - I
have never looked into its code).

>=20
> As proof-of-concept I have implemented drivers for receivers based on
> two common GNSS chipsets (SiRFstar and u-blox), but due to lack of
> hardware these have so far only been tested using mockup devices and a
> USB-serial-based GPS device (using out-of-tree code). [ Let me know if
> you've got any evalutation kits to spare. ]

Ok, those drivers look nice on first glance.

BTW: I have refactored our w2sg00x4 driver into a gps-core (still =
creating
a /dev/GPS0) and a driver using a common API.

With that it should almost fit by coping some lines from your serdev =
based
device drivers.

I haven't found time to submit anything, so it is just living (and =
working)
in our private tree (please ignore w2cbw003 and trs3386 stuff):

=
http://git.goldelico.com/?p=3Dgta04-kernel.git;a=3Dshortlog;h=3Drefs/heads=
/work/letux-base/hns/misc/w2sg-serdev-v6
=
http://git.goldelico.com/?p=3Dgta04-kernel.git;a=3Dcommit;h=3D164c13373462=
596cabdd3b5308e5f7d8626a05af


>=20
> Finally, note that documentation (including kerneldoc) remains to be
> written, but hopefully this will not hinder review given that the
> current interfaces are fairly self-describing.

I'll apply your patches and try to adjust our w2sg driver. And report
issues if they arise.

BR and thanks,
Nikolaus


>=20
> Johan
>=20
>=20
> Johan Hovold (7):
>  gnss: add GNSS receiver subsystem
>  dt-bindings: add generic gnss binding
>  gnss: add generic serial driver
>  dt-bindings: gnss: add u-blox binding
>  gnss: add driver for u-blox receivers
>  dt-bindings: gnss: add sirfstar binding
>  gnss: add driver for sirfstar-based receivers
>=20
> .../devicetree/bindings/gnss/gnss.txt         |  36 ++
> .../devicetree/bindings/gnss/sirfstar.txt     |  38 ++
> .../devicetree/bindings/gnss/u-blox.txt       |  31 ++
> .../devicetree/bindings/vendor-prefixes.txt   |   4 +
> MAINTAINERS                                   |   7 +
> drivers/Kconfig                               |   2 +
> drivers/Makefile                              |   1 +
> drivers/gnss/Kconfig                          |  43 ++
> drivers/gnss/Makefile                         |  16 +
> drivers/gnss/core.c                           | 385 ++++++++++++++++
> drivers/gnss/serial.c                         | 288 ++++++++++++
> drivers/gnss/serial.h                         |  47 ++
> drivers/gnss/sirf.c                           | 415 ++++++++++++++++++
> drivers/gnss/ubx.c                            | 133 ++++++
> include/linux/gnss.h                          |  64 +++
> 15 files changed, 1510 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/gnss/gnss.txt
> create mode 100644 Documentation/devicetree/bindings/gnss/sirfstar.txt
> create mode 100644 Documentation/devicetree/bindings/gnss/u-blox.txt
> create mode 100644 drivers/gnss/Kconfig
> create mode 100644 drivers/gnss/Makefile
> create mode 100644 drivers/gnss/core.c
> create mode 100644 drivers/gnss/serial.c
> create mode 100644 drivers/gnss/serial.h
> create mode 100644 drivers/gnss/sirf.c
> create mode 100644 drivers/gnss/ubx.c
> create mode 100644 include/linux/gnss.h
>=20
> --=20
> 2.17.0
>=20
