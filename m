From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH net-next 0/3] net: dsa: support PHY reads/writes diversion
Date: Tue, 10 Mar 2015 16:57:10 -0700
Message-ID: <1426031833-5113-1-git-send-email-f.fainelli@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series completes the PHY reads/writes diversion when we need to use
the slave MII bus provided by DSA and the underlying switch drivers to
implement the real PHY reads and writes. This is particularly useful when they
are conflicting MDIO bus addresses as in the case of multiple Broadcom switches
connected to each other (internal and external, or just external).

Florian Fainelli (3):
  of: mdio: export of_mdio_parse_addr
  net: dsa: move PHY setup on DSA MII bus to its own function
  net: dsa: fully divert PHY reads/writes if requested

 drivers/of/of_mdio.c    |  3 ++-
 include/linux/of_mdio.h |  6 ++++++
 net/dsa/slave.c         | 51 +++++++++++++++++++++++++++++++++++++------------
 3 files changed, 47 insertions(+), 13 deletions(-)

-- 
2.1.0
