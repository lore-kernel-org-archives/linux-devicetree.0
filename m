From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 2/8 v5] Documentation: bindings: dma: Add binding for dma-channel-mask
Date: Thu, 24 Jan 2019 12:24:17 -0800
Message-ID: <1548361463-28372-3-git-send-email-john.stultz@linaro.org>
References: <1548361463-28372-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548361463-28372-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some dma channels can be reserved for secure mode or other
hardware on the SoC, so provide a binding for a bitmask
listing the available channels for the kernel to use.

This follows the pre-existing bcm,dma-channel-mask binding.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Tanglei Han <hantanglei@huawei.com>
Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
Cc: Ryan Grachek <ryan@edited.us>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3: Renamed to hisi-dma-avail-chan
v4: Reworked to generic dma-channel-mask
---
 Documentation/devicetree/bindings/dma/dma.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/dma.txt b/Documentation/devicetree/bindings/dma/dma.txt
index 6312fb0..eeb4e4d 100644
--- a/Documentation/devicetree/bindings/dma/dma.txt
+++ b/Documentation/devicetree/bindings/dma/dma.txt
@@ -16,6 +16,9 @@ Optional properties:
 - dma-channels: 	Number of DMA channels supported by the controller.
 - dma-requests: 	Number of DMA request signals supported by the
 			controller.
+- dma-channel-mask:	Bitmask of available DMA channels in ascending order
+			that are not reserved by firmware and are available to
+			the kernel. i.e. first channel corresponds to LSB.
 
 Example:
 
@@ -29,6 +32,7 @@ Example:
 		#dma-cells = <1>;
 		dma-channels = <32>;
 		dma-requests = <127>;
+		dma-channel-mask = <0xfffe>
 	};
 
 * DMA router
-- 
2.7.4
