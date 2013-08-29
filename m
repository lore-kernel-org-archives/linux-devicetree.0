From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: [PATCH 0/3 v2] clk: keystone: Add common clock drivers
Date: Thu, 29 Aug 2013 15:14:19 -0400
Message-ID: <1377803662-3509-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Mike Turquette <mturquette@linaro.org>
List-Id: devicetree@vger.kernel.org

v2:
- Aligned the bindings as per the list discussion. Removed the additional
	parameters by usage of reg-names and additional compatible fields.
- Addressed all the comments from v1 on drivers.
- Split the series into clock drivers($subject series) and
	platform, dt updates. Will post that one separately.

Special thanks to Mike and Mark for the detailed review on v1.

Series is an attempt to add the clock drivers for Keystone SOCs
based on common clock framework. A PLL drivers taking care of
SOC PLLs and a gate control driver taking clock management for
the IPs. The current Keystone based SOCs don' support dynamic power
management usecases like DVFS, SOC ilde etc and hence most of the
usage is limited to enabling clocks and finding the current clock
rate etc.

Based on to of Mike's dt binding series [1] and tested on Keystone2
EVM.

Cc: Mike Turquette <mturquette@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>

Santosh Shilimkar (3):
  clk: keystone: add Keystone PLL clock driver
  clk: keystone: Add gate control clock driver
  clk: keystone: Build Keystone clock drivers

 .../devicetree/bindings/clock/keystone-gate.txt    |   29 +++
 .../devicetree/bindings/clock/keystone-pll.txt     |   40 +++
 drivers/clk/Kconfig                                |    7 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/keystone/Makefile                      |    1 +
 drivers/clk/keystone/gate.c                        |  264 ++++++++++++++++++++
 drivers/clk/keystone/pll.c                         |  215 ++++++++++++++++
 7 files changed, 557 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/keystone-gate.txt
 create mode 100644 Documentation/devicetree/bindings/clock/keystone-pll.txt
 create mode 100644 drivers/clk/keystone/Makefile
 create mode 100644 drivers/clk/keystone/gate.c
 create mode 100644 drivers/clk/keystone/pll.c

-- 
1.7.9.5
