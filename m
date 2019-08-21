From: Sunil Mohan Adapa <sunil@medhas.org>
Subject: [PATCH v3 0/2] arm64: dts: allwinner: a64: Add A64 OlinuXino board
 (with eMMC)
Date: Wed, 21 Aug 2019 12:52:15 -0700
Message-ID: <20190821195217.4166-1-sunil@medhas.org>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: maxime.ripard@bootlin.com, mark.rutland@arm.com, wens@csie.org, robh+dt@kernel.org, Sunil Mohan Adapa <sunil@medhas.org>
List-Id: devicetree@vger.kernel.org

A64 OLinuXino board from Olimex has three variants with onboard eMMC:
A64-OLinuXino-1Ge16GW, A64-OLinuXino-1Ge4GW and A64-OLinuXino-2Ge8G-IND. In
addition, there are two variants without eMMC. One without eMMC and one with SPI
flash. This suggests the need for separate device tree for the three eMMC
variants.

Changes:

  v3: Separate dts for eMMC variants

  v2: Fix descriptions for VCC and VCCQ

Version 2 of this series already committed in linux-sunxi tree as
8d3071f3e85894be35a1b35bcf6fdef970c81018 must be reverted before applying this.

Sunil Mohan Adapa (2):
  dt-bindings: arm: sunxi: Add compatible for A64 OlinuXino with eMMC
  arm64: dts: allwinner: a64: Add A64 OlinuXino board (with eMMC)

 .../devicetree/bindings/arm/sunxi.yaml        |  5 ++++
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun50i-a64-olinuxino-emmc.dts   | 23 +++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dts

-- 
2.20.1
