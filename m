From: Rob Herring <robh@kernel.org>
Subject: [PATCH 16/21] x86: DT: use for_each_of_cpu_node iterator
Date: Wed,  5 Sep 2018 14:37:33 -0500
Message-ID: <20180905193738.19325-17-robh@kernel.org>
References: <20180905193738.19325-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org
List-Id: devicetree@vger.kernel.org

Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
has the side effect of defaulting to iterating using "cpu" node names in
preference to the deprecated (for FDT) device_type == "cpu".

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take via the DT tree. This is dependent on the
first 2 patches.

 arch/x86/kernel/devicetree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
index f39f3a06c26f..7299dcbf8e85 100644
--- a/arch/x86/kernel/devicetree.c
+++ b/arch/x86/kernel/devicetree.c
@@ -140,7 +140,7 @@ static void __init dtb_cpu_setup(void)
 	int ret;

 	version = GET_APIC_VERSION(apic_read(APIC_LVR));
-	for_each_node_by_type(dn, "cpu") {
+	for_each_of_cpu_node(dn) {
 		ret = of_property_read_u32(dn, "reg", &apic_id);
 		if (ret < 0) {
 			pr_warn("%pOF: missing local APIC ID\n", dn);
--
2.17.1
