From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 0/3] Pine64+ specific hacks for RTL8211E Ethernet PHY
Date: Tue,  1 Oct 2019 16:29:09 +0800
Message-ID: <20191001082912.12905-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

There're some Pine64+ boards known to have broken RTL8211E chips, and
a hack is given by Pine64+, which is said to be from Realtek.

This patchset adds the hack.

The hack is taken from U-Boot, and it contains magic numbers without
any document.

Icenowy Zheng (3):
  dt-bindings: add binding for RTL8211E Ethernet PHY
  net: phy: realtek: add config hack for broken RTL8211E on Pine64+
    boards
  arm64: allwinner: a64: dts: apply hack for RTL8211E on Pine64+

 .../bindings/net/realtek,rtl8211e.yaml        | 23 +++++++++++++++++++
 .../dts/allwinner/sun50i-a64-pine64-plus.dts  |  1 +
 drivers/net/phy/realtek.c                     | 14 +++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl8211e.yaml

-- 
2.21.0
