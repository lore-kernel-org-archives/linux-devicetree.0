From: Rob Herring <robh@kernel.org>
Subject: [PATCH] x86: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:42:47 -0500
Message-ID: <20170718214339.7774-7-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
---
 arch/x86/kernel/devicetree.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
index 3fe45f84ced4..d7b2ab7f7c60 100644
--- a/arch/x86/kernel/devicetree.c
+++ b/arch/x86/kernel/devicetree.c
@@ -235,8 +235,7 @@ static void __init dtb_add_ioapic(struct device_node *dn)

 	ret = of_address_to_resource(dn, 0, &r);
 	if (ret) {
-		printk(KERN_ERR "Can't obtain address from node %s.\n",
-				dn->full_name);
+		printk(KERN_ERR "Can't obtain address from node %pOF.\n", dn);
 		return;
 	}
 	mp_register_ioapic(++ioapic_id, r.start, gsi_top, &cfg);
--
2.11.0
