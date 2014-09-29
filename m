From: zhang.lyra@gmail.com
Subject: [PATCH 3/6] arm64: dts/Makefile: Add support for Spreadtrum's Shark64 SoC.
Date: Mon, 29 Sep 2014 19:48:31 +0800
Message-ID: <1411991314-6636-4-git-send-email-zhang.lyra@gmail.com>
References: <1411991314-6636-1-git-send-email-zhang.lyra@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411991314-6636-1-git-send-email-zhang.lyra@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, gregkh@linuxfoundation.org, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, galak@codeaurora.org, broonie@linaro.org, mark.rutland@arm.com, m-karicheri2@ti.com, pawel.moll@arm.com, artagnon@gmail.com, rrichter@cavium.com, robh+dt@kernel.org, will.deacon@arm.com, orsonzhai@gmail.com, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "chunyan.zhang" <chunyan.zhang@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

From: "zhizhou.zhang" <zhizhou.zhang@spreadtrum.com>

Adds build support for Spreadtrum's Shark64 SoC in arm64 dts Makefile.

Signed-off-by: zhizhou.zhang <zhizhou.zhang@spreadtrum.com>
Signed-off-by: chunyan.zhang <chunyan.zhang@spreadtrum.com>
---
 arch/arm64/boot/dts/Makefile |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index c52bdb0..7fdb9df 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -1,5 +1,6 @@
 dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb foundation-v8.dtb
 dtb-$(CONFIG_ARCH_XGENE) += apm-mustang.dtb
+dtb-$(CONFIG_ARCH_SHARK64) += sprd_shark64.dtb
 
 targets += dtbs
 targets += $(dtb-y)
-- 
1.7.9.5
