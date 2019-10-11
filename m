From: matthias.bgg@kernel.org
Subject: [PATCH v1 0/3] This series adds ethernet support for RPi4.
Date: Fri, 11 Oct 2019 20:48:18 +0200
Message-ID: <20191011184822.866-1-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Matthias Brugger <matthias.bgg@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Stefan Wahren <wahrenst@gmx.net>, Matthias Brugger <mbrugger@suse.com>, Doug Berger <opendmb@gmail.com>, Eric Anholt <eric@anholt.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

Raspberry Pi 4 uses the broadcom genet chip in version five.
This chip has a dma controller integrated. Up to now the maximal
burst size was hard-coded to 0x10. But it turns out that Raspberry Pi 4
does only work with the smaller maximal burst size of 0x8.

This series adds a new optional property to the driver, dma-burst-sz.
The very same property is already used by another drivers in the kernel.


Matthias Brugger (3):
  dt-bindings: net: bcmgenet add property for max DMA burst size
  net: bcmgenet: use optional max DMA burst size property
  ARM: dts: bcm2711: Enable GENET support for the RPi4

 .../devicetree/bindings/net/brcm,bcmgenet.txt |  2 ++
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts         | 22 +++++++++++++++++++
 arch/arm/boot/dts/bcm2711.dtsi                | 18 +++++++++++++++
 .../net/ethernet/broadcom/genet/bcmgenet.c    | 13 +++++++++--
 .../net/ethernet/broadcom/genet/bcmgenet.h    |  1 +
 5 files changed, 54 insertions(+), 2 deletions(-)

-- 
2.23.0
