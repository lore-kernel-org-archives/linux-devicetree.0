From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v2 0/3] lan78xx: Read configuration from Device Tree
Date: Wed, 18 Apr 2018 16:45:20 +0100
Message-ID: <1524066323-109628-1-git-send-email-phil@raspberrypi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Phil Elwell <phil@raspberrypi.org>
List-Id: devicetree@vger.kernel.org

The Microchip LAN78XX family of devices are Ethernet controllers with
a USB interface. Despite being discoverable devices it can be useful to
be able to configure them from Device Tree, particularly in low-cost
applications without an EEPROM or programmed OTP.

This patch set adds support for reading the MAC address and LED modes from
Device Tree.

v2:
- Use eth_platform_get_mac_address.
- Support up to 4 LEDs, and move LED mode constants into dt-bindings header.
- Improve bindings document.
- Remove EEE support.

Phil Elwell (3):
  lan78xx: Read MAC address from DT if present
  lan78xx: Read LED states from Device Tree
  dt-bindings: Document the DT bindings for lan78xx

 .../devicetree/bindings/net/microchip,lan78xx.txt  | 43 +++++++++++++++
 MAINTAINERS                                        |  2 +
 drivers/net/usb/lan78xx.c                          | 62 ++++++++++++++--------
 include/dt-bindings/net/microchip-78xx.h           | 40 ++++++++++++++
 4 files changed, 125 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/microchip,lan78xx.txt
 create mode 100644 include/dt-bindings/net/microchip-78xx.h

-- 
2.7.4
