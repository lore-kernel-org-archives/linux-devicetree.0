From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of: fix phandle cache creation for DTs with no phandles
Date: Tue, 11 Sep 2018 09:56:07 -0500
Message-ID: <20180911145607.6009-1-robh@kernel.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Stan Johnson <userm57@yahoo.com>, Frank Rowand <frowand.list@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

With commit 0b3ce78e90fc ("of: cache phandle nodes to reduce cost of
of_find_node_by_phandle()"), a G3 PowerMac fails to boot. The root cause
is the DT for this system has no phandle properties when booted with
BootX. of_populate_phandle_cache() does not handle the case of no
phandles correctly. The problem is roundup_pow_of_two() for 0 is
undefined. The implementation subtracts 1 underflowing and then things
are in the weeds.

Fixes: 0b3ce78e90fc ("of: cache phandle nodes to reduce cost of of_find_node_by_phandle()")
Cc: stable@vger.kernel.org # 4.17+
Reported-by: Finn Thain <fthain@telegraphics.com.au>
Tested-by: Stan Johnson <userm57@yahoo.com>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Here's a formal patch of what Stan tested. Will send to Linus this week.

Rob

 drivers/of/base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index a055cd1ef96d..17ae594b7014 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -140,6 +140,9 @@ void of_populate_phandle_cache(void)
 		if (np->phandle && np->phandle != OF_PHANDLE_ILLEGAL)
 			phandles++;
 
+	if (!phandles)
+		goto out;
+
 	cache_entries = roundup_pow_of_two(phandles);
 	phandle_cache_mask = cache_entries - 1;
 
-- 
2.17.1
