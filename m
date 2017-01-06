From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 0/9] Use mmio-sram driver for Keystone MSMC RAM
Date: Fri, 6 Jan 2017 15:57:24 -0600
Message-ID: <20170106215733.41637-1-s-anna@ti.com>
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
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Vitaly Andrianov <vitalya@ti.com>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Rob Herring <robh+dt@kernel.org>, Murali Karicheri <m-karicheri2@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

The Keystone 2 family of SoCs have an on-chip RAM called the
Multicore Shared Memory (MSM) RAM. This RAM is accessible through
the Multicore Shared Memory Controller (MSMC). This series represents
these on-chip RAMs as sram nodes so that the memory allocations
can be managed by the in-kernel mmio-sram driver.

This is v2 of the previous series [1], and now includes 4 additional
patches that reserve the portions of the MSMC RAM used by the
Keystone Boot Monitor. The first 5 patches are essentially the same
as in v1, with minor commit description updates for using the proper
SoC names, but no code changes.

Patches baselined on 4.10-rc1.

regards
Suman

[1] http://marc.info/?l=linux-arm-kernel&m=147277092730387&w=2

Suman Anna (9):
  ARM: dts: keystone-k2hk: Add MSM RAM node
  ARM: dts: keystone-k2l: Add MSM RAM node
  ARM: dts: keystone-k2e: Add MSM RAM node
  ARM: dts: keystone-k2g: Add MSM RAM node
  ARM: configs: keystone: Enable Generic on-chip SRAM driver
  ARM: dts: keystone-k2hk: Reserve MSM RAM for boot monitor
  ARM: dts: keystone-k2l: Reserve MSM RAM for boot monitor
  ARM: dts: keystone-k2e: Reserve MSM RAM for boot monitor
  ARM: dts: keystone-k2g: Reserve MSM RAM for boot monitor

 arch/arm/boot/dts/keystone-k2e.dtsi  | 12 ++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi  | 12 ++++++++++++
 arch/arm/boot/dts/keystone-k2hk.dtsi | 12 ++++++++++++
 arch/arm/boot/dts/keystone-k2l.dtsi  | 12 ++++++++++++
 arch/arm/configs/keystone_defconfig  |  1 +
 5 files changed, 49 insertions(+)

-- 
2.10.2
