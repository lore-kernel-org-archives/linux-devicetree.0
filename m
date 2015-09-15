From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 3/3] arm64: dts: add Hi6220 mailbox node
Date: Tue, 15 Sep 2015 22:37:57 +0800
Message-ID: <1442327877-2620-4-git-send-email-leo.yan@linaro.org>
References: <1442327877-2620-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442327877-2620-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bintian Wang <bintian.wang@huawei.com>, haojian.zhuang@linaro.org, Yiping Xu <xuyiping@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, guodong.xu@linaro.org, zhangjian001@hisilicon.com, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, kongfei@hisilicon.com, Guangyue Zeng <zengguangyue@hisilicon.com>, leif.lindholm@linaro.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

On Hi6220, below memory regions in DDR have specific purpose:

  0x05e0,0000 - 0x05ef,ffff: For MCU firmware using at runtime;
  0x06df,f000 - 0x06df,ffff: For mailbox message data;
  0x0740,f000 - 0x0740,ffff: For MCU firmware's section;
  0x3e00,0000 - 0x3fff,ffff: For OP-TEE.

This patch reserves these memory regions and add device node for
mailbox in dts.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 16 ++++++++++++----
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      |  8 ++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index e36a539..e3f4cb3 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -7,9 +7,6 @@
 
 /dts-v1/;
 
-/*Reserved 1MB memory for MCU*/
-/memreserve/ 0x05e00000 0x00100000;
-
 #include "hi6220.dtsi"
 
 / {
@@ -24,8 +21,19 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	/*
+	 * Reserve below regions from memory node:
+	 *
+	 *  - 0x05e0,0000 - 0x05ef,ffff: MCU firmware runtime using
+	 *  - 0x06df,f000 - 0x06df,ffff: Mailbox message data
+	 *  - 0x0740,f000 - 0x0740,ffff: MCU firmware section
+	 *  - 0x3e00,0000 - 0x3fff,ffff: OP-TEE
+	 */
 	memory@0 {
 		device_type = "memory";
-		reg = <0x0 0x0 0x0 0x40000000>;
+		reg = <0x00000000 0x00000000 0x00000000 0x05e00000>,
+		      <0x00000000 0x05f00000 0x00000000 0x00eff000>,
+		      <0x00000000 0x06e00000 0x00000000 0x0060f000>,
+		      <0x00000000 0x07410000 0x00000000 0x36bf0000>;
 	};
 };
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 3f03380..9ff25bc 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -167,5 +167,13 @@
 			clocks = <&ao_ctrl 36>, <&ao_ctrl 36>;
 			clock-names = "uartclk", "apb_pclk";
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
