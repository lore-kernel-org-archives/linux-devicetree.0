From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH 5/6] arm64: dts: Add IPROC RNG200 DT node for NS2
Date: Fri, 2 Oct 2015 23:24:22 +0530
Message-ID: <1443808463-21120-6-git-send-email-anup.patel@broadcom.com>
References: <1443808463-21120-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443808463-21120-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Vikram Prakash <vikramp@broadcom.com>, Anup Patel <anup.patel@broadcom.com>, Pramod KUMAR <pramodku@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

We have IPROC RNG200 hardware random number generation in
NS2 SoC, lets enable it for NS2 in NS2 DT.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Pramod KUMAR <pramodku@broadcom.com>
Reviewed-by: Vikram Prakash <vikramp@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index bc31c0e..92ecf1c 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -187,5 +187,10 @@
 			clock-frequency = <23961600>;
 			status = "disabled";
 		};
+
+		hwrng: hwrng@66220000 {
+			compatible = "brcm,iproc-rng200";
+			reg = <0x66220000 0x28>;
+		};
 	};
 };
-- 
1.9.1
