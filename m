From: Iyappan Subramanian <isubramanian@apm.com>
Subject: [PATCH net-next v1 0/3] drivers: net: xgene: Add separate tx completion ring
Date: Wed, 25 Mar 2015 12:19:09 -0700
Message-ID: <1427311152-30333-1-git-send-email-isubramanian@apm.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kchudgar@apm.com, patches@apm.com, Iyappan Subramanian <isubramanian@apm.com>
List-Id: devicetree@vger.kernel.org

SGMII based 1GbE and 10GbE interfaces support multiple interrupts.
Adding separate tx completion descriptor ring and associating a dedicated irq for the TX completion.

Signed-off-by: Iyappan Subramanian <isubramanian@apm.com>
Signed-off-by: Keyur Chudgar <kchudgar@apm.com>
---

Iyappan Subramanian (3):
  Documentation: dts: xgene: Update interrupt field description
  dtb: xgene: Add interrupt for Tx completion
  drivers: net: xgene: Add separate tx completion ring

 .../devicetree/bindings/net/apm-xgene-enet.txt     |   5 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   9 +-
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c   | 141 ++++++++++++++++++---
 drivers/net/ethernet/apm/xgene/xgene_enet_main.h   |   6 +
 4 files changed, 137 insertions(+), 24 deletions(-)

-- 
1.9.1
