From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 0/7] net: phy: realtek: Enable configuration of RTL8211E LEDs and SSC
Date: Mon,  8 Jul 2019 12:24:52 -0700
Message-ID: <20190708192459.187984-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

The Realtek RTL8211E allows customization of the PHY LED behavior,
like which LEDs are on for certain link speeds and which LEDs blink
when there is traffic. By default EEE LED mode is enabled, in which
a blinking LED is on for 400ms and off for 2s. This series adds
support for configuring the LED behavior through device tree
properties.

The RTL8211E supports Spread Spectrum Clocking (SSC), which reduces
clock noise that may affect other board functions. By default SSC
is disabled, this series adds support for enabling it through a
device tree property.

Certain registers on the RTL8211E can only be accessed through
a vendor specific extended page mechanism. Extended pages need
to be accessed for the LED configuration and enabling SSC. This
series adds helpers to facilitate accessing extended pages.

Matthias Kaehlcke (7):
  dt-bindings: net: Add bindings for Realtek PHYs
  net: phy: realtek: Allow disabling RTL8211E EEE LED mode
  dt-bindings: net: realtek: Add property to enable SSC
  net: phy: realtek: Add helpers for accessing RTL8211E extension pages
  net: phy: realtek: Support SSC for the RTL8211E
  dt-bindings: net: realtek: Add property to configure LED mode
  net: phy: realtek: configure RTL8211E LEDs

 .../devicetree/bindings/net/realtek.txt       |  47 +++++
 drivers/net/phy/realtek.c                     | 171 ++++++++++++++++--
 include/dt-bindings/net/realtek.h             |  18 ++
 3 files changed, 221 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/realtek.txt
 create mode 100644 include/dt-bindings/net/realtek.h

-- 
2.22.0.410.gd8fdbe21b5-goog
