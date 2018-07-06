From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v2 0/4] k3dma: add support to reserved channels
Date: Fri,  6 Jul 2018 11:55:17 +0800
Message-ID: <20180706035521.13736-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, dan.j.williams@intel.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: liyu65@hisilicon.com, suzhuangluan@hisilicon.com, xuhongtao8@hisilicon.com, zhongkaihua@huawei.com, xuezhiliang@hisilicon.com, xupeng7@huawei.com, sunliang10@huawei.com, fengbaopeng@hisilicon.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

This patchset fixes bug people found on hikey960 when allocating DMA
channels to peripherals such as SPI. It fails because the channel is
reserved and not accessible by kernel.

Patch 1, 2 and 3 add support to reserved channels for K3 DMA. Patch 4
includes a removal of axi_config who controls DMA secure/non-secure
access permission but is actually set in early stage by bootloader.

Guodong Xu (1):
  arm64: dts: hi3660: update property name hisilicon,dma-min-chan

Li Yu (3):
  dt-bindings: k3dma: add optional property hisilicon,dma-min-chan
  k3dma: add support to reserved minimum channels
  k3dma: delete axi_config

 Documentation/devicetree/bindings/dma/k3dma.txt |  6 ++++++
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi       |  2 +-
 drivers/dma/k3dma.c                             | 16 ++++++++--------
 3 files changed, 15 insertions(+), 9 deletions(-)

-- 
2.17.1
