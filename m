From: Iyappan Subramanian <isubramanian@apm.com>
Subject: [PATCH v2 0/3] drivers: net: xgene: Fix crash for backward compatibility
Date: Mon,  3 Nov 2014 11:59:53 -0800
Message-ID: <1415044796-5081-1-git-send-email-isubramanian@apm.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, patches@apm.com, kchudgar@apm.com, Iyappan Subramanian <isubramanian@apm.com>
List-Id: devicetree@vger.kernel.org

This patch set fixes the following issues that were reported during regression.

Patch 1,2 : Adds backward compatibility with the older firmware (<= 1.13.28).
Patch 3   : Use separate hardware resources (descriptor ring, prefetch buffer)
	   that are not shared with the firmware
---

Iyappan Subramanian (3):
  dtb: xgene: fix: Backward compatibility with older firmware
  drivers: net: xgene: Backward compatibility with older firmware
  drivers: net: xgene: fix: Use separate resources

 arch/arm64/boot/dts/apm-storm.dtsi                | 10 +++++-----
 drivers/net/ethernet/apm/xgene/xgene_enet_hw.c    | 18 +++++++++++++++++-
 drivers/net/ethernet/apm/xgene/xgene_enet_hw.h    |  4 ++++
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c  | 11 +++++++----
 drivers/net/ethernet/apm/xgene/xgene_enet_main.h  |  5 ++++-
 drivers/net/ethernet/apm/xgene/xgene_enet_sgmac.c |  7 ++++++-
 drivers/net/ethernet/apm/xgene/xgene_enet_xgmac.c |  7 ++++++-
 7 files changed, 49 insertions(+), 13 deletions(-)

-- 
1.9.1
