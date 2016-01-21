From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 RESEND 1/4] arm64: dts: Reserve memory regions for hi6220
Date: Thu, 21 Jan 2016 18:53:47 +0800
Message-ID: <1453373630-4693-2-git-send-email-leo.yan@linaro.org>
References: <1453373630-4693-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453373630-4693-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leo Yan <leo.yan@linaro.org>, Yiping Xu <xuyiping@hisilicon.com>, Yu Dongbin <yudongbin@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Chen Feng <puck.chen@hisilicon.com>, Tyler Baker <tyler.baker@linaro.org>, Bintian Wang <bintian.wang@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, Wei Xu <xuwei5@hisilicon.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Hi6220, below memory regions in DDR have specific purpose:

  0x05e0,0000 - 0x05ef,ffff: For MCU firmware using at runtime;
  0x06df,f000 - 0x06df,ffff: For mailbox message data;
  0x0740,f000 - 0x0740,ffff: For MCU firmware's section;
  0x3e00,0000 - 0x3fff,ffff: For OP-TEE.

This patch reserves these memory regions in DT.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 8d43a0f..1997e4d 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -7,9 +7,6 @@
 
 /dts-v1/;
 
-/*Reserved 1MB memory for MCU*/
-/memreserve/ 0x05e00000 0x00100000;
-
 #include "hi6220.dtsi"
 
 / {
@@ -27,8 +24,19 @@
 		stdout-path = "serial3:115200n8";
 	};
 
+	/*
+	 * Reserve below regions from memory node:
+	 *
+	 *  0x05e0,0000 - 0x05ef,ffff: MCU firmware runtime using
+	 *  0x06df,f000 - 0x06df,ffff: Mailbox message data
+	 *  0x0740,f000 - 0x0740,ffff: MCU firmware section
+	 *  0x3e00,0000 - 0x3fff,ffff: OP-TEE
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
-- 
1.9.1
