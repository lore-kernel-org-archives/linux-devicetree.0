From: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v7 04/14] of/numa: remove a duplicated warning
Date: Wed, 24 Aug 2016 15:44:43 +0800
Message-ID: <1472024693-12912-5-git-send-email-thunder.leizhen@huawei.com>
References: <1472024693-12912-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1472024693-12912-1-git-send-email-thunder.leizhen@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank
 Rowand <frowand.list@gmail.com>, devicetree <devicetree@vger.kernel.org>
Cc: Xinwei Hu <huxinwei@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>, Zefan Li <lizefan@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>
List-Id: devicetree@vger.kernel.org

This warning has been printed in of_numa_parse_cpu_nodes before.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 drivers/of/of_numa.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index afaeb9c..8723f64 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -179,13 +179,8 @@ int of_node_to_nid(struct device_node *device)
 			np->name);
 	of_node_put(np);

-	if (!r) {
-		if (nid >= MAX_NUMNODES)
-			pr_warn("NUMA: Node id %u exceeds maximum value\n",
-				nid);
-		else
-			return nid;
-	}
+	if (!r)
+		return nid;

 	return NUMA_NO_NODE;
 }
--
2.5.0
