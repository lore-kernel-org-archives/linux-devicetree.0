From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/2] regulator: tps65910: dt: identify regulator by prop regulator-compatible.
Date: Tue, 19 Jun 2012 11:21:25 +0530
Message-ID: <1340085087-6608-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com, lrg@ti.com, rob.herring@calxeda.com, grant.likely@secretlab.ca, swarren@wwwdotorg.org
Cc: sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Based on the discussion on patch
 [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911

adding the  property "regulator-compatible" for each regulator of device.
Modifying documentation as well to reflect this change.
Adding common API in regulators/of_regualator to match regulator
by their id. 

Laxman Dewangan (2):
  regulator: support for regulator match by regulator-compatible
  regulator: tps65910: dt: identify regulator by regulator-compatible

 Documentation/devicetree/bindings/mfd/tps65910.txt |   54 +++++++++++++----
 drivers/regulator/of_regulator.c                   |   61 ++++++++++++++++++++
 drivers/regulator/tps65910-regulator.c             |    3 +-
 include/linux/regulator/of_regulator.h             |   13 ++++
 4 files changed, 117 insertions(+), 14 deletions(-)

