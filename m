From: fu.wei@linaro.org
Subject: [PATCH v3 6/6] ACPI: import watchdog info of GTDT into platform device
Date: Mon, 25 May 2015 18:03:13 +0800
Message-ID: <1432548193-19569-7-git-send-email-fu.wei@linaro.org>
References: <=fu.wei@linaro.org>
 <1432548193-19569-1-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432548193-19569-1-git-send-email-fu.wei@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Suravee.Suthikulpanit@amd.com, linaro-acpi@lists.linaro.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: tekkamanninja@gmail.com, graeme.gregory@linaro.org, al.stone@linaro.org, hanjun.guo@linaro.org, timur@codeaurora.org, ashwin.chaugule@linaro.org, arnd@arndb.de, linux@roeck-us.net, vgandhi@codeaurora.org, wim@iguana.be, jcm@redhat.com, leo.duran@amd.com, corbet@lwn.net, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, Fu Wei <fu.wei@linaro.org>
List-Id: devicetree@vger.kernel.org

=46rom: Fu Wei <fu.wei@linaro.org>

Parse SBSA Generic Watchdog Structure in GTDT table of ACPI,
and create a platform device with that information.
This platform device can be used by the ARM SBSA Generic
Watchdog driver.

Tested-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Tested-by: Timur Tabi <timur@codeaurora.org>
Signed-off-by: Fu Wei <fu.wei@linaro.org>
---
 arch/arm64/kernel/acpi.c | 145 +++++++++++++++++++++++++++++++++++++++=
++++++++
 1 file changed, 145 insertions(+)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 8b83955..c95deec 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -23,6 +23,7 @@
 #include <linux/irqdomain.h>
 #include <linux/memblock.h>
 #include <linux/of_fdt.h>
+#include <linux/platform_device.h>
 #include <linux/smp.h>
=20
 #include <asm/cputype.h>
@@ -343,3 +344,147 @@ void __init acpi_gic_init(void)
=20
 	early_acpi_os_unmap_memory((char *)table, tbl_size);
 }
+
+static int __init acpi_gtdt_import_sbsa_gwdt(struct acpi_gtdt_watchdog=
 *wd,
+					     int index)
+{
+	struct platform_device *pdev;
+	struct resource *res;
+	u32 gsi, flags;
+	int irq, trigger, polarity;
+	resource_size_t rf_base_phy, cf_base_phy;
+	int err =3D -ENOMEM;
+
+	/*
+	 * Get SBSA Generic Watchdog info
+	 * from a Watchdog GT type structure in GTDT
+	 */
+	rf_base_phy =3D (resource_size_t)wd->refresh_frame_address;
+	cf_base_phy =3D (resource_size_t)wd->control_frame_address;
+	gsi =3D wd->timer_interrupt;
+	flags =3D wd->timer_flags;
+
+	pr_debug("GTDT: a Watchdog GT structure(0x%llx/0x%llx gsi:%u flags:0x=
%x)\n",
+		 rf_base_phy, cf_base_phy, gsi, flags);
+
+	if (!(rf_base_phy && cf_base_phy && gsi)) {
+		pr_err("GTDT: failed geting the device info.\n");
+		return -EINVAL;
+	}
+
+	trigger =3D (flags & ACPI_GTDT_INTERRUPT_MODE) ? ACPI_EDGE_SENSITIVE
+			: ACPI_LEVEL_SENSITIVE;
+	polarity =3D (flags & ACPI_GTDT_INTERRUPT_POLARITY) ? ACPI_ACTIVE_LOW
+			: ACPI_ACTIVE_HIGH;
+	irq =3D acpi_register_gsi(NULL, gsi, trigger, polarity);
+	if (irq < 0) {
+		pr_err("GTDT: failed to register GSI of the Watchdog GT.\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Add a platform device named "sbsa-gwdt" to match the platform driv=
er.
+	 * "sbsa-gwdt": SBSA(Server Base System Architecture) Generic Watchdo=
g
+	 * The platform driver can get device info below by matching this nam=
e.
+	 */
+	pdev =3D platform_device_alloc("sbsa-gwdt", index);
+	if (!pdev)
+		goto err_unregister_gsi;
+
+	res =3D kcalloc(3, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		goto err_device_put;
+
+	/*
+	 * According to SBSA specification the size of refresh and control
+	 * frames of SBSA Generic Watchdog is SZ_4K(Offset 0x000 =E2=80=93 0x=
=46FF).
+	 */
+	res[0].start =3D rf_base_phy;
+	res[0].end =3D rf_base_phy + SZ_4K - 1;
+	res[0].name =3D "refresh";
+	res[0].flags =3D IORESOURCE_MEM;
+
+	res[1].start =3D cf_base_phy;
+	res[1].end =3D cf_base_phy + SZ_4K - 1;
+	res[1].name =3D "control";
+	res[1].flags =3D IORESOURCE_MEM;
+
+	res[2].start =3D irq;
+	res[2].end =3D res[2].start;
+	res[2].name =3D "ws0";
+	res[2].flags =3D IORESOURCE_IRQ;
+
+	err =3D platform_device_add_resources(pdev, res, 3);
+	if (err)
+		goto err_free_res;
+
+	err =3D platform_device_add(pdev);
+	if (err)
+		goto err_free_res;
+
+	return 0;
+
+err_free_res:
+	kfree(res);
+err_device_put:
+	platform_device_put(pdev);
+err_unregister_gsi:
+	acpi_unregister_gsi(gsi);
+
+	return err;
+}
+
+/* Initialize SBSA generic Watchdog platform device info from GTDT */
+static int __init acpi_gtdt_sbsa_gwdt_init(struct acpi_table_header *t=
able)
+{
+	struct acpi_table_gtdt *gtdt;
+	struct acpi_gtdt_header *header;
+	void *gtdt_subtable;
+	int i, gwdt_index;
+	int ret =3D 0;
+
+	if (table->revision < 2) {
+		pr_warn("GTDT: Revision:%d doesn't support Platform Timers.\n",
+			table->revision);
+		return 0;
+	}
+
+	gtdt =3D container_of(table, struct acpi_table_gtdt, header);
+	if (!gtdt->platform_timer_count) {
+		pr_info("GTDT: No Platform Timer structures.\n");
+		return 0;
+	}
+
+	gtdt_subtable =3D (void *)gtdt + gtdt->platform_timer_offset;
+
+	for (i =3D 0, gwdt_index =3D 0; i < gtdt->platform_timer_count; i++) =
{
+		if (gtdt_subtable > (void *)table + table->length) {
+			pr_err("GTDT: subtable pointer overflows, bad table\n");
+			return -EINVAL;
+		}
+		header =3D (struct acpi_gtdt_header *)gtdt_subtable;
+		if (header->type =3D=3D ACPI_GTDT_TYPE_WATCHDOG) {
+			ret =3D acpi_gtdt_import_sbsa_gwdt(gtdt_subtable,
+							 gwdt_index);
+			if (ret)
+				pr_err("GTDT: failed to import subtable %d\n",
+				       i);
+			else
+				gwdt_index++;
+		}
+		gtdt_subtable +=3D header->length;
+	}
+
+	return ret;
+}
+
+/* Initialize the SBSA Generic Watchdog presented in GTDT */
+static int __init acpi_gtdt_init(void)
+{
+	if (acpi_disabled)
+		return 0;
+
+	return acpi_table_parse(ACPI_SIG_GTDT, acpi_gtdt_sbsa_gwdt_init);
+}
+
+arch_initcall(acpi_gtdt_init);
--=20
1.9.1
