From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 RESEND 3/4] arm64: dts: add sp804 timer node for Hi6220
Date: Thu, 21 Jan 2016 18:53:49 +0800
Message-ID: <1453373630-4693-4-git-send-email-leo.yan@linaro.org>
References: <1453373630-4693-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453373630-4693-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leo Yan <leo.yan@linaro.org>, Yiping Xu <xuyiping@hisilicon.com>, Yu Dongbin <yudongbin@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, Tyler Baker <tyler.baker@linaro.org>, Bintian Wang <bintian.wang@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, Wei Xu <xuwei5@hisilicon.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add sp804 timer for hi6220, so it can be used as broadcast timer.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 82d2488..781681a 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -208,5 +208,14 @@
 			clock-names = "uartclk", "apb_pclk";
 			status = "disabled";
 		};
+
+		dual_timer0: dual_timer@f8008000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x0 0xf8008000 0x0 0x1000>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ao_ctrl 27>;
+			clock-names = "apb_pclk";
+		};
 	};
 };
-- 
1.9.1
