From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH v3 0/2] phy: ocelot-serdes: fix out-of-bounds read
Date: Fri, 19 Oct 2018 11:18:43 +0200
Message-ID: <cover.1539940387.git.gustavo@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, "David S. Miller" <davem@davemloft.net>, Quentin Schulz <quentin.schulz@bootlin.com>, netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
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

Thanks!

Changes in v3:
 - Post the series to netdev, so Dave can take it.

Changes in v2:
 - Send the whole series to Kishon Vijay Abraham I, so it
   can be taken into the PHY tree.
 - Add Quentin's Reviewed-by to commit log in both patches.

Gustavo A. R. Silva (2):
  dt-bindings: phy: Update SERDES_MAX to be SERDES_MAX + 1
  phy: ocelot-serdes: fix out-of-bounds read

 drivers/phy/mscc/phy-ocelot-serdes.c        | 4 ++--
 include/dt-bindings/phy/phy-ocelot-serdes.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.7.4
