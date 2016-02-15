From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v7 RESEND 3/4] arm64: dts: add mailbox node for Hi6220
Date: Mon, 15 Feb 2016 21:50:25 +0800
Message-ID: <1455544226-10094-4-git-send-email-leo.yan@linaro.org>
References: <1455544226-10094-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455544226-10094-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Leo Yan <leo.yan@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>, Bintian Wang <bintian.wang@huawei.com>, Chen Feng <puck.chen@hisilicon.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Wei Xu <xuwei5@hisilicon.com>
List-Id: devicetree@vger.kernel.org

This patch add device mailbox node for Hi6220 in DT.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 2585236..23c79e1 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -249,5 +249,13 @@
 			clocks = <&ao_ctrl 27>;
 			clock-names = "apb_pclk";
 		};
+
+		mailbox: mailbox@f7510000 {
+			compatible = "hisilicon,hi6220-mbox";
+			reg = <0x0 0xf7510000 0x0 0x1000>, /* IPC_S */
+			      <0x0 0x06dff800 0x0 0x0800>; /* Mailbox buffer */
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <3>;
+		};
 	};
 };
-- 
1.9.1
