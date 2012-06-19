From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 0/3] regulator: dt: add policy to match regulator with prop "regulator-compatible"
Date: Tue, 19 Jun 2012 19:58:16 +0530
Message-ID: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, linus.walleij@linaro.org, lrg@ti.com, lee.jones@linaro.org, swarren@wwwdotorg.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Based on the discussion on patch
 [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911

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

Laxman Dewangan (3):
  regulator: dt: regulator match by regulator-compatible
  regulator: dt: add policy to have property "regulator-compatible"
  ARM: dts: db8500: add node property "regulator-compatible" regulator
    node

 Documentation/devicetree/bindings/mfd/tps65910.txt |   54 ++++++--
 .../devicetree/bindings/regulator/tps6586x.txt     |   60 +++++++---
 arch/arm/boot/dts/db8500.dtsi                      |  128 +++++++++++++++-----
 drivers/regulator/of_regulator.c                   |   50 +++++---
 4 files changed, 215 insertions(+), 77 deletions(-)

