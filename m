From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of: fix iteration bug over CPU reg properties
Date: Fri,  4 Oct 2013 17:40:02 +0100
Message-ID: <1380904802-10432-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The size of each hwid in a cpu nodes 'reg' property is defined by the
parents #address-cells property in the normal way. The cpu parsing code
has a bug where it will overrun the end of the property if
address-cells is greater than one. This commit fixes the problem by
adjusting the array size by the number of address cells. It also makes
sure address-cells isn't zero for that would cause an infinite loop.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---

I discovered this during code inspection. I don't think it is an actual
bug seen in the wild, but the code does look wrong. I'd appreciate
someone take a look and confirm that I've read the code right.

 drivers/of/base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index e4c9945..470b871 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -263,11 +263,11 @@ static bool __of_find_n_match_cpu_property(struct device_node *cpun,
 	int ac, prop_len, tid;
 	u64 hwid;
 
-	ac = of_n_addr_cells(cpun);
+	ac = of_n_addr_cells(cpun) ? : OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
 	cell = of_get_property(cpun, prop_name, &prop_len);
 	if (!cell)
 		return false;
-	prop_len /= sizeof(*cell);
+	prop_len /= sizeof(*cell) * ac;
 	for (tid = 0; tid < prop_len; tid++) {
 		hwid = of_read_number(cell, ac);
 		if (arch_match_cpu_phys_id(cpu, hwid)) {
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
