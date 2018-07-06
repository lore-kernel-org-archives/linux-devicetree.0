From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: k3dma: add optional property hisilicon,dma-min-chan
Date: Fri,  6 Jul 2018 11:55:18 +0800
Message-ID: <20180706035521.13736-2-guodong.xu@linaro.org>
References: <20180706035521.13736-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180706035521.13736-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, dan.j.williams@intel.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: liyu65@hisilicon.com, suzhuangluan@hisilicon.com, xuhongtao8@hisilicon.com, zhongkaihua@huawei.com, xuezhiliang@hisilicon.com, xupeng7@huawei.com, sunliang10@huawei.com, fengbaopeng@hisilicon.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Li Yu <liyu65@hisilicon.com>

Add optional property hisilicon,dma-min-chan for k3dma.

Signed-off-by: Li Yu <liyu65@hisilicon.com>
Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 Documentation/devicetree/bindings/dma/k3dma.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
index 4945aeac4dc4..f34202a80f3c 100644
--- a/Documentation/devicetree/bindings/dma/k3dma.txt
+++ b/Documentation/devicetree/bindings/dma/k3dma.txt
@@ -12,6 +12,11 @@ Required properties:
 		have specific request line
 - clocks: clock required
 
+Optional properties:
+- hisilicon,dma-min-chan: the minimum DMA channel number which is usable
+		Default value is 0, but in some platform it is
+		configured 1, like in hi3660 platform
+
 Example:
 
 Controller:
@@ -21,6 +26,7 @@ Controller:
 			#dma-cells = <1>;
 			dma-channels = <16>;
 			dma-requests = <27>;
+			hisilicon,dma-min-chan = <1>;
 			interrupts = <0 12 4>;
 			clocks = <&pclk>;
 		};
-- 
2.17.1
