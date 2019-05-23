From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 0/2] net: macb: Add support for SiFive FU540-C000
Date: Thu, 23 May 2019 17:15:50 +0530
Message-ID: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, aou@eecs.berkeley.edu, ynezz@true.cz, paul.walmsley@sifive.com, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

On FU540, the management IP block is tightly coupled with the Cadence
MACB IP block. It manages many of the boundary signals from the MACB IP
This patchset controls the tx_clk input signal to the MACB IP. It
switches between the local TX clock (125MHz) and PHY TX clocks. This
is necessary to toggle between 1Gb and 100/10Mb speeds.

Future patches may add support for monitoring or controlling other IP
boundary signals.

This patchset is mostly based on work done by
Wesley Terpstra <wesley@sifive.com>

This patchset is based on Linux v5.2-rc1 and tested on HiFive Unleashed
board with additional board related patches needed for testing can be
found at dev/yashs/ethernet branch of:
https://github.com/yashshah7/riscv-linux.git

Yash Shah (2):
  net/macb: bindings doc: add sifive fu540-c000 binding
  net: macb: Add support for SiFive FU540-C000

 Documentation/devicetree/bindings/net/macb.txt |   3 +
 drivers/net/ethernet/cadence/macb_main.c       | 118 +++++++++++++++++++++++++
 2 files changed, 121 insertions(+)

-- 
1.9.1
