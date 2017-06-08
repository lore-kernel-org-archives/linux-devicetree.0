From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2 0/5] phy: bcm-ns-usb3: add MDIO driver
Date: Thu,  8 Jun 2017 22:04:23 +0200
Message-ID: <20170608200428.9187-1-zajec5@gmail.com>
References: <20170511132925.14564-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170511132925.14564-1-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

As explained in the commit 9200c6f177638 ("Revert "phy: Add USB3 PHY support
for Broadcom NSP SoC"") this module should be modified to use MDIO bus as
this is how PHY is really attached.

This should allow reusing this driver on NSP and any other platform with
MDIO bus and this particular PHY.

V2: Rebase and update 4/5 and 5/5.

Rafał Miłecki (5):
  phy: bcm-ns-usb3: always wait for idle after writing to the PHY reg
  phy: bcm-ns-usb3: use pointer for PHY writing function
  phy: bcm-ns-usb3: enable MDIO in the platform specific code
  dt-bindings: phy: Modify Broadcom NS USB 3.0 PHY binding to use MDIO
  phy: bcm-ns-usb3: add MDIO driver using proper bus layer

 .../devicetree/bindings/phy/bcm-ns-usb3-phy.txt    |  27 ++-
 drivers/phy/broadcom/Kconfig                       |   1 +
 drivers/phy/broadcom/phy-bcm-ns-usb3.c             | 230 +++++++++++++++------
 3 files changed, 186 insertions(+), 72 deletions(-)

-- 
2.11.0
