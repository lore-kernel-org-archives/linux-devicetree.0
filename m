From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH 0/4] deprecate regulator-compatible DT property
Date: Mon, 24 Sep 2012 13:24:59 -0600
Message-ID: <1348514703-10152-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Laxman Dewangan <ldewangan@nvidia.com>, AnilKumar Ch <anilkumar@ti.com>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

As explained in patch 1, this series deprecates the regulator-compatible
DT property, and updates various binding documentation and examples for
this change.

I expect patches 1-3 to go into various regulator topic trees, and patch
4 to go into the MFD tree.

Stephen Warren (4):
  regulator: deprecate regulator-compatible DT property
  regulator: tps65217.txt: remove regulator-compatible from DT docs
  regulator: tps6586x: remove regulator-compatible from DT docs
  mfd: max8907: remove regulator-compatible from DT docs

 .../devicetree/bindings/regulator/max8907.txt      |   24 +++-----
 .../devicetree/bindings/regulator/regulator.txt    |    5 +-
 .../devicetree/bindings/regulator/tps65217.txt     |   31 ++-------
 .../devicetree/bindings/regulator/tps6586x.txt     |   66 ++++++--------------
 drivers/regulator/of_regulator.c                   |   25 ++++----
 5 files changed, 50 insertions(+), 101 deletions(-)
