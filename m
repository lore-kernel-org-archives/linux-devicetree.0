From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 2/8 v3] Documentation: bindings: k3dma: Add binding for hisi-dma-avail-chan
Date: Thu, 10 Jan 2019 09:34:06 -0800
Message-ID: <1547141652-8660-3-git-send-email-john.stultz@linaro.org>
References: <1547141652-8660-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547141652-8660-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
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
v3: Renamed to hisi-dma-avail-chan
---
 Documentation/devicetree/bindings/dma/k3dma.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
index 10a2f15..38825d4 100644
--- a/Documentation/devicetree/bindings/dma/k3dma.txt
+++ b/Documentation/devicetree/bindings/dma/k3dma.txt
@@ -14,6 +14,9 @@ Required properties:
 		have specific request line
 - clocks: clock required
 
+Optional properties:
+- hisi-dma-avail-chan: Bitmask of available physical channels
+
 Example:
 
 Controller:
-- 
2.7.4
