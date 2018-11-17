From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/7] IP101GR: devicetree based configuration of SEL_INTR32
Date: Sat, 17 Nov 2018 19:20:00 +0100
Message-ID: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

The IP101GR is a 32-pin QFN package variant of the IP101G/IP101GA
Ethernet PHY. Due to it's limited amount of pins the RXER (receive
error) and INTR32 (interrupt) functions share pin 21.

The goal of this series is:
- some small cleanups in patches 3, 4 and 5
- allowing the kernel to detect IRQ floods on boards where the IP101GR
  is configured in RXER mode but the RXER line is configured on the
  host SoC as interrupt line (patch 6)
- configuration of the SEL_INTR32 register so we can use the interrupt
  function on boards where the RXER/INTR32 pin (pin 21) is routed to
  one of the host SoC's interrupt inputs (patches 1, 2, 7)

A use-case where this is needed is the Endless Mini (EC-100). I have
tested my changes on that board. This also confirms that Heiner
Kallweit's recent icplus.c PHY driver changes are working (at least on
my setup).

This series is based on net-next commit 9c549a6b057386d ("selftests:
add explicit test for multiple concurrent GRO sockets")


Martin Blumenstingl (7):
  dt-bindings: vendor-prefix: add prefix for IC Plus Corp.
  dt-bindings: net: phy: add bindings for the IC Plus Corp. IP101A/G
    PHYs
  net: phy: icplus: keep all ip101a_g functions together
  net: phy: icplus: use the BIT macro where possible
  net: phy: icplus: rename IP101A_G_NO_IRQ to IP101A_G_IRQ_ALL_MASK
  net: phy: icplus: implement .did_interrupt for IP101A/G
  net: phy: icplus: allow configuring the interrupt function on IP101GR

 .../bindings/net/icplus-ip101ag.txt           |  19 +++
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 drivers/net/phy/icplus.c                      | 125 +++++++++++++++---
 3 files changed, 125 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/icplus-ip101ag.txt

-- 
2.19.1
