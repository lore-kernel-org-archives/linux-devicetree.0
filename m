From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 0/8] Add support for rtl8723bs/rtl8723cs bluetooth
Date: Fri, 18 Jan 2019 09:02:24 -0800
Message-ID: <20190118170232.16142-1-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org
List-Id: devicetree@vger.kernel.org

rtl8723{bc}s is WiFi/Bluetooth module, WiFi part is connected over SDIO
while bluetooth is connected over UART.

This series adds support for rtl8723bs/rtl8723cs bluetooth.

Bluetooth module in rtl8723cs is buggy - it advertises some features that
it doesn't support and responds either with garbage or with errors on
corresponding commands. Unfortunately that confuses bluetooth stack,
so we need to introduce another quirk.

Patches for Pine64 and Sopine are provided as examples since WiFi/BT module
is optional on these boards.

Vasily Khoruzhick (8):
  Bluetooth: Add new quirk for broken local ext features max_page
  Bluetooth: hci_h5: Add support for reset GPIO
  dt-bindings: net: bluetooth: Add rtl8723bs-bluetooth
  Bluetooth: hci_h5: Add support for binding RTL8723BS with device tree
  Bluetooth: btrtl: add support for the RTL8723CS
  arm64: allwinner: a64: enable Bluetooth On Pinebook
  DO-NOT-MERGE: arm64: allwinner: a64: enable Bluetooth On Pine64
  DO-NOT-MERGE: arm64: allwinner: a64: enable Bluetooth On SoPine
    baseboard

 .../bindings/net/rtl8723bs-bluetooth.txt      |  35 +++++
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |  10 +-
 .../dts/allwinner/sun50i-a64-pinebook.dts     |  14 ++
 .../allwinner/sun50i-a64-sopine-baseboard.dts |  14 ++
 drivers/bluetooth/btrtl.c                     | 128 +++++++++++++++++-
 drivers/bluetooth/btrtl.h                     |  12 ++
 drivers/bluetooth/hci_h5.c                    |  33 +++++
 include/net/bluetooth/hci.h                   |   7 +
 net/bluetooth/hci_event.c                     |   4 +-
 9 files changed, 252 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt

-- 
2.20.1
