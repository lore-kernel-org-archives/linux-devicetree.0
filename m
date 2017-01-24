From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: [RFC 4/4] irqchip, gicv3-its: Add HiSilicon acpi based erratum data.
Date: Tue, 24 Jan 2017 13:53:09 +0000
Message-ID: <58875C45.50108@huawei.com>
References: <588626A5.7090603@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <588626A5.7090603@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, mark.rutland@arm.com, will.deacon@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, john.garry@huawei.com, guohanjun@huawei.com
List-Id: devicetree@vger.kernel.org

This enables the acpi based workaround for HiSilicon erratum 161010801.

Signed-off-by: shameer <shameerali.kolothum.thodi@huawei.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 9fa12b7..d0f5099 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -1868,7 +1868,10 @@ struct acpi_madt_its_quirks {

 /*Upadate as per the board OEM ID and TABLE ID*/
 struct acpi_madt_its_quirks acpi_its_quirks[] __initdata = {
-
+#ifdef CONFIG_HISILICON_ERRATUM_161010801
+	{"HISI  ", "HIP06   ", 0, 0, "hisilicon,erratum-161010801"},
+	{"HISI  ", "HIP07   ", 0, 0, "hisilicon,erratum-161010801"},
+#endif
 };

 static void acpi_its_enable_erratum(const char  *erratum)
-- 
1.9.1
