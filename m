From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: [PATCH 0/3] Add Broadcom Omega SoC internal switch and phy
Date: Tue,  7 Aug 2018 10:02:41 -0700
Message-ID: <1533661364-15381-1-git-send-email-arun.parameswaran@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Arun Parameswaran <arun.parameswaran@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi,

The patchset is based on David Miller's "net-next" repo.

The patches add support for the Broadcom Omega SoC's internal ethernet
switch and the internal gphy.

The internal ethernet switch in the Omega is a b53 srab based switch.
The support for the switch is added to the b53 driver in the dsa
framework.

The gphy support is added to the bcm7xxx driver.

Thanks
Arun

Arun Parameswaran (3):
  dt-bindings: net: dsa: Add compatibility strings for Broadcom Omega
  net: dsa: b53: Add support for Broadcom Omega SoC internal switch
  net: phy: Add support for Broadcom Omega internal Combo GPHY

 Documentation/devicetree/bindings/net/dsa/b53.txt | 8 ++++++++
 drivers/net/dsa/b53/b53_srab.c                    | 1 +
 drivers/net/phy/bcm7xxx.c                         | 2 ++
 include/linux/brcmphy.h                           | 1 +
 4 files changed, 12 insertions(+)

-- 
1.9.1
