Return-Path: <SRS0=dUwE=WX=nic.cz=marek.behun@kernel.org>
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH mvebu-dt64 0/3] Add Turris Mox device-tree
Date: Tue, 27 Aug 2019 17:16:41 +0200
Message-Id: <20190827151644.12532-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: arm@kernel.org
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
List-ID: <devicetree@vger.kernel.org>

Hello,
this patch series adds device-tree for Turris Mox.

All the devices described in this device-tree are supported, although
the moxtet bus driver and moxtet GPIO driver are now only in
soc/for-next.

The device-tree includes <dt-bindings/bus/moxtet.h>. This file is not
present in mvebu/dt64, but is in soc/for-next.

I have addressed the issues Rob Herring had with this device-tree when
I sent a RFC in November 2018. These include:
 - since there are whole hierarchy of nodes that may be disabled since
   the modules are not connected, U-Boot removes these nodes
 - the documentation for board compatible flag was moved into
   armada-37xx dt-bindings documentation
 - reset_button was renamed to reset
 - reset-gpio was renamed to reset-gpios
 - flash partitions nodes are now contained in one 'partitions' node
 - moxtet node now has a driver in soc/for-next and has documented
   dt-bindings
Not addressed:
 - the switch nodes have names:
     switch0@10   switch1@11   switch2@12
     switch0@2    switch1@2    switch2@2
   Rob said that 'Ideally, we shouldn't have this switch0, switch1,
   etc.'
   The problem here is that the 4-port switch is always on the same MDIO
   address (0x2), but depending on it's position in this module topology
   it has different settings. Therefore we have three nodes, and only
   one of them can be ever enabled (only one 4-port switch can be
   connected). Since I did not change this for the 4-port switch, I left
   this naming also for 8-port switch.
   Hopefully this is not a major problem.
There were also other changes since the RFC, since there are new drivers
now in the kernel (for example the comphy driver for Armada 37xx).

Marek

Marek Behún (3):
  arm64: dts: marvell: armada-37xx: add SPI CS1 pinctrl
  dt-bindings: marvell: document Turris Mox compatible
  arm64: dts: marvell: add DTS for Turris Mox

 .../bindings/arm/marvell/armada-37xx.txt      |   8 +
 arch/arm64/boot/dts/marvell/Makefile          |   1 +
 .../dts/marvell/armada-3720-turris-mox.dts    | 841 ++++++++++++++++++
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi  |   5 +
 4 files changed, 855 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts

-- 
2.21.0
