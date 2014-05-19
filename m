From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH net-next 0/4] broadcom drivers and fixed-link doc updates
Date: Mon, 19 May 2014 12:43:41 -0700
Message-ID: <1400528625-32744-1-git-send-email-f.fainelli@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

David, Thomas,

This patch series converts GENET and SYSTEMPORT to use the new fixed PHY
OF helpers and progressively get rid of of_phy_connect_fixed_link().

The second part of the patch set makes sure that we document the old 5-digit
fixed-link property in a central location and update all current users to
refer to it.

Thanks!

Florian Fainelli (4):
  net: bcmgenet: use the new fixed PHY helpers
  net: systemport: use the new fixed PHY helpers
  Documentation: devicetree: add old and deprecated 'fixed-link'
  Documentation: devicetree: net: refer to fixed-link.txt

 .../devicetree/bindings/net/broadcom-bcmgenet.txt  |  2 +-
 .../bindings/net/broadcom-systemport.txt           |  2 +-
 .../devicetree/bindings/net/fixed-link.txt         |  7 +++++++
 .../devicetree/bindings/net/fsl-tsec-phy.txt       |  5 +----
 drivers/net/ethernet/broadcom/bcmsysport.c         | 18 ++++++++++++++++--
 drivers/net/ethernet/broadcom/bcmsysport.h         |  1 +
 drivers/net/ethernet/broadcom/genet/bcmmii.c       | 22 ++++++++++++++--------
 7 files changed, 41 insertions(+), 16 deletions(-)

-- 
1.9.1
