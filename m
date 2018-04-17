From: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
Subject: [PATCH net-next 0/3] net: phy: Enable C45 vendor specific MDIO register addr space
Date: Tue, 17 Apr 2018 04:02:30 -0500
Message-ID: <20180417090233.21548-1-vicentiu.galanopulo@nxp.com>
Reply-To: vicentiu.galanopulo@nxp.com
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch, robh@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, davem@davemloft.net, marcel@holtmann.org, devicetree@vger.kernel.org
Cc: alexandru.marginean@nxp.com, madalin.bucur@nxp.com, vicentiu.galanopulo@nxp.com
List-Id: devicetree@vger.kernel.org

Enabling the discovery on the MDIO bus of PHYs which
have a vendor specific address space for accessing the C45 MDIO registers.

Vicentiu Galanopulo (3):
  net: phy: Add binding for vendor specific C45 MDIO address space
  net: phy: Change the array size to 32 for device_ids
  net: phy: Enable C45 PHYs with vendor specific address space

 Documentation/devicetree/bindings/net/phy.txt |   6 ++
 drivers/net/phy/phy_device.c                  |  49 ++++++++++-
 drivers/of/of_mdio.c                          | 113 +++++++++++++++++++++++++-
 include/linux/phy.h                           |  16 +++-
 4 files changed, 176 insertions(+), 8 deletions(-)

-- 
2.7.4
