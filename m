Return-Path: <SRS0=hqGg=WY=nic.cz=marek.behun@kernel.org>
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v2 mvebu-dt64 0/3] Add Turris Mox device-tree
Date: Wed, 28 Aug 2019 17:12:40 +0200
Message-Id: <20190828151243.23542-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: arm@kernel.org
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
List-ID: <devicetree@vger.kernel.org>

Hello, this is the second version of patches adding Turris Mox dts.
I have addressed Andrew's comments about led label, reset button
function and sfp i2c bus speed. The other issues I have explained
in reply to Andrew. Here is a copy of those:

> > The node is called i2c0, but here you have i2c1_pins?

> That is how this is defined in armada-37xx.dtsi. First i2c has
> phandle pointer called i2c0, second i2c1. But the pinctrl drivers uses
> i2c1 and i2c2. All device trees need to be changed for this. This can
> be done later in a separate commit for all device trees using
> armada-37xx.dtsi

> > > > +&pcie_reset_pins {
> > > > +	function = "gpio";
> > > > +};
> > 
> > Should there be something to indicate which GPIO?

> No. The thing here is that the function here should remain "pcie"
> ideally. When that pin is configured in pcie mode, modifying specific
> pcie register should control the pin. But for some reason on our SOC
> it does not. I suspect it does not work for Miquel Raynal either,
> since he sent patches for aardvark that use reset-gpio as well (see
> https://lkml.org/lkml/2018/12/12/242 ).
> So we configure it in gpio mode and than in the pcie node we have
>   reset-gpios = <&gpiosb 3 GPIO_ACTIVE_LOW>;

> > Does u-boot also modify this, if switch2 does not exist? I don't
> > know if it actually matters, but if the switch does not exist, but
> > the routing entry exists, this switch might still send it frames and
> > use up some of your bandwidth?

> That port has status = "disabled" by default. U-Boot enables that node
> if second switch is present. U-Boot removes all disabled nodes before
> boot. Even if it did not, kernel ignores disabled nodes here.

Marek

Marek Behún (3):
  arm64: dts: marvell: armada-37xx: add SPI CS1 pinctrl
  dt-bindings: marvell: document Turris Mox compatible
  arm64: dts: marvell: add DTS for Turris Mox

 .../bindings/arm/marvell/armada-37xx.txt      |   8 +
 arch/arm64/boot/dts/marvell/Makefile          |   1 +
 .../dts/marvell/armada-3720-turris-mox.dts    | 840 ++++++++++++++++++
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi  |   5 +
 4 files changed, 854 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts

-- 
2.21.0
