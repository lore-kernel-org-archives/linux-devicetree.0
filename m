From: Lars Poeschel <poeschel@lemonage.de>
Subject: [PATCH v9 0/7] nfc: pn533: add uart phy driver
Date: Tue,  8 Oct 2019 16:05:37 +0200
Message-ID: <20191008140544.17112-1-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Lars Poeschel <poeschel@lemonage.de>, Kate Stewart <kstewart@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Jilayne Lovejoy <opensource@jilayne.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Steve Winslow <swinslow@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>, Allison Randal <allison@lohutok.net>, Johan Hovold <johan@kernel.org>, Simon Horman <horms@verge.net.au>
List-Id: devicetree@vger.kernel.org

The purpose of this patch series is to add a uart phy driver to the
pn533 nfc driver.
It first changes the dt strings and docs. The dt compatible strings
need to change, because I would add "pn532-uart" to the already
existing "pn533-i2c" one. These two are now unified into just
"pn532". Then the neccessary changes to the pn533 core driver are
made. Then the uart phy is added.
As the pn532 chip supports a autopoll, I wanted to use this instead
of the software poll loop in the pn533 core driver. It is added and
activated by the last to patches.
The way to add the autopoll later in seperate patches is chosen, to
show, that the uart phy driver can also work with the software poll
loop, if someone needs that for some reason.
This patchset is already rebased on Johans "NFC: pn533: fix
use-after-free and memleaks" patch
https://lore.kernel.org/netdev/20191007164059.5927-1-johan@kernel.org/
as they would conflict.
If for some reason Johans patch will not get merged, I can of course
provide the patchset without depending on this patch.

Cc: Lars Poeschel <poeschel@lemonage.de>
Cc: Kate Stewart <kstewart@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jilayne Lovejoy <opensource@jilayne.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Steve Winslow <swinslow@gmail.com>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Allison Randal <allison@lohutok.net>
Cc: Johan Hovold <johan@kernel.org>
Cc: Simon Horman <horms@verge.net.au>

Lars Poeschel (7):
  nfc: pn533: i2c: "pn532" as dt compatible string
  nfc: pn532: Add uart phy docs and rename it
  nfc: pn533: Add dev_up/dev_down hooks to phy_ops
  nfc: pn533: Split pn533 init & nfc_register
  nfc: pn533: add UART phy driver
  nfc: pn533: Add autopoll capability
  nfc: pn532_uart: Make use of pn532 autopoll

 .../net/nfc/{pn533-i2c.txt => pn532.txt}      |  25 +-
 drivers/nfc/pn533/Kconfig                     |  11 +
 drivers/nfc/pn533/Makefile                    |   2 +
 drivers/nfc/pn533/i2c.c                       |  22 +-
 drivers/nfc/pn533/pn533.c                     | 271 +++++++++++++--
 drivers/nfc/pn533/pn533.h                     |  38 +-
 drivers/nfc/pn533/uart.c                      | 324 ++++++++++++++++++
 drivers/nfc/pn533/usb.c                       |  12 +-
 8 files changed, 646 insertions(+), 59 deletions(-)
 rename Documentation/devicetree/bindings/net/nfc/{pn533-i2c.txt => pn532.txt} (42%)
 create mode 100644 drivers/nfc/pn533/uart.c

-- 
2.23.0
