From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Mon, 17 Jun 2019 09:49:25 +0530
Message-ID: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, nicolas.ferre@microchip.com, palmer@sifive.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com, ynezz@true.cz, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
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

Change History:
V2:
- Change compatible string from "cdns,fu540-macb" to "sifive,fu540-macb"
- Add "MACB_SIFIVE_FU540" in Kconfig to support SiFive FU540 in macb
  driver. This is needed because on FU540, the macb driver depends on
  SiFive GPIO driver.
- Avoid writing the result of a comparison to a register.
- Fix the issue of probe fail on reloading the module reported by:
  Andreas Schwab <schwab@suse.de>

Yash Shah (2):
  macb: bindings doc: add sifive fu540-c000 binding
  macb: Add support for SiFive FU540-C000

 Documentation/devicetree/bindings/net/macb.txt |   3 +
 drivers/net/ethernet/cadence/Kconfig           |   6 ++
 drivers/net/ethernet/cadence/macb_main.c       | 129 +++++++++++++++++++++++++
 3 files changed, 138 insertions(+)

-- 
1.9.1
