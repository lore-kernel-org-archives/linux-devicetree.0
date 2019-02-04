From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH net-next 0/3] nixge: Fixed-link support
Date: Mon,  4 Feb 2019 09:30:37 -0800
Message-ID: <20190204173040.5538-1-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alex.williams@ni.com, andrew@lunn.ch, robh+dt@kernel.org, davem@davemloft.net, moritz.fischer@ettus.com, Moritz Fischer <mdf@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Moritz Fischer <mdf@kernel.org>

This series adds fixed-link support to nixge.

The first patch corrects the binding to correctly reflect
hardware that does not come with MDIO cores instantiated.

The second patch adds fixed link support to the driver.

The third patch updates the binding document with the now
optional (formerly required) phy-handle property and references
the fixed-link docs.

Thanks,
Moritz

Moritz Fischer (3):
  net: nixge: Make mdio child node optional
  net: nixge: Add support for fixed-link configurations
  dt-bindings: net: Add fixed-link support

 .../devicetree/bindings/net/nixge.txt         | 60 +++++++++++++++++--
 drivers/net/ethernet/ni/nixge.c               | 44 ++++++++++----
 2 files changed, 88 insertions(+), 16 deletions(-)

-- 
2.20.1
