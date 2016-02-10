From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH 5/6] arm64: dts: Add ARM SP805 watchdog DT node for NS2
Date: Wed, 10 Feb 2016 11:40:50 +0530
Message-ID: <1455084651-29325-6-git-send-email-anup.patel@broadcom.com>
References: <1455084651-29325-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455084651-29325-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

We have one ARM SP805 watchdog instance on NS2 for non-secure software
hence this patch adds appropriate watchdog DT node in NS2 DT.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Pramod KUMAR <pramodku@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index 83e1c27..062616b4 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -306,6 +306,14 @@
 			status = "disabled";
 		};
 
+		wdt0: watchdog@66090000 {
+			compatible = "arm,sp805", "arm,primecell";
+			reg = <0x66090000 0x1000>;
+			interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&iprocslow>, <&iprocslow>;
+			clock-names = "wdogclk", "apb_pclk";
+		};
+
 		i2c1: i2c@660b0000 {
 			compatible = "brcm,iproc-i2c";
 			reg = <0x660b0000 0x100>;
-- 
1.9.1
