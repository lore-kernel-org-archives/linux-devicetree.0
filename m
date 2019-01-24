From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 1/8 v5] Documentation: bindings: k3dma: Extend the k3dma driver binding to support hisi-asp
Date: Thu, 24 Jan 2019 12:24:16 -0800
Message-ID: <1548361463-28372-2-git-send-email-john.stultz@linaro.org>
References: <1548361463-28372-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548361463-28372-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Youlin Wang <wwx575822@notesmail.huawei.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Tanglei Han <hantanglei@huawei.com>, Ryan Grachek <ryan@edited.us>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Youlin Wang <wwx575822@notesmail.huawei.com>

Extend the k3dma driver binding to support hisi-asp hardware
variants.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
Cc: Tanglei Han <hantanglei@huawei.com>
Cc: Ryan Grachek <ryan@edited.us>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: dmaengine@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Youlin Wang <wwx575822@notesmail.huawei.com>
Signed-off-by: Tanglei Han <hantanglei@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2: Simplify patch, removing extranious examples
---
 Documentation/devicetree/bindings/dma/k3dma.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
index 4945aea..10a2f15 100644
--- a/Documentation/devicetree/bindings/dma/k3dma.txt
+++ b/Documentation/devicetree/bindings/dma/k3dma.txt
@@ -3,7 +3,9 @@
 See dma.txt first
 
 Required properties:
-- compatible: Should be "hisilicon,k3-dma-1.0"
+- compatible: Must be one of
+-              "hisilicon,k3-dma-1.0"
+-              "hisilicon,hisi-pcm-asp-dma-1.0"
 - reg: Should contain DMA registers location and length.
 - interrupts: Should contain one interrupt shared by all channel
 - #dma-cells: see dma.txt, should be 1, para number
-- 
2.7.4
