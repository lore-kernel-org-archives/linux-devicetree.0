From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH 0/3] k3dma: add support to reserved channels
Date: Fri, 22 Jun 2018 11:24:13 +0800
Message-ID: <20180622032416.20133-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, dan.j.williams@intel.com
Cc: liyu65@hisilicon.com, suzhuangluan@hisilicon.com, xuhongtao8@hisilicon.com, zhongkaihua@huawei.com, xuezhiliang@hisilicon.com, xupeng7@huawei.com, sunliang10@huawei.com, fengbaopeng@hisilicon.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

This patchset fixes bug people found on hikey960 when allocating DMA
channels to peripherals such as SPI. It fails because the channel is
reserved, and is not accessible by kernel.

Patch 1 and 2 add support to reserved channels for K3 DMA. Patch 3
includes a removal of axi_config who controls DMA secure/non-secure
access permission but is actually set in early stage by bootloader.

Li Yu (3):
  dt-bindings: k3dma: add optional property dma_min_chan
  k3dma: add support to reserved minimum channels
  k3dma: delete axi_config

 Documentation/devicetree/bindings/dma/k3dma.txt |  6 ++++++
 drivers/dma/k3dma.c                             | 16 ++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

-- 
2.17.1
