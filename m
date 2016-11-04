From: Ding Tianhong <dingtianhong@huawei.com>
Subject: [PATCH v3 5/6] arm64: arch_timer: apci: Introduce a generic aquirk
 framework for erratum
Date: Fri, 4 Nov 2016 21:06:33 +0800
Message-ID: <1478264794-14652-5-git-send-email-dingtianhong@huawei.com>
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

Introduce a general quirk framework for each timer erratum in ACPI,
which use the oem information in GTDT table for platform specific erratums.
The struct gtdt_arch_timer_fixup is introduced to record the oem
information to match the quirk and handle the erratum.

v3: Introduce a generic aquick framework for erratum in ACPI mode.

Signed-off-by: Hanjun Guo <hanjun.guo@linaro.org>
Signed-off-by: Ding Tianhong <dingtianhong@huawei.com>
---
 drivers/clocksource/arm_arch_timer.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index 3d59af1..9bc93e5 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -1068,6 +1068,40 @@ CLOCKSOURCE_OF_DECLARE(armv7_arch_timer_mem, "arm,armv7-timer-mem",
 		       arch_timer_mem_init);
 
 #ifdef CONFIG_ACPI
+struct gtdt_arch_timer_fixup {
+	char oem_id[ACPI_OEM_ID_SIZE];
+	char oem_table_id[ACPI_OEM_TABLE_ID_SIZE];
+	u32 oem_revision;
+
+	/* quirk handler for arch timer erratum */
+	void (*handler)(u32 erratum);
+	u32 erratum;
+};
+
+/* note: this needs to be updated according to the doc of OEM ID
+ * and TABLE ID for different board.
+ */
+struct gtdt_arch_timer_fixup arch_timer_quirks[] __initdata = {
+};
+
+void __init arch_timer_acpi_quirks_handler(char *oem_id,
+						  char *oem_table_id,
+						  u32 oem_revision)
+{
+	struct gtdt_arch_timer_fixup *quirks = arch_timer_quirks;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(arch_timer_quirks); i++, quirks++) {
+		if (!memcmp(quirks->oem_id, oem_id, ACPI_OEM_ID_SIZE) &&
+		    !memcmp(quirks->oem_table_id, oem_table_id, ACPI_OEM_TABLE_ID_SIZE) &&
+		    quirks->oem_revision == oem_revision) {
+			if (quirks->handler && quirks->erratum)
+				quirks->handler(quirks->erratum);
+			break;
+		}
+	}
+}
+
 static int __init map_generic_timer_interrupt(u32 interrupt, u32 flags)
 {
 	int trigger, polarity;
@@ -1094,6 +1128,9 @@ static int __init arch_timer_acpi_init(struct acpi_table_header *table)
 		return -EINVAL;
 	}
 
+	arch_timer_acpi_quirks_handler(table->oem_id, table->oem_table_id,
+				       table->oem_revision);
+
 	gtdt = container_of(table, struct acpi_table_gtdt, header);
 
 	arch_timers_present |= ARCH_CP15_TIMER;
-- 
1.9.0
