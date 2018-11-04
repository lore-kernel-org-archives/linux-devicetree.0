From: thesven73@gmail.com
Subject: [PATCH anybus v3 0/6] Support HMS Profinet Card over Anybus
Date: Sun,  4 Nov 2018 10:54:55 -0500
Message-ID: <20181104155501.14767-1-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org
Cc: lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sven Van Asbroeck <svendev@arcx.com>

This patch set adds support for the HMS Industrial Networks AB Profinet card.

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

Sven Van Asbroeck (6):
  misc: support the Arcx anybus bridge
  dt-bindings: Add vendor prefix for arcx / Archronix
  dt-bindings: anybus-bridge: document devicetree binding
  bus: support HMS Anybus-S bus
  dt-bindings: anybuss-host: document devicetree binding
  misc: support HMS Profinet IRT industrial controller

 .../bindings/bus/arcx,anybuss-host.txt        |   36 +
 .../bindings/misc/arcx,anybus-bridge.txt      |   34 +
 .../devicetree/bindings/vendor-prefixes.txt   |    1 +
 Documentation/ioctl/ioctl-number.txt          |    1 +
 drivers/bus/Kconfig                           |   20 +
 drivers/bus/Makefile                          |    2 +
 drivers/bus/anybus-bridge.c                   |  321 ++++
 drivers/bus/anybuss-host.c                    | 1503 +++++++++++++++++
 drivers/misc/Kconfig                          |   10 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/hms-profinet.c                   |  753 +++++++++
 include/linux/anybuss-client.h                |  100 ++
 include/uapi/linux/hms-common.h               |   14 +
 include/uapi/linux/hms-profinet.h             |  102 ++
 14 files changed, 2898 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/arcx,anybuss-host.txt
 create mode 100644 Documentation/devicetree/bindings/misc/arcx,anybus-bridge.txt
 create mode 100644 drivers/bus/anybus-bridge.c
 create mode 100644 drivers/bus/anybuss-host.c
 create mode 100644 drivers/misc/hms-profinet.c
 create mode 100644 include/linux/anybuss-client.h
 create mode 100644 include/uapi/linux/hms-common.h
 create mode 100644 include/uapi/linux/hms-profinet.h

-- 
2.17.1
