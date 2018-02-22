Return-Path: <SRS0=7KmP=FQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-sn1nam02on0053.outbound.protection.outlook.com ([104.47.36.53]:53376
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750916AbeBVXcU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 22 Feb 2018 18:32:20 -0500
From: David Daney <david.daney@cavium.com>
Subject: [PATCH v8 0/3] netdev: octeon-ethernet: Add Cavium Octeon III support.
Date: Thu, 22 Feb 2018 15:32:02 -0800
Message-Id: <20180222233205.28857-1-david.daney@cavium.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-mips@linux-mips.org, ralf@linux-mips.org, James Hogan <james.hogan@mips.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, "Steven J. Hill" <steven.hill@cavium.com>, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Philippe Ombredanne <pombredanne@nexb.com>, David Daney <david.daney@cavium.com>
List-ID: <devicetree@vger.kernel.org>

We are adding the Cavium OCTEON-III network driver.  Since interacting
with the input and output queues is done via special CPU local memory,
we also need to add support to the MIPS/Octeon architecture code.  The
four patch set to add this prerequisite code has been split out to a
seperate patch set sent to the mips-linux list.

A separate pull request was recently done by Steven Hill for the
firmware required by the driver.

Changes in v8:

o Fixed locking in bgx port functions as noted by davem.

o Corrected SPDX-License-Identifier tags.

o Split driver from prerequisite patches.

Changes in v7:

o There was no v7, we go to v8 to synchronize version numbers with
prerequisites.

Changes in v6:

o Added back cleanup patch for previous generation SoC "staging"
  driver, as Greg K-H acked it.

o Moved FPA driver to drivers/net/ethernet/cavium/octeon as it is
  currently only used by the octeon3-ethernet driver.

o Many code formatting fixes as noted by davem.

Changes in v5:

o Removed cleanup patch for previous generation SoC "staging" driver,
  as it will be sent as a follow-on.

o Fixed kernel doc formatting in all patches.

o Removed redundant licensing text boilerplate.

o Reviewed-by: header added to 2/7.

o Rewrote locking code in 3/7 to eliminate inline asm.

Changes in v4:

o Use phy_print_status() instead of open coding the equivalent.

o Print warning on phy mode mismatch.

o Improve dt-bindings and add Acked-by.

Changes in v3:

o Fix PKI (RX path) initialization to work with little endian kernel.

Changes in v2:

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

Carlos Munoz (2):
  dt-bindings: Add Cavium Octeon Common Ethernet Interface.
  netdev: octeon-ethernet: Add Cavium Octeon III support.

David Daney (1):
  MAINTAINERS: Add entry for
    drivers/net/ethernet/cavium/octeon/octeon3-*

 .../devicetree/bindings/net/cavium-bgx.txt         |   61 +
 MAINTAINERS                                        |    6 +
 drivers/net/ethernet/cavium/Kconfig                |   59 +-
 drivers/net/ethernet/cavium/octeon/Makefile        |    7 +
 .../net/ethernet/cavium/octeon/octeon3-bgx-nexus.c |  417 ++++
 .../net/ethernet/cavium/octeon/octeon3-bgx-port.c  | 2003 +++++++++++++++++++
 drivers/net/ethernet/cavium/octeon/octeon3-core.c  | 2079 ++++++++++++++++++++
 drivers/net/ethernet/cavium/octeon/octeon3-fpa.c   |  358 ++++
 drivers/net/ethernet/cavium/octeon/octeon3-pki.c   |  823 ++++++++
 drivers/net/ethernet/cavium/octeon/octeon3-pko.c   | 1688 ++++++++++++++++
 drivers/net/ethernet/cavium/octeon/octeon3-sso.c   |  301 +++
 drivers/net/ethernet/cavium/octeon/octeon3.h       |  430 ++++
 12 files changed, 8222 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/cavium-bgx.txt
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-bgx-nexus.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-bgx-port.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-core.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-fpa.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-pki.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-pko.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3-sso.c
 create mode 100644 drivers/net/ethernet/cavium/octeon/octeon3.h

-- 
2.14.3

