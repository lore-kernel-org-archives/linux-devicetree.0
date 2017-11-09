From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/8] USB: add device-tree support for interfaces
Date: Thu,  9 Nov 2017 18:07:15 +0100
Message-ID: <20171109170723.10960-1-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>, Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

This series adds support for representing USB interfaces in device tree
by implementing support for "interface nodes" and "combined nodes" from
the OF specification.

This is needed to be able to describe non-discoverable properties of
permanently attached USB devices and their interfaces such as any
i2c-clients connected to a USB-i2c bridge (e.g. the dln2 mfd) or,
eventually, devices connected to usb-serial converters (to be used with
serdev).

As part of this series the current binding for USB devices is cleaned
up and some already-used properties of "host-controller nodes" and "hub
nodes" are explicitly defined.

While doing this work I realised that a broken binding for USB-port LED
triggers had recently been merged. This trigger implementation assumes
an undocumented and conflicting binding for USB (root) hub ports, which
in fact lack a representation in device tree (the child nodes of hub
nodes represent the attached USB devices):

	80dc6e1cd85f ("dt-bindings: leds: document new trigger-sources property")

In this series I only address an of_node leak in the trigger
implementation and add a FIXME about the port/device mixup. Note that
some broadcom dts have already started using such a "port" binding:

	a503cf0cbe66 ("ARM: dts: BCM53573: Specify USB ports of on-SoC controllers")
	69d22c70ac9a ("ARM: dts: BCM5301X: Specify USB ports for each controller")

To fix this, any triggers need to be described using properties of the
host-controller (or hub) rather than of their children.

Johan


Johan Hovold (8):
  dt-bindings: usb: fix example hub node name
  dt-bindings: usb: fix reg-property port-number range
  dt-bindings: usb: clean up compatible property
  dt-bindings: usb: document hub and host-controller properties
  dt-bindings: usb: add interface binding
  USB: add device-tree support for interfaces
  USB: ledtrig-usbport: fix of-node leak
  USB: of: clean up device-node helper

 .../devicetree/bindings/usb/usb-device.txt         | 99 +++++++++++++++++++---
 drivers/usb/core/ledtrig-usbport.c                 | 10 ++-
 drivers/usb/core/message.c                         | 18 ++--
 drivers/usb/core/of.c                              | 95 ++++++++++++++++++---
 drivers/usb/core/usb.c                             |  3 +-
 include/linux/usb/of.h                             | 21 ++++-
 6 files changed, 208 insertions(+), 38 deletions(-)

-- 
2.15.0
