From: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH] scripts: check.c fix compile error
Date: Mon, 15 May 2017 13:10:10 -0600
Message-ID: <20170515191010.4878-1-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix the following compile error:

checks.c: In function ‘check_simple_bus_reg’:
checks.c:876:41: error: format ‘%lx’ expects argument of type
‘long unsigned int’, but argument 4 has type ‘uint64_t {aka
long long unsigned int}’ [-Werror=format=]
  snprintf(unit_addr, sizeof(unit_addr), "%lx", reg);
                                         ^
checks.c:876:41: error: format ‘%lx’ expects argument of type
‘long unsigned int’, but argument 4 has type ‘uint64_t
{aka long long unsigned int}’ [-Werror=format=]
cc1: all warnings being treated as errors
Makefile:304: recipe for target 'checks.o' failed
make: *** [checks.o] Error 1

Signed-off-by: Shuah Khan <shuahkh-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
---
 scripts/dtc/checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
index 5adfc8f..6dfb82f 100644
--- a/scripts/dtc/checks.c
+++ b/scripts/dtc/checks.c
@@ -873,7 +873,7 @@ static void check_simple_bus_reg(struct check *c, struct dt_info *dti, struct no
 	while (size--)
 		reg = (reg << 32) | fdt32_to_cpu(*(cells++));
 
-	snprintf(unit_addr, sizeof(unit_addr), "%lx", reg);
+	snprintf(unit_addr, sizeof(unit_addr), "%llx", reg);
 	if (!streq(unitname, unit_addr))
 		FAIL(c, dti, "Node %s simple-bus unit address format error, expected \"%s\"",
 		     node->fullpath, unit_addr);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
