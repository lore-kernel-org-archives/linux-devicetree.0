From: h00249924 <hutenghui@huawei.com>
Subject: [PATCH 3/3] arm64: dts: hi3660: Add hisi asp dma device
Date: Fri, 28 Dec 2018 14:36:23 +0800
Message-ID: <1545978983-124360-3-git-send-email-hutenghui@huawei.com>
References: <1545978983-124360-1-git-send-email-hutenghui@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545978983-124360-1-git-send-email-hutenghui@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liyuequan@hisilicon.com, cash.qianli@hisilicon.com, huangli295@hisilicon.com, hantanglei@huawei.com, wangyoulin1@hisilicon.com, ninggaoyu@hisilicon.com, hanxiaolong3@hisilicon.com, Youlin Wang <wwx575822@notesmail.huawei.com>, John Stultz <john.stultz@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

From: Youlin Wang <wwx575822@notesmail.huawei.com>

Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Youlin Wang <wwx575822@notesmail.huawei.com>
Signed-off-by: Tanglei Han <hantanglei@huawei.com>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index f432b0a..5223e36 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -1122,5 +1122,19 @@
 				};
 			};
 		};
+
+		asp_dmac: asp_dmac@E804B000 {
+			compatible = "hisilicon,hisi-pcm-asp-dma-1.0";
+			reg = <0x0 0xe804b000 0x0 0x1000>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			dma-requests = <32>;
+			dma-min-chan = <0>;
+			dma-used-chans = <0xFFFE>;
+			dma-share;
+			interrupts = <0 216 4>;
+			interrupt-names = "asp_dma_irq";
+			status = "ok";
+		};
 	};
 };
-- 
1.9.1
