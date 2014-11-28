From: Wang Long <long.wanglong@huawei.com>
Subject: [PATCH 4/7] ARM: config: enable ARCH_HIP01
Date: Fri, 28 Nov 2014 02:15:47 +0000
Message-ID: <1417140950-67103-5-git-send-email-long.wanglong@huawei.com>
References: <1417140950-67103-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1417140950-67103-1-git-send-email-long.wanglong@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: xuwei5@hisilicon.com, arnd@arndb.de, yanhaifeng@gmail.com, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, jason@lakedaemon.net, jh80.chung@samsung.com, khilman@linaro.org, lee.jones@linaro.org, linux@arm.linux.org.uk, long.wanglong@huawei.com, mark.rutland@arm.com, maxime.ripard@free-electrons.com, obh+dt@kernel.org, olof@lixom.net, pawel.moll@arm.com, swarren@nvidia.com, thomas.petazzoni@free-electrons.com
Cc: huxinwei@huawei.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, peifeiyue@huawei.com
List-Id: devicetree@vger.kernel.org

Make hip01 share the hisi_defconfig.
And add it into multi_v7_defconfig too.

Signed-off-by: Wang Long <long.wanglong@huawei.com>
---
 arch/arm/configs/hisi_defconfig     | 1 +
 arch/arm/configs/multi_v7_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/hisi_defconfig b/arch/arm/configs/hisi_defconfig
index 1772505..33b0b76 100644
--- a/arch/arm/configs/hisi_defconfig
+++ b/arch/arm/configs/hisi_defconfig
@@ -6,6 +6,7 @@ CONFIG_RD_LZMA=y
 CONFIG_ARCH_HISI=y
 CONFIG_ARCH_HI3xxx=y
 CONFIG_ARCH_HIX5HD2=y
+CONFIG_ARCH_HIP01=y
 CONFIG_ARCH_HIP04=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=16
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 9d7a32f..df335a2 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -28,6 +28,7 @@ CONFIG_ARCH_HIGHBANK=y
 CONFIG_ARCH_HISI=y
 CONFIG_ARCH_HI3xxx=y
 CONFIG_ARCH_HIX5HD2=y
+CONFIG_ARCH_HIP01=y
 CONFIG_ARCH_HIP04=y
 CONFIG_ARCH_KEYSTONE=y
 CONFIG_ARCH_MESON=y
-- 
1.8.3.4
