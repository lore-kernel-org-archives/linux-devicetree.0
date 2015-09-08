From: Iyappan Subramanian <isubramanian@apm.com>
Subject: [PATCH net-next 0/2] driver: net: xgene: Enable 2nd 10GbE port on APM X-Gene SoC
Date: Tue,  8 Sep 2015 15:50:25 -0700
Message-ID: <1441752627-9326-1-git-send-email-isubramanian@apm.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@apm.com, Iyappan Subramanian <isubramanian@apm.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for 2nd 10GbE on APM X-Gene SoC

---
Iyappan Subramanian (2):
  driver: net: xgene: Add support for 2nd 10GbE port
  dtb: xgene: Add 2nd 10GbE node

 arch/arm64/boot/dts/apm/apm-storm.dtsi           | 28 ++++++++++++++++++++++++
 drivers/net/ethernet/apm/xgene/xgene_enet_hw.c   |  3 ++-
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c | 16 ++++++++++----
 drivers/net/ethernet/apm/xgene/xgene_enet_main.h |  5 +++++
 4 files changed, 47 insertions(+), 5 deletions(-)

-- 
1.9.1
