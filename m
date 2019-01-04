From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 2/8 v2] Documentation: bindings: k3dma: Add binding for dma-avail-chan
Date: Fri,  4 Jan 2019 12:56:22 -0800
Message-ID: <1546635388-13795-3-git-send-email-john.stultz@linaro.org>
References: <1546635388-13795-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546635388-13795-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some dma channels can be reserved for secure mode or other
hardware on the SoC, so provide a binding for a bitmask
listing the available channels for the kernel to use.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Tanglei Han <hantanglei@huawei.com>
Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
Cc: Ryan Grachek <ryan@edited.us>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 Documentation/devicetree/bindings/dma/k3dma.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
index 10a2f15..1c466c1 100644
--- a/Documentation/devicetree/bindings/dma/k3dma.txt
+++ b/Documentation/devicetree/bindings/dma/k3dma.txt
@@ -14,6 +14,9 @@ Required properties:
 		have specific request line
 - clocks: clock required
 
+Optional properties:
+- dma-avail-chan: Bitmask of available physical channels
+
 Example:
 
 Controller:
-- 
2.7.4
