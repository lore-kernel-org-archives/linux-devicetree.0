From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 0/4] net: phy: realtek: Enable configuration of RTL8211E LEDs
Date: Thu,  1 Aug 2019 12:07:55 -0700
Message-ID: <20190801190759.28201-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

The Realtek RTL8211E allows customization of the PHY LED behavior,
like which LEDs are on for certain link speeds and which LEDs blink
when there is traffic. By default EEE LED mode is enabled, in which
a blinking LED is on for 400ms and off for 2s. This series adds a
generic device tree binding for configuring PHY LEDs and adds LED
configuration support for the RTL8211E PHY.

Certain registers of the RTL8211E can only be accessed through
a vendor specific extended page mechanism. Extended pages need
to be accessed for the LED configuration. This series adds helpers
to facilitate accessing extended pages.

Matthias Kaehlcke (4):
  dt-bindings: net: phy: Add subnode for LED configuration
  net: phy: Add function to retrieve LED configuration from the DT
  net: phy: realtek: Add helpers for accessing RTL8211E extension pages
  net: phy: realtek: configure RTL8211E LEDs

 .../devicetree/bindings/net/ethernet-phy.yaml |  47 +++++
 drivers/net/phy/phy_device.c                  |  50 ++++++
 drivers/net/phy/realtek.c                     | 169 ++++++++++++++++--
 include/linux/phy.h                           |  15 ++
 4 files changed, 266 insertions(+), 15 deletions(-)

-- 
2.22.0.770.g0f2c4a37fd-goog
