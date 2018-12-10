From: Marek Vasut <marex@denx.de>
Subject: [PATCH V2 RESEND 0/2] net: dsa: ksz: Add reset GPIO handling
Date: Mon, 10 Dec 2018 14:43:04 +0100
Message-ID: <20181210134306.8786-1-marex@denx.de>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, Woojung.Huh@microchip.com, UNGLinuxDriver@microchip.com, devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
List-Id: devicetree@vger.kernel.org

Add code to handle optional reset GPIO in the KSZ switch driver and a
matching DT property adjustments.

Marek Vasut (2):
  net: dsa: ksz: Add optional reset GPIO to Microchip KSZ switch binding
  net: dsa: ksz: Add reset GPIO handling

 .../devicetree/bindings/net/dsa/ksz.txt         |  4 ++++
 drivers/net/dsa/microchip/ksz_common.c          | 17 +++++++++++++++++
 drivers/net/dsa/microchip/ksz_priv.h            |  2 ++
 3 files changed, 23 insertions(+)

-- 
2.18.0
