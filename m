From: Jamie Huang <jamienstar-9Onoh4P/yGk@public.gmane.org>
Subject: [PATCH] script:dtc: fix compile error
Date: Tue, 22 Aug 2017 14:00:06 +0800
Message-ID: <1503381606-30202-1-git-send-email-jamienstar@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jamie Huang <jamienstar-9Onoh4P/yGk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When building a 32-bit kernel, the following warnings will appear:

scripts/dtc/checks.c: In function ‘check_simple_bus_reg’:
scripts/dtc/checks.c:876:41: warning: format ‘%zx’ expects argument of type ‘size_t’, but argument 4 has type ‘uint64_t {aka long long unsigned int}’ [-Wformat=]
  snprintf(unit_addr, sizeof(unit_addr), %zx, reg);
                                         ^
scripts/dtc/checks.c:876:41: warning: format ‘%zx’ expects argument of type ‘size_t’, but argument 4 has type ‘uint64_t {aka long long unsigned int}’ [-Wformat=]

This patch fixes it.

Signed-off-by: Jamie Huang <jamienstar-9Onoh4P/yGk@public.gmane.org>
---
 scripts/dtc/checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
index 4b72b53..6dfb82f 100644
--- a/scripts/dtc/checks.c
+++ b/scripts/dtc/checks.c
@@ -873,7 +873,7 @@ static void check_simple_bus_reg(struct check *c, struct dt_info *dti, struct no
 	while (size--)
 		reg = (reg << 32) | fdt32_to_cpu(*(cells++));

-	snprintf(unit_addr, sizeof(unit_addr), "%zx", reg);
+	snprintf(unit_addr, sizeof(unit_addr), "%llx", reg);
 	if (!streq(unitname, unit_addr))
 		FAIL(c, dti, "Node %s simple-bus unit address format error, expected \"%s\"",
 		     node->fullpath, unit_addr);
--
2.5.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
