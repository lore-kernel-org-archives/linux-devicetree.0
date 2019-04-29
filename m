From: Gerald BAEZA <gerald.baeza@st.com>
Subject: [PATCH 0/5] stm32-ddr-pmu driver creation
Date: Mon, 29 Apr 2019 10:03:27 +0000
Message-ID: <1556532194-27904-1-git-send-email-gerald.baeza@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "will.deacon@arm.com" <will.deacon@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "arnd@arndb.de" <arnd@arndb.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gerald BAEZA <gerald.baeza@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.

This series adds support for the DDRPERFM via a new stm32-ddr-pmu driver,
registered into the perf framework.

This driver is inspired from arch/arm/mm/cache-l2x0-pmu.c

This series depends on the "clk: stm32mp1: Add ddrperfm clock" patch,
sent separately.

Gerald Baeza (5):
  Documentation: perf: stm32: ddrperfm support
  dt-bindings: perf: stm32: ddrperfm support
  perf: stm32: ddrperfm driver creation
  ARM: configs: enable STM32_DDR_PMU
  ARM: dts: stm32: add ddrperfm on stm32mp157c

 .../devicetree/bindings/perf/stm32-ddr-pmu.txt     |  18 +
 Documentation/perf/stm32-ddr-pmu.txt               |  41 ++
 arch/arm/boot/dts/stm32mp157c.dtsi                 |   9 +
 arch/arm/configs/multi_v7_defconfig                |   1 +
 drivers/perf/Kconfig                               |   6 +
 drivers/perf/Makefile                              |   1 +
 drivers/perf/stm32_ddr_pmu.c                       | 502 +++++++++++++++++++++
 7 files changed, 578 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
 create mode 100644 Documentation/perf/stm32-ddr-pmu.txt
 create mode 100644 drivers/perf/stm32_ddr_pmu.c

-- 
2.7.4
