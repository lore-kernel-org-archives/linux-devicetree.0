From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 0/2] usb: add HCD providers
Date: Tue, 12 Jul 2016 14:35:18 +0200
Message-ID: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Sender: linux-leds-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

I was working on an "usbport" LED trigger driver and specifying its
default state in DT. I realized I can't really determine numbering of
USB ports on any device as it depends on compiled drivers and the
loading orders.

It means that my physical USB port can be e.g. 1-1 or 2-1 depending on
my current config/setup. I needed a way to specify a particular HCD in
DT and then hardcode port number (as this part doesn't change).

These 2 patches add providers to usb core subsystem. I successfully
tested it with "usbport" trigger and generic-ohci, generic-ehci &
generic-xhci.

The last (third) patch is not supposed to be applied, it's used only as
a proof and example of how providers can be used.

If there is anything wrong with this idea/implementation, please let me
know.

Rafa=C5=82 Mi=C5=82ecki (2):
  usb: core: add support for HCD providers
  ohci-platform: register HCD provider

 drivers/usb/core/Makefile        |  1 +
 drivers/usb/core/provider.c      | 79 ++++++++++++++++++++++++++++++++=
++++++++
 drivers/usb/host/ohci-platform.c |  9 +++++
 include/linux/usb/provider.h     | 39 ++++++++++++++++++++
 4 files changed, 128 insertions(+)
 create mode 100644 drivers/usb/core/provider.c
 create mode 100644 include/linux/usb/provider.h

--=20
1.8.4.5
