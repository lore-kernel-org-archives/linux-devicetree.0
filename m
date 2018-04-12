From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH 0/4] lan78xx: Read configuration from Device Tree
Date: Thu, 12 Apr 2018 14:55:32 +0100
Message-ID: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Phil Elwell <phil@raspberrypi.org>
List-Id: devicetree@vger.kernel.org

The Microchip LAN78XX family of devices are Ethernet controllers with
a USB interface. Despite being discoverable devices it can be useful to
be able to configure them from Device Tree, particularly in low-cost
applications without an EEPROM or programmed OTP.

This patch set adds support for reading the MAC address, EEE setting
and LED modes from Device Tree.

Phil Elwell (4):
  lan78xx: Read MAC address from DT if present
  lan78xx: Read initial EEE setting from Device Tree
  lan78xx: Read LED modes from Device Tree
  dt-bindings: Document the DT bindings for lan78xx

 .../devicetree/bindings/net/microchip,lan78xx.txt  | 44 ++++++++++++
 MAINTAINERS                                        |  1 +
 drivers/net/usb/lan78xx.c                          | 81 ++++++++++++++++------
 3 files changed, 105 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/microchip,lan78xx.txt

-- 
2.7.4
