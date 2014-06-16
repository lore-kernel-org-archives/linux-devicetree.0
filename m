From: Alex Elder <elder@linaro.org>
Subject: [PATCH v5 3/5] ARM: configs: enable SMP in bcm_defconfig
Date: Mon, 16 Jun 2014 14:39:45 -0500
Message-ID: <1402947587-13898-4-git-send-email-elder@linaro.org>
References: <1402947587-13898-1-git-send-email-elder@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402947587-13898-1-git-send-email-elder@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mporter@linaro.org, bcm@fixthebug.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, arnd@arndb.de, sboyd@codeaurora.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Also explicitly set CONFIG_NR_CPUS to 2, limiting it to the most we
currently need.

Signed-off-by: Ray Jui <rjui@broadcom.com>
Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm/configs/bcm_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/bcm_defconfig b/arch/arm/configs/bcm_defconfig
index dcfc559..0339c5e 100644
--- a/arch/arm/configs/bcm_defconfig
+++ b/arch/arm/configs/bcm_defconfig
@@ -27,6 +27,7 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM_MOBILE=y
 CONFIG_ARM_THUMBEE=y
+CONFIG_SMP=y
 CONFIG_PREEMPT=y
 CONFIG_AEABI=y
 # CONFIG_COMPACTION is not set
-- 
1.9.1
