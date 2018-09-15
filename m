From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH net-next 0/5] net: lantiq: Minor fixes for vrx200 and gswip
Date: Sat, 15 Sep 2018 14:08:44 +0200
Message-ID: <20180915120849.24630-1-hauke@hauke-m.de>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

These are mostly minor fixes to problems addresses in the latests round 
of the review of the original series adding these driver, which were not 
applied before the patches got merged into net-next.
In addition it fixes a data bus error on poweroff.

Hauke Mehrtens (5):
  dt-bindings: net: lantiq,xrx200-net: Use lower case in hex
  dt-bindings: net: dsa: lantiq,xrx200-gswip: Fix minor style fixes
  net: lantiq: lantiq_xrx200: Move clock prepare to probe function
  net: dsa: lantiq_gswip: Minor code style improvements
  net: dsa: tag_gswip: Add gswip to dsa_tag_protocol_to_str()

 .../devicetree/bindings/net/dsa/lantiq-gswip.txt   | 18 +++++-----
 .../devicetree/bindings/net/lantiq,xrx200-net.txt  |  4 +--
 drivers/net/dsa/lantiq_gswip.c                     | 38 ++++++++++------------
 drivers/net/ethernet/lantiq_xrx200.c               | 21 +++++++-----
 net/dsa/dsa.c                                      |  3 ++
 5 files changed, 45 insertions(+), 39 deletions(-)

-- 
2.11.0
