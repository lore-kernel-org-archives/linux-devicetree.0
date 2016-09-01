From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/5] Use mmio-sram driver for Keystone MSMC RAM
Date: Thu, 1 Sep 2016 17:58:41 -0500
Message-ID: <20160901225846.31058-1-s-anna@ti.com>
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

The first 4 patches adds the basic SRAM nodes on each of the SoCs,
and the last patch enables the generic on-chip SRAM driver for
keystone defconfig.

regards
Suman


Suman Anna (5):
  ARM: dts: keystone-k2hk: Add MSM RAM node
  ARM: dts: keystone-k2l: Add MSM RAM node
  ARM: dts: keystone-k2e: Add MSM RAM node
  ARM: dts: keystone-k2g: Add MSM RAM node
  ARM: configs: keystone: Enable Generic on-chip SRAM driver

 arch/arm/boot/dts/keystone-k2e.dtsi  | 8 ++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi  | 8 ++++++++
 arch/arm/boot/dts/keystone-k2hk.dtsi | 8 ++++++++
 arch/arm/boot/dts/keystone-k2l.dtsi  | 8 ++++++++
 arch/arm/configs/keystone_defconfig  | 1 +
 5 files changed, 33 insertions(+)

-- 
2.9.3
