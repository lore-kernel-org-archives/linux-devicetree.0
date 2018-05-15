From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 0/1] net: phy: micrel: add 125MHz reference clock workaround
Date: Tue, 15 May 2018 09:45:26 +0200
Message-ID: <20180515074527.22546-1-m.felsch@pengutronix.de>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, niebelm@tqsc.de
List-Id: devicetree@vger.kernel.org

This patch adds the workaround for the errata#2. The KSZ9031 phy
125MHz reference clock jitter is to high if the phy is configured as
slave. This will cause errors if a application uses the clock as
MAC reference clock. The workaround is to configure the phy as master.

v2:
- add more code and dt-binding comments
- delete unnecessary local variables
- add error handling

v1:
- initial commit

Markus Niebel (1):
  net: phy: micrel: add 125MHz reference clock workaround

 .../bindings/net/micrel-ksz90x1.txt           |  7 ++++
 drivers/net/phy/micrel.c                      | 32 +++++++++++++++++++
 2 files changed, 39 insertions(+)

-- 
2.17.0
