From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 2/4] arm64: Kconfig: select sp804 timer for ARCH_HISI
Date: Tue, 13 Oct 2015 08:58:14 +0800
Message-ID: <1444697896-4323-3-git-send-email-leo.yan@linaro.org>
References: <1444697896-4323-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444697896-4323-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Leo Yan <leo.yan@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Bintian Wang <bintian.wang@huawei.com>, Yiping Xu <xuyiping@hisilicon.com>, Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Select sp804 timer for ARCH_HISI, which is used as broadcast timer.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 23800a1..6d730fb 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -35,6 +35,7 @@ config ARCH_FSL_LS2085A
 
 config ARCH_HISI
 	bool "Hisilicon SoC Family"
+	select ARM_TIMER_SP804
 	help
 	  This enables support for Hisilicon ARMv8 SoC family
 
-- 
1.9.1
