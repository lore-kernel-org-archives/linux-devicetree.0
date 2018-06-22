From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH 1/3] dt-bindings: k3dma: add optional property dma_min_chan
Date: Fri, 22 Jun 2018 11:24:14 +0800
Message-ID: <20180622032416.20133-2-guodong.xu@linaro.org>
References: <20180622032416.20133-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180622032416.20133-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, dan.j.williams@intel.com
Cc: liyu65@hisilicon.com, suzhuangluan@hisilicon.com, xuhongtao8@hisilicon.com, zhongkaihua@huawei.com, xuezhiliang@hisilicon.com, xupeng7@huawei.com, sunliang10@huawei.com, fengbaopeng@hisilicon.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Li Yu <liyu65@hisilicon.com>

Add optional property dma_min_chan for k3dma.

Signed-off-by: Li Yu <liyu65@hisilicon.com>
---
 Documentation/devicetree/bindings/dma/k3dma.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
index 4945aeac4dc4..2fa1370c3173 100644
--- a/Documentation/devicetree/bindings/dma/k3dma.txt
+++ b/Documentation/devicetree/bindings/dma/k3dma.txt
@@ -12,6 +12,11 @@ Required properties:
 		have specific request line
 - clocks: clock required
 
+Optional properties:
+- dma_min_chan: the minimum number of DMA channel which begin to use
+		the default value is 0, but in some platform is
+		configured 1, like hi3660 platform
+
 Example:
 
 Controller:
@@ -21,6 +26,7 @@ Controller:
 			#dma-cells = <1>;
 			dma-channels = <16>;
 			dma-requests = <27>;
+			dma_min_chan = <1>;
 			interrupts = <0 12 4>;
 			clocks = <&pclk>;
 		};
-- 
2.17.1
