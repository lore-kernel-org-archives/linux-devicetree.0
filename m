From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH v2] DT node for SiFive FU540 Ethernet Controller driver
Date: Fri, 21 Jun 2019 16:23:48 +0530
Message-ID: <1561114429-29612-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, paul.walmsley@sifive.com, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

This patch-set is based on 'riscv-for-v5.2/fixes-rc6' tag of
git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git

Tested on HiFive Unleashed board with additional patches required for
testing can be found at dev/yashs/ethernet_dt_v2 branch of:
https://github.com/yashshah7/riscv-linux.git

Change history:
v2:
- Set "status = disabled" in DTSI file and enable it in Board DTS file
- Move PHY related nodes into board DTS file

Yash Shah (1):
  riscv: dts: Add DT node for SiFive FU540 Ethernet controller driver

 arch/riscv/boot/dts/sifive/fu540-c000.dtsi          | 16 ++++++++++++++++
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  9 +++++++++
 2 files changed, 25 insertions(+)

-- 
1.9.1
