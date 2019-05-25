From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 0/7] Allwinner H6 DMA support
Date: Sat, 25 May 2019 18:38:12 +0200
Message-ID: <20190525163819.21055-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Dan Williams <dan.j.williams@intel.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

This series has been first proposed by Jernej Skrabec[1].
As this series is mandatory for SPDIF/I2S support and because he is
busy on Cedrus stuff. I asked him to make the minor change requested
and repost it.
Authorship remains to him.

I have tested this series with SPDIF driver and added a patch to enable
DMA_SUN6I_CONFIG for arm64.

Original Post:
"
DMA engine engine on H6 almost the same as on older SoCs. The biggest
difference is that it has slightly rearranged bits in registers and
it needs additional clock, probably due to iommu.

These patches were tested with I2S connected to HDMI. I2S needs
additional patches which will be sent later.

Please take a look.

Best regards,
Jernej
"

Thanks,
Clément

Changes since v1:
 - Enable DMA_SUN6I in arm64 defconfig
 - Change mbus_clk to has_mbus_clk
 - Collect Rob H. reviewed-by

Clément Péron (1):
  arm64: defconfig: enable Allwinner DMA drivers

Jernej Skrabec (6):
  dt-bindings: arm64: allwinner: h6: Add binding for DMA controller
  dmaengine: sun6i: Add a quirk for additional mbus clock
  dmaengine: sun6i: Add a quirk for setting DRQ fields
  dmaengine: sun6i: Add a quirk for setting mode fields
  dmaengine: sun6i: Add support for H6 DMA
  arm64: dts: allwinner: h6: Add DMA node

 .../devicetree/bindings/dma/sun6i-dma.txt     |   9 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  12 ++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/dma/sun6i-dma.c                       | 147 +++++++++++++-----
 4 files changed, 132 insertions(+), 37 deletions(-)

-- 
2.20.1
