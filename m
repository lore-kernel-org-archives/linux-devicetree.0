From: Zhong Kaihua <zhongkaihua@huawei.com>
Subject: [PATCH 3/3] arm64: defconfig: add configs for power management on Hi3660
Date: Mon, 7 Aug 2017 17:17:14 +0800
Message-ID: <1502097434-11136-3-git-send-email-zhongkaihua@huawei.com>
References: <1502097434-11136-1-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502097434-11136-1-git-send-email-zhongkaihua@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, catalin.marinas@arm.com, will.deacon@arm.com, jassisinghbrar@gmail.com, puck.chen@hisilicon.com, leo.yan@linaro.org, wangruyi@huawei.com, zhongkaihua@huawei.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, guodong.xu@linaro.org, zhangfei.gao@linaro.org, jason.liu@linaro.org, dan.zhao@hisilicon.com, suzhuangluan@hisilicon.com, xuezhiliang@hisilicon.com, xupeng7@huawei.com, chenjun14@huawei.com, hanwei.hanwei@huawei.com, hezetong@huawei.com, wuze1@huawei.com
List-Id: devicetree@vger.kernel.org

From: Kaihua Zhong <zhongkaihua@huawei.com>

Add configs for power management on Hi3660.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Ruyi Wang <wangruyi@huawei.com>
Tested-by: Kaihua Zhong <zhongkaihua@huawei.com>

---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d599a91..518d2c6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -483,6 +485,7 @@ CONFIG_ARM_MHU=y
 CONFIG_PLATFORM_MHU=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_HI6220_MBOX=y
+CONFIG_HI3660_MBOX=y
 CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_RPMSG_QCOM_SMD=y
-- 
1.8.3.2
