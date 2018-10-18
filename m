From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH v2 0/2] phy: ocelot-serdes: fix out-of-bounds read
Date: Thu, 18 Oct 2018 17:05:54 +0200
Message-ID: <cover.1539874459.git.gustavo@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Quentin Schulz <quentin.schulz@bootlin.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: devicetree@vger.kernel.org

This patchset aims to fix an out-of-bounds bug in
the phy-ocelot-serdes driver.

Currently, there is an out-of-bounds read on array ctrl->phys,
once variable i reaches the maximum array size of SERDES_MAX
in the for loop.

Quentin Schulz pointed out that SERDES_MAX is a valid value to
index ctrl->phys. So, I updated SERDES_MAX to be SERDES6G_MAX + 1
in include/dt-bindings/phy/phy-ocelot-serdes.h.

Then I changed the condition in the for loop from
i <= SERDES_MAX to i < SERDES_MAX in order to
complete the fix.

The reason I'm sending this fix as series is because
checkpatch reported an error when I first tried to
integrate the whole solution into a singe patch. So,
changes to dt-bindings should be sent as a separate
patch.

Changes in v2:
 - Send the whole series to Kishon Vijay Abraham I, so it
   can be taken into the PHY tree.
 - Add Quentin's Reviewed-by to commit log in both patches.

Thanks!

Gustavo A. R. Silva (2):
  dt-bindings: phy: Update SERDES_MAX to be SERDES_MAX + 1
  phy: ocelot-serdes: fix out-of-bounds read

 drivers/phy/mscc/phy-ocelot-serdes.c        | 4 ++--
 include/dt-bindings/phy/phy-ocelot-serdes.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.7.4
