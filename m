From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/2] phy: rcar-gen2, rcar-gen3-usb2: add fallback binding
Date: Thu,  3 Mar 2016 09:38:36 +0900
Message-ID: <1456965518-13615-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Add fallback compatibility strings for rcar phy drivers.

In the case of Renesas R-Car hardware we know that there are generations of
SoCs, e.g. Gen 2 and Gen 3. But beyond that its not clear what the
relationship between IP blocks might be. For example, I believe that
r8a7790 is older than r8a7791 but that doesn't imply that the latter is a
descendant of the former or vice versa.

We can, however, by examining the documentation and behaviour of the
hardware at run-time observe that the current driver implementation appears
to be compatible with the IP blocks on SoCs within a given generation.

For the above reasons and convenience when enabling new SoCs a
per-generation fallback compatibility string scheme being adopted for
drivers for Renesas SoCs.

Changes since v1:
* Update new compatibility strings to match the preferred scheme for
  ordering elements
* Rebase

Based on linux-phy/next

Simon Horman (2):
  phy: rcar-gen2: add fallback binding
  phy: rcar-gen3-usb2: add fallback binding

 Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt      |  8 +++++++-
 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++++--
 drivers/phy/phy-rcar-gen2.c                                  |  1 +
 drivers/phy/phy-rcar-gen3-usb2.c                             |  1 +
 4 files changed, 17 insertions(+), 3 deletions(-)

-- 
2.1.4
