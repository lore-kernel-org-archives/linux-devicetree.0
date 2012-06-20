From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V3 0/3] regulator: dt: add policy to match regulator with prop "regulator-compatible"
Date: Wed, 20 Jun 2012 17:53:04 +0530
Message-ID: <1340194987-23654-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com, lrg@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, arnd@arndb.de, linus.walleij@linaro.org, lee.jones@linaro.org, swarren@wwwdotorg.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

and patch V1 of this series:
add policy to match regulator with the property of "regulator-compatible" of each
child regulator node with their hardware counterparts name.
Modify documentation as well to reflect this change and dts files.

Changes from V1: 
- Modify the existing of_regulator_match() to use the property 
  "regulator-compatible" of each child node of regulator for 
   matching rather than child node name.
- Documentation change to reflect this policy who are using the
  of_regulator_match().
- Modify the dts file to absorb this policy.

Changes from V2:
- Making modification of the db8500.dtsi as first patch.
- Add break in te match loop in of_regulator_match() when match found.
- Add the policy in the dt documentation of regulator.txt if the regulators
  nodes are under regulator node.

Laxman Dewangan (3):
  ARM: dts: db8500: add property "regulator-compatible" regulator node
  regulator: dt: regulator match by regulator-compatible
  regulator: dt: add policy to have property "regulator-compatible"

 Documentation/devicetree/bindings/mfd/tps65910.txt |   54 +++++++++++++----
 .../devicetree/bindings/regulator/regulator.txt    |    5 ++
 .../devicetree/bindings/regulator/tps6586x.txt     |   60 +++++++++++++++-----
 arch/arm/boot/dts/db8500.dtsi                      |   30 ++++++++++
 drivers/regulator/of_regulator.c                   |   51 +++++++++++------
 5 files changed, 154 insertions(+), 46 deletions(-)
