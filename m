From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: [RFC 3/4] irqchip, gicv3-its: Introduce ACPI generic quirk framework
Date: Tue, 24 Jan 2017 13:50:12 +0000
Message-ID: <58875B94.80100@huawei.com>
References: <5886266C.3070506@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5886266C.3070506@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: marc.zyngier@arm.com, mark.rutland@arm.com, will.deacon@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, john.garry@huawei.com, guohanjun@huawei.com
List-Id: devicetree@vger.kernel.org

The current quirk mechanism is based on the IIDR register.
This introduces a ACPI MADT OEM information based erratum
support for platforms on which the IIDR registers are not
properly populated.

Signed-off-by: shameer <shameerali.kolothum.thodi@huawei.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 62 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 0a326f6..9fa12b7 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -1858,6 +1858,66 @@ static int __init its_of_probe(struct device_node *node)

 #ifdef CONFIG_ACPI

+struct acpi_madt_its_quirks {
+	char oem_id[ACPI_OEM_ID_SIZE+1];
+	char oem_table_id[ACPI_OEM_TABLE_ID_SIZE+1];
+	u32  oem_revision;
+	u32  its_id;
+	const char *erratum;
+};
+
+/*Upadate as per the board OEM ID and TABLE ID*/
+struct acpi_madt_its_quirks acpi_its_quirks[] __initdata = {
+
+};
+
+static void acpi_its_enable_erratum(const char  *erratum)
+{
+	const struct gic_quirk *quirks = its_quirks;
+	int i = 0;
+
+	for (; quirks->desc; quirks++) {
+		if ((quirks->erratum) && (!strcmp(quirks->erratum, erratum)))
+			erratum_workarounds[i++] = quirks;
+	}
+}
+
+static void __init acpi_its_oem_check(char *oem_id, char *oem_table_id,
+				u32 oem_revision)
+{
+	struct acpi_madt_its_quirks *quirks = acpi_its_quirks;
+
+	for (; quirks->erratum; quirks++) {
+		if (!memcmp(quirks->oem_id, oem_id, ACPI_OEM_ID_SIZE) &&
+		    !memcmp(quirks->oem_table_id, oem_table_id,
+		    ACPI_OEM_TABLE_ID_SIZE) &&
+		    quirks->oem_revision == oem_revision) {
+			acpi_its_enable_erratum(quirks->erratum);
+		}
+	}
+}
+
+static int __init acpi_parse_madt(struct acpi_table_header *madt_table)
+{
+	struct acpi_table_madt *table;
+
+	table = (struct acpi_table_madt *)madt_table;
+	acpi_its_oem_check(table->header.oem_id,
+		table->header.oem_table_id, table->header.oem_revision);
+
+	return 0;
+}
+
+void __init its_acpi_quirks_enable(u32  its_id)
+{
+	struct acpi_madt_its_quirks *quirks = acpi_its_quirks;
+
+	for (; quirks->erratum; quirks++) {
+		if (quirks->its_id == its_id)
+			acpi_table_parse(ACPI_SIG_MADT, acpi_parse_madt);
+	}
+}
+
 #define ACPI_GICV3_ITS_MEM_SIZE (SZ_128K)

 static int __init gic_acpi_parse_madt_its(struct acpi_subtable_header *header,
@@ -1888,6 +1948,8 @@ static int __init gic_acpi_parse_madt_its(struct acpi_subtable_header *header,
 		goto dom_err;
 	}

+	its_acpi_quirks_enable(its_entry->translation_id);
+
 	err = its_probe_one(&res, dom_handle, NUMA_NO_NODE);
 	if (!err)
 		return 0;
-- 
1.9.1


.
