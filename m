From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 0/8 v5] k3dma patches to add support for hi3660/HiKey960
Date: Thu, 24 Jan 2019 12:24:15 -0800
Message-ID: <1548361463-28372-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Guodong Xu <guodong.xu@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Ryan Grachek <ryan@edited.us>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch series is based on recent work by Tanglei Han, and
adds support for hi3660 SoCs as found on the HiKey960 board,
along with a few patches I've been carrying.

thanks
-john

New in v5:
* Minor typo fixes, minor rework to use BIT() macros 

Cc: Tanglei Han <hantanglei@huawei.com>
Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Ryan Grachek <ryan@edited.us>
CC: devicetree@vger.kernel.org
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

John Stultz (3):
  Documentation: bindings: dma: Add binding for dma-channel-mask
  arm64: dts: hi3660: Add dma to uart nodes
  arm64: dts: hi3660: Fixup unofficial dma-min-chan to dma-channel-mask

Li Yu (2):
  dma: k3dma: Delete axi_config
  dma: k3dma: Add support for dma-channel-mask

Youlin Wang (3):
  Documentation: bindings: k3dma: Extend the k3dma driver binding to
    support hisi-asp
  dma: k3dma: Upgrade k3dma driver to support hisi_asp_dma hardware
  arm64: dts: hi3660: Add hisi asp dma device

 Documentation/devicetree/bindings/dma/dma.txt   |  4 ++
 Documentation/devicetree/bindings/dma/k3dma.txt |  4 +-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi       | 20 +++++++-
 drivers/dma/k3dma.c                             | 61 +++++++++++++++++++++----
 4 files changed, 78 insertions(+), 11 deletions(-)

-- 
2.7.4
