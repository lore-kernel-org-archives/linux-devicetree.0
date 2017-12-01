From: David Daney <david.daney@cavium.com>
Subject: [PATCH v5 net-next,mips 0/7] Cavium OCTEON-III network driver.
Date: Fri,  1 Dec 2017 15:18:00 -0800
Message-ID: <20171201231807.25266-1-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Philippe Ombredanne <pombredanne@nexb.com>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

We are adding the Cavium OCTEON-III network driver.  But since
interacting with the input and output queues is done via special CPU
local memory, we also need to add support to the MIPS/Octeon
architecture code.  Aren't SoCs nice in this way?

The first five patches add the SoC support needed by the driver, the
last two add the driver and an entry in MAINTAINERS.

Since these touch several subsystems (mips, netdev), I would
propose merging via netdev, but defer to the maintainers if they think
something else would work better.

A separate pull request was recently done by Steven Hill for the
firmware required by the driver.

Changes from v4:

o Removed cleanup patch for previous generation SoC "staging" driver,
  as it will be sent as a follow-on.

o Fixed kernel doc formatting in all patches.

o Removed redundant licensing text boilerplate.

o Reviewed-by: header added to 2/7.

o Rewrote locking code in 3/7 to eliminate inline asm.

Changes from v3:

o Use phy_print_status() instead of open coding the equivalent.

o Print warning on phy mode mismatch.

o Improve dt-bindings and add Acked-by.

Changes from v2:

o Fix PKI (RX path) initialization to work with little endian kernel.

Changes from v1:

o Cleanup and use of standard bindings in the device tree bindings
  document.

o Added (hopefully) clarifying comments about several OCTEON
  architectural peculiarities.

o Removed unused testing code from the driver.

o Removed some module parameters that already default to the proper
  values.

o KConfig cleanup, including testing on x86_64, arm64 and mips.

o Fixed breakage to the driver for previous generation of OCTEON SoCs (in
  the staging directory still).

o Verified bisectability of the patch set.

Carlos Munoz (5):
  dt-bindings: Add Cavium Octeon Common Ethernet Interface.
  MIPS: Octeon: Enable LMTDMA/LMTST operations.
  MIPS: Octeon: Add a global resource manager.
  MIPS: Octeon: Add Free Pointer Unit (FPA) support.
  netdev: octeon-ethernet: Add Cavium Octeon III support.

David Daney (2):
  MIPS: Octeon: Automatically provision CVMSEG space.
  MAINTAINERS: Add entry for
    drivers/net/ethernet/cavium/octeon/octeon3-*

 .../devicetree/bindings/net/cavium-bgx.txt         |   61 +
 MAINTAINERS                                        |    6 +
 arch/mips/cavium-octeon/Kconfig                    |   35 +-
 arch/mips/cavium-octeon/Makefile                   |    2 +
 arch/mips/cavium-octeon/octeon-fpa3.c              |  363 ++++
 arch/mips/cavium-octeon/resource-mgr.c             |  351 ++++
 arch/mips/cavium-octeon/setup.c                    |   22 +-
 .../asm/mach-cavium-octeon/kernel-entry-init.h     |   20 +-
 arch/mips/include/asm/mipsregs.h                   |    2 +
 arch/mips/include/asm/octeon/octeon.h              |   45 +-
 arch/mips/include/asm/processor.h                  |    2 +-
 arch/mips/kernel/octeon_switch.S                   |    2 -
 arch/mips/mm/tlbex.c                               |   29 +-
 drivers/net/ethernet/cavium/Kconfig                |   55 +-
 drivers/net/ethernet/cavium/octeon/Makefile        |    6 +
 .../net/ethernet/cavium/octeon/octeon3-bgx-nexus.c |  701 +++++++
 .../net/ethernet/cavium/octeon/octeon3-bgx-port.c  | 2015 +++++++++++++++++++
 drivers/net/ethernet/cavium/octeon/octeon3-core.c  | 2069 ++++++++++++++++++++
 drivers/net/ethernet/cavium/octeon/octeon3-pki.c   |  824 ++++++++
 drivers/net/ethernet/cavium/octeon/octeon3-pko.c   | 1688 ++++++++++++++++
 drivers/net/ethernet/cavium/octeon/octeon3-sso.c   |  301 +++
 drivers/net/ethernet/cavium/octeon/octeon3.h       |  418 ++++
 drivers/staging/octeon/ethernet-defines.h          |    2 +-
 23 files changed, 8955 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/cavium-bgx.txt
 create mode 100644 arch/mips/cavium-octeon/octeon-fpa3.c
 create mode 100644 arch/mips/cavium-octeon/resource-mgr.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-bgx-nexus.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-bgx-port.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-core.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-pki.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-pko.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-sso.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3.h

-- 
2.14.3
