From: Bintian Wang <bintian.wang@huawei.com>
Subject: [PATCH 1/3] arm64: Enable Hisilicon ARMv8 SoC family in Kconfig and defconfig
Date: Thu, 5 Feb 2015 17:24:35 +0800
Message-ID: <1423128277-10297-2-git-send-email-bintian.wang@huawei.com>
References: <1423128277-10297-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423128277-10297-1-git-send-email-bintian.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, mturquette@linaro.org, rob.herring@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, xuwei5@hisilicon.com, jh80.chung@samsung.com, olof@lixom.net, yanhaifeng@gmail.com, sboyd@codeaurora.org, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, tomeu.vizoso@collabora.com, linux@arm.linux.org.uk, guodong.xu@linaro.org
Cc: xuyiping@hisilicon.com, wangbinghui@hisilicon.com, zhenwei.wang@hisilicon.com, victor.lixin@hisilicon.com, puck.chen@hisilicon.com, dan.zhao@hisilicon.com, huxinwei@huawei.com, bintian.wang@huawei.com, z.liuxinliang@huawei.com, heyunlei@huawei.com, kong.kongxinwei@hisilicon.com, btw@mail.itp.ac.cn, w.f@huawei.com, liguozhu@hisilicon.com
List-Id: devicetree@vger.kernel.org

This patch introduces ARCH_HISI to enable Hisilicon SoC family in
Kconfig and defconfig.

Signed-off-by: Bintian Wang <bintian.wang@huawei.com>
Reviewed-by: Haojian Zhuang <haojian.zhuang@linaro.org>
Reviewed-by: Wei Xu <xuwei5@hisilicon.com>
---
 arch/arm64/Kconfig           |    5 +++++
 arch/arm64/configs/defconfig |    1 +
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b1f9a20..78cd41c8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -173,6 +173,11 @@ config ARCH_XGENE
 	help
 	  This enables support for AppliedMicro X-Gene SOC Family
 
+config ARCH_HISI
+	bool "Hisilicon SoC Family"
+	help
+	  This enables support for Hisilicon ARMv8 Family of SoCs.
+
 endmenu
 
 menu "Bus support"
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5376d90..a829774 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -34,6 +34,7 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_ARCH_THUNDER=y
 CONFIG_ARCH_VEXPRESS=y
 CONFIG_ARCH_XGENE=y
+CONFIG_ARCH_HISI=y
 CONFIG_PCI=y
 CONFIG_PCI_MSI=y
 CONFIG_PCI_XGENE=y
-- 
1.7.9.5
