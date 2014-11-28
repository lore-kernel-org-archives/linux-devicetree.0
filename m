From: Wang Long <long.wanglong@huawei.com>
Subject: [PATCH 5/7] ARM: hisi: add a common smp_prepares_cpus function
Date: Fri, 28 Nov 2014 02:15:48 +0000
Message-ID: <1417140950-67103-6-git-send-email-long.wanglong@huawei.com>
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

As hix5hd2 and hip01 has the same .smp_prepare_cpus
in struct smp_operations, so rename hix5hd2_smp_prepare_cpus
to hisi_common_smp_prepare_cpus.

the hip01 will use hisi_common_smp_prepare_cpus in its
struct smp_operations.

Signed-off-by: Wang Long <long.wanglong@huawei.com>
---
 arch/arm/mach-hisi/platsmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-hisi/platsmp.c b/arch/arm/mach-hisi/platsmp.c
index 575dd82..b3c3a58 100644
--- a/arch/arm/mach-hisi/platsmp.c
+++ b/arch/arm/mach-hisi/platsmp.c
@@ -96,7 +96,7 @@ struct smp_operations hi3xxx_smp_ops __initdata = {
 #endif
 };
 
-static void __init hix5hd2_smp_prepare_cpus(unsigned int max_cpus)
+static void __init hisi_common_smp_prepare_cpus(unsigned int max_cpus)
 {
 	hisi_enable_scu_a9();
 }
@@ -125,7 +125,7 @@ static int hix5hd2_boot_secondary(unsigned int cpu, struct task_struct *idle)
 
 
 struct smp_operations hix5hd2_smp_ops __initdata = {
-	.smp_prepare_cpus	= hix5hd2_smp_prepare_cpus,
+	.smp_prepare_cpus	= hisi_common_smp_prepare_cpus,
 	.smp_boot_secondary	= hix5hd2_boot_secondary,
 #ifdef CONFIG_HOTPLUG_CPU
 	.cpu_die		= hix5hd2_cpu_die,
-- 
1.8.3.4
