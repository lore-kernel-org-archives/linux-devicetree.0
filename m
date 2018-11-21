From: thesven73@gmail.com
Subject: [PATCH anybus v4 0/7] Add Fieldbus subsystem + support HMS Profinet card
Date: Wed, 21 Nov 2018 10:07:02 -0500
Message-ID: <20181121150709.6030-1-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch:
  1. adds a Fieldbus subsystem
  2. adds support for the HMS Industrial Networks AB Profinet card.

1. Fieldbus subsystem
---------------------

Fieldbus device (client) adapters allow data exchange with a PLC aka.
"Fieldbus Controller" over a fieldbus (Profinet, FLNet, etc.)
They are typically used when a Linux device wants to expose itself
as an actuator, motor, console light, switch, etc. over the fieldbus.
The framework is designed to provide a generic interface to Fieldbus
Devices from both the Linux Kernel and the userspace.

2. Add support for HMS Profinet Card
------------------------------------

Profinet is an industry technical standard for data communication over
Industrial Ethernet, designed for collecting data from, and controlling,
equipment in industrial systems, with a particular strength in delivering data
under tight time constraints (on the order of 1ms or less).

The profinet card itself is connected to the system via an industrial bus
called 'anybus'.

I have followed the bus driver/client driver pattern, and created an anybus
bus driver, plus a client driver for the profinet card.

In case this patch set gets (eventually) accepted, drivers for other anybus
client cards may follow: flnet, cc-link, ...

The anybus slot on the host is located on an 'anybus bridge', which is
custom h/w designed by arcx. Its driver is modeled as a misc device, which
exposes a dual reset controller, plus a power readout unrelated to the anybus.

v4:
	general
		create fieldbus_dev subsystem, with standardized 'simple'
			userspace interface (sysfs + cdev)
		remove redundant __packed keywords
		use __be16/32 types wherever values are explicitly big-endian
	hms-profinet:
		remove configuration code, and uapi headers: not supported (yet)
			when registering as a fieldbus_dev.
	anybuss-host:
		use struct kref to reference-count tasks
		replace busy loops with usleep_range() loop after 10 tries
		use threaded irq so time_before_eq(jiffies, timeout) will
			continue to work
		allow client devices to be assigned a devicetree node,
			in the same way as pci/mmc/...

v3:
	devicetree-bindings
		adding the vendor prefix is now a separate commit
	anybus-bridge:
		moved misc driver to drivers/bus/
		converted of_gpio_* to gpiod_* abstractions
		can power readout is now a fixed-voltage regulator
	anybuss-host:
		converted refcounts from atomic_t to refcount_t
		fixed potential use-after-free
	hms-profinet:
		applied minor kernel build robot suggestion

v2:
	added architecture overview comments to host driver
	completely reworked anybus-bridge driver, it becomes a reset controller
	anybuss-host driver now needs devicetree entry, link to reset controller
	I will hold off on kernel-doc until the overall architecture gets
		more validation / approval
	fixed Kconfig, comment-style, document ioctl magic numbers
	removed redundant pwm dependency
	renamed enable-gpios to reset-gpios
	stop driving reset-gpio after unloading driver
	use interrupt-parent / interrupts method to describe interrupts
		in the devicetree
	convert references 'i.MX WEIM parallel bus' to 'parallel bus'
	replace devicetree functions with more generic platform_get_resource()
							platform_get_irq()
	added device unique data to add_device_randomness()

v1:
	first shot


Sven Van Asbroeck (7):
  fieldbus_dev: add Fieldbus Device subsystem.
  fieldbus: support the Arcx anybus bridge
  dt-bindings: Add vendor prefix for arcx / Archronix
  dt-bindings: anybus-bridge: document devicetree binding
  fieldbus: support HMS Anybus-S bus
  dt-bindings: anybuss-host: document devicetree binding
  fieldbus_dev: support HMS Profinet IRT industrial controller

 Documentation/ABI/testing/fieldbus-dev-cdev   |   31 +
 .../ABI/testing/sysfs-class-fieldbus-dev      |   63 +
 .../bindings/fieldbus/arcx,anybus-bridge.txt  |   34 +
 .../bindings/fieldbus/arcx,anybuss-host.txt   |   66 +
 .../devicetree/bindings/vendor-prefixes.txt   |    1 +
 Documentation/fieldbus_dev/fieldbus_dev.txt   |   66 +
 drivers/Kconfig                               |    2 +
 drivers/Makefile                              |    1 +
 drivers/fieldbus/Kconfig                      |   56 +
 drivers/fieldbus/Makefile                     |   12 +
 drivers/fieldbus/anybus-bridge.c              |  321 ++++
 drivers/fieldbus/anybuss-host.c               | 1497 +++++++++++++++++
 drivers/fieldbus/dev_core.c                   |  355 ++++
 drivers/fieldbus/hms-profinet.c               |  223 +++
 include/linux/anybuss-client.h                |  104 ++
 include/linux/fieldbus_dev.h                  |  106 ++
 16 files changed, 2938 insertions(+)
 create mode 100644 Documentation/ABI/testing/fieldbus-dev-cdev
 create mode 100644 Documentation/ABI/testing/sysfs-class-fieldbus-dev
 create mode 100644 Documentation/devicetree/bindings/fieldbus/arcx,anybus-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fieldbus/arcx,anybuss-host.txt
 create mode 100644 Documentation/fieldbus_dev/fieldbus_dev.txt
 create mode 100644 drivers/fieldbus/Kconfig
 create mode 100644 drivers/fieldbus/Makefile
 create mode 100644 drivers/fieldbus/anybus-bridge.c
 create mode 100644 drivers/fieldbus/anybuss-host.c
 create mode 100644 drivers/fieldbus/dev_core.c
 create mode 100644 drivers/fieldbus/hms-profinet.c
 create mode 100644 include/linux/anybuss-client.h
 create mode 100644 include/linux/fieldbus_dev.h

-- 
2.17.1
