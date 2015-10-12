From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 3/4] arm64: dts: add mailbox node for Hi6220
Date: Tue, 13 Oct 2015 00:32:14 +0800
Message-ID: <1444667535-16948-4-git-send-email-leo.yan@linaro.org>
References: <1444667535-16948-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444667535-16948-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Leo Yan <leo.yan@linaro.org>, Bintian Wang <bintian.wang@huawei.com>, Yiping Xu <xuyiping@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch add device mailbox node for Hi6220 in DT.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index e83802a..76560fa 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -207,5 +207,13 @@
 			clocks = <&ao_ctrl 27>, <&ao_ctrl 27>;
 			clock-names = "apb_pclk", "apb_pclk";
 		};
+
+		mailbox: mailbox@f7510000 {
+			#mbox-cells = <1>;
+			compatible = "hisilicon,hi6220-mbox";
+			reg = <0x0 0xf7510000 0x0 0x1000>, /* IPC_S */
+			      <0x0 0x06dff800 0x0 0x0800>; /* Mailbox buffer */
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
-- 
1.9.1
