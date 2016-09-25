From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: [PATCH v3 2/5] drivers/of: do not add memory for unavailable nodes
Date: Sun, 25 Sep 2016 13:36:53 -0500
Message-ID: <1474828616-16608-3-git-send-email-arbab@linux.vnet.ibm.com>
References: <1474828616-16608-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1474828616-16608-1-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

Respect the standard dt "status" property when scanning memory nodes in
early_init_dt_scan_memory(), so that if the node is unavailable, no
memory will be added.

The use case at hand is accelerator or device memory, which may be
unusable until post-boot initialization of the memory link. Such a node
can be described in the dt as any other, given its status is "disabled".
Per the device tree specification,

"disabled"
	Indicates that the device is not presently operational, but it
	might become operational in the future (for example, something
	is not plugged in, or switched off).

Once such memory is made operational, it can then be hotplugged.

Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
---
 drivers/of/fdt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 9241c6e..59b772a 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1056,6 +1056,9 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 	} else if (strcmp(type, "memory") != 0)
 		return 0;
 
+	if (!of_flat_dt_is_available(node))
+		return 0;
+
 	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
 	if (reg == NULL)
 		reg = of_get_flat_dt_prop(node, "reg", &l);
-- 
1.8.3.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
