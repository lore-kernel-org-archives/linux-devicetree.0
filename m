From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v6 0/4] net: phy: Add support for DT configuration of PHY LEDs and use it for RTL8211E
Date: Tue, 13 Aug 2019 12:11:43 -0700
Message-ID: <20190813191147.19936-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

This series adds a generic binding to configure PHY LEDs through
the device tree, and phylib support for reading the information
from the DT. PHY drivers that support the generic binding should
implement the new hook .config_led.

Enable DT configuration of the RTL8211E LEDs by implementing the
.config_led hook of the driver. Certain registers of the RTL8211E
can only be accessed through a vendor specific extended page
mechanism. Extended pages need to be accessed for the LED
configuration. This series adds helpers to facilitate accessing
extended pages.

Matthias Kaehlcke (4):
  dt-bindings: net: phy: Add subnode for LED configuration
  net: phy: Add support for generic LED configuration through the DT
  net: phy: realtek: Add helpers for accessing RTL8211x extension pages
  net: phy: realtek: Add LED configuration support for RTL8211E

 .../devicetree/bindings/net/ethernet-phy.yaml |  59 ++++++++
 drivers/net/phy/phy_device.c                  |  72 +++++++++
 drivers/net/phy/realtek.c                     | 137 ++++++++++++++++--
 include/linux/phy.h                           |  22 +++
 4 files changed, 275 insertions(+), 15 deletions(-)

-- 
2.23.0.rc1.153.gdeed80330f-goog
