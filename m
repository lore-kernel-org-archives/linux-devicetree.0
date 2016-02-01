From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v5 3/4] arm64: dts: add mailbox node for Hi6220
Date: Mon,  1 Feb 2016 21:34:46 +0800
Message-ID: <1454333687-20421-4-git-send-email-leo.yan@linaro.org>
References: <1454333687-20421-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454333687-20421-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Leo Yan <leo.yan@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Wei Xu <xuwei5@hisilicon.com>, Tyler Baker <tyler.baker@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Chen Feng <puck.chen@hisilicon.com>, Bintian Wang <bintian.wang@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Haojian Zhuang <haojian.zhuang@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch add device mailbox node for Hi6220 in DT.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 2585236..be3d962 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -249,5 +249,17 @@
 			clocks = <&ao_ctrl 27>;
 			clock-names = "apb_pclk";
 		};
+
+		mailbox: mailbox@f7510000 {
+			#mbox-cells = <1>;
+			compatible = "hisilicon,hi6220-mbox";
+			reg = <0x0 0xf7510000 0x0 0x1000>, /* IPC_S */
+			      <0x0 0x06dff800 0x0 0x0800>; /* Mailbox buffer */
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			mbox_stub_clock: mbox_stub_clock {
+				hi6220,mbox-rx = <0 1 10>;
+				hi6220,mbox-tx = <1 0 11>;
+			};
+		};
 	};
 };
-- 
1.9.1
