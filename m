From: Pawel Dembicki <paweldembicki@gmail.com>
Subject: [PATCH v2 0/4] net: dsa: Add Vitesse VSC73xx parallel mode
Date: Wed,  3 Jul 2019 19:19:20 +0200
Message-ID: <20190703171924.31801-1-paweldembicki@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>, linus.walleij@linaro.org, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Main goal of this patch series is to add support for parallel bus in
Vitesse VSC73xx switches. Existing driver supports only SPI mode.

Second change is needed for devices in unmanaged state.

V2:
- drop changes in compatible strings
- make changes less invasive
- drop mutex in platform part and move mutex from core to spi part
- fix indentation 
- fix devm_ioremap_resource result check
- add cover letter 

Pawel Dembicki (4):
  net: dsa: Change DT bindings for Vitesse VSC73xx switches
  net: dsa: vsc73xx: Split vsc73xx driver
  net: dsa: vsc73xx: add support for parallel mode
  net: dsa: vsc73xx: Assert reset if iCPU is enabled

 .../bindings/net/dsa/vitesse,vsc73xx.txt      |  57 ++++-
 drivers/net/dsa/Kconfig                       |  19 +-
 drivers/net/dsa/Makefile                      |   4 +-
 ...tesse-vsc73xx.c => vitesse-vsc73xx-core.c} | 206 +++---------------
 drivers/net/dsa/vitesse-vsc73xx-platform.c    | 160 ++++++++++++++
 drivers/net/dsa/vitesse-vsc73xx-spi.c         | 203 +++++++++++++++++
 drivers/net/dsa/vitesse-vsc73xx.h             |  29 +++
 7 files changed, 493 insertions(+), 185 deletions(-)
 rename drivers/net/dsa/{vitesse-vsc73xx.c => vitesse-vsc73xx-core.c} (90%)
 create mode 100644 drivers/net/dsa/vitesse-vsc73xx-platform.c
 create mode 100644 drivers/net/dsa/vitesse-vsc73xx-spi.c
 create mode 100644 drivers/net/dsa/vitesse-vsc73xx.h

-- 
2.20.1
