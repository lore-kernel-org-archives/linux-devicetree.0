From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v2 0/2] Update ethernet compatible string for SiFive FU540
Date: Tue, 27 Aug 2019 10:36:02 +0530
Message-ID: <1566882364-23891-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, paul.walmsley@sifive.com, ynezz@true.cz, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

This patch series renames the compatible property to a more appropriate
string. The patchset is based on Linux-5.3-rc6 and tested on SiFive
Unleashed board

Change history:
Since v1:
- Dropped PATCH3 because it's already merged
- Change the reference url in the patch descriptions to point to a
  'lore.kernel.org' link instead of 'lkml.org'

Yash Shah (2):
  macb: bindings doc: update sifive fu540-c000 binding
  macb: Update compatibility string for SiFive FU540-C000

 Documentation/devicetree/bindings/net/macb.txt | 4 ++--
 drivers/net/ethernet/cadence/macb_main.c       | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.9.1
