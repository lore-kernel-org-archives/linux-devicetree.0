From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] arm64, numa: Force of_node_to_nid to return NUMA_NO_NODE when numa=off.
Date: Tue, 25 Oct 2016 14:31:01 -0700
Message-ID: <1477431061-7258-3-git-send-email-ddaney.cavm@gmail.com>
References: <1477431061-7258-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477431061-7258-1-git-send-email-ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Gilbert Netzer <noname-QVTQ4TwcpgDLoDKTGw+V6w@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

When "numa=off" is passed on the command line, of_node_to_nid() still
returns the node number (which can be greater than zero).  However, in
this case all the memory is associated with the dummy node zero.  This
causes OOPS in kernel/irq/irqdomain.c:

    domain = kzalloc_node(sizeof(*domain) + (sizeof(unsigned int) * size),
                  GFP_KERNEL, of_node_to_nid(of_node));
...

which in my case then caused the kernel to OOPS for the IRQ controller
on node 1:

[    0.000000] [<fffffc00081bba84>] __alloc_pages_nodemask+0xa4/0xe68
[    0.000000] [<fffffc00082163a8>] new_slab+0xd0/0x57c
[    0.000000] [<fffffc000821879c>] ___slab_alloc+0x2e4/0x514
[    0.000000] [<fffffc000823882c>] __slab_alloc+0x48/0x58
[    0.000000] [<fffffc00082195a0>] __kmalloc_node+0xd0/0x2e0
[    0.000000] [<fffffc00081119b8>] __irq_domain_add+0x7c/0x164
[    0.000000] [<fffffc0008b75d30>] its_probe+0x784/0x81c
[    0.000000] [<fffffc0008b75e10>] its_init+0x48/0x1b0

Fix by forcing of_node_to_nid() to return NUMA_NO_NODE when numa=off.
The kmalloc_node() family is perfectly happy when the node is
specified as NUMA_NO_NODE.

Reported-by: Gilbert Netzer <noname-QVTQ4TwcpgDLoDKTGw+V6w@public.gmane.org>
Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/mm/numa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 778a985..6d34ebb 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -41,8 +41,10 @@ static __init int numa_parse_early_param(char *opt)
 {
 	if (!opt)
 		return -EINVAL;
-	if (!strncmp(opt, "off", 3))
+	if (!strncmp(opt, "off", 3)) {
+		__of_force_no_numa();
 		numa_off = true;
+	}
 
 	return 0;
 }
@@ -432,6 +434,7 @@ static int __init dummy_numa_init(void)
 		return ret;
 	}
 
+	__of_force_no_numa();
 	numa_off = true;
 	return 0;
 }
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
