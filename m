From: Ding Tianhong <dingtianhong@huawei.com>
Subject: [PATCH v3 6/6] arm64: arch_timer: acpi: add hisi timer errata data
Date: Fri, 4 Nov 2016 21:06:34 +0800
Message-ID: <1478264794-14652-6-git-send-email-dingtianhong@huawei.com>
References: <1478264794-14652-1-git-send-email-dingtianhong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1478264794-14652-1-git-send-email-dingtianhong@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: catalin.marinas@arm.com, will.deacon@arm.com, marc.zyngier@arm.com, mark.rutland@arm.com, oss@buserror.net, devicetree@vger.kernel.org, shawnguo@kernel.org, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, hanjun.guo@linaro.org
Cc: Ding Tianhong <dingtianhong@huawei.com>
List-Id: devicetree@vger.kernel.org

From: Hanjun Guo <hanjun.guo@linaro.org>

Add hisi timer specific erratum fixes.

v3: add hisilicon erratum 161601 for ACPI mode.

Signed-off-by: Hanjun Guo <hanjun.guo@linaro.org>
Signed-off-by: Ding Tianhong <dingtianhong@huawei.com>
---
 drivers/clocksource/arm_arch_timer.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 9bc93e5..270d179 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -1078,10 +1078,26 @@ struct gtdt_arch_timer_fixup {
 	u32 erratum;
 };
 
+#ifdef CONFIG_HISILICON_ERRATUM_161601
+static void __init erratum_workaround_enable(u32 erratum)
+{
+	if (erratum & HISILICON_161601) {
+		timer_unstable_counter_workaround = &arch_timer_hisi_161601;
+		static_branch_enable(&arch_timer_read_ool_enabled);
+		pr_info("Enabling workaround for HISILICON ERRATUM 161601\n");
+	}
+}
+#endif
+
 /* note: this needs to be updated according to the doc of OEM ID
  * and TABLE ID for different board.
  */
 struct gtdt_arch_timer_fixup arch_timer_quirks[] __initdata = {
+#ifdef CONFIG_HISILICON_ERRATUM_161601
+	{"HISI", "hip05", 0, &erratum_workaround_enable, HISILICON_161601},
+	{"HISI", "hip06", 0, &erratum_workaround_enable, HISILICON_161601},
+	{"HISI", "hip07", 0, &erratum_workaround_enable, HISILICON_161601},
+#endif
 };
 
 void __init arch_timer_acpi_quirks_handler(char *oem_id,
-- 
1.9.0
