From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 3/3] arm64/numa: fix type info
Date: Thu, 26 May 2016 09:35:03 -0700
Message-ID: <1464280503.16344.40.camel@perches.com>
References: <1464230639-9852-1-git-send-email-thunder.leizhen@huawei.com>
	 <1464230639-9852-3-git-send-email-thunder.leizhen@huawei.com>
	 <CAFpQJXWih2V9Ki-vkL+cDni=VoWL0nA-fx5B5XtfNxFsoUso-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFpQJXWih2V9Ki-vkL+cDni=VoWL0nA-fx5B5XtfNxFsoUso-g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ganapatrao Kulkarni <gpkulkarni@gmail.com>, Zhen Lei <thunder.leizhen@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Robert Richter <rrichter@cavium.com>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Xinwei Hu <huxinwei@huawei.com>, Zefan Li <lizefan@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>
List-Id: devicetree@vger.kernel.org

On Thu, 2016-05-26 at 09:22 -0700, Ganapatrao Kulkarni wrote:
> On Wed, May 25, 2016 at 7:43 PM, Zhen Lei <thunder.leizhen@huawei.com=
> wrote:
> > numa_init(of_numa_init) may returned error because of numa configur=
ation
> > error. So "No NUMA configuration found" is inaccurate. In fact, spe=
cific
> > configuration error information can be immediately printed by the
> > testing branch. So "No NUMA..." only needs to be printed when numa_=
off.
[]
> > diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
[]
> > @@ -362,7 +362,8 @@ static int __init dummy_numa_init(void)
> > =A0=A0=A0=A0=A0=A0=A0=A0int ret;
> > =A0=A0=A0=A0=A0=A0=A0=A0struct memblock_region *mblk;
> >=20
> > -=A0=A0=A0=A0=A0=A0=A0pr_info("%s\n", "No NUMA configuration found"=
);
> > +=A0=A0=A0=A0=A0=A0=A0if (numa_off)
> IIRC, it should be
> if (!numa_off)
> we want to print this message when we failed to find proper numa conf=
iguration.
> when numa_off is set, we will not look for any numa configuration.
>=20
> >=20
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("%s\n", "No N=
UMA configuration found");

trivia:

Using printk("%s\n", "string") just makes the object code larger
for no particular benefit.

	pr_info("No NUMA configuration found\n");

would be smaller, faster and more intelligible for humans too.

Maybe something like this:
---
=A0arch/arm64/mm/numa.c | 41 ++++++++++++++++++++---------------------
=A01 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 98dc104..2042452 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -17,6 +17,8 @@
=A0 * along with this program.=A0=A0If not, see <http://www.gnu.org/lic=
enses/>.
=A0 */
=A0
+#define pr_fmt(fmt) "NUMA: " fmt
+
=A0#include <linux/bootmem.h>
=A0#include <linux/memblock.h>
=A0#include <linux/module.h>
@@ -36,7 +38,7 @@ static __init int numa_parse_early_param(char *opt)
=A0	if (!opt)
=A0		return -EINVAL;
=A0	if (!strncmp(opt, "off", 3)) {
-		pr_info("%s\n", "NUMA turned off");
+		pr_info("NUMA turned off\n");
=A0		numa_off =3D 1;
=A0	}
=A0	return 0;
@@ -107,7 +109,7 @@ static void __init setup_node_to_cpumask_map(void)
=A0		set_cpu_numa_node(cpu, NUMA_NO_NODE);
=A0
=A0	/* cpumask_of_node() will now work */
-	pr_debug("NUMA: Node to cpumask map for %d nodes\n", nr_node_ids);
+	pr_debug("Node to cpumask map for %d nodes\n", nr_node_ids);
=A0}
=A0
=A0/*
@@ -142,14 +144,14 @@ int __init numa_add_memblk(int nid, u64 start, u6=
4 size)
=A0
=A0	ret =3D memblock_set_node(start, size, &memblock.memory, nid);
=A0	if (ret < 0) {
-		pr_err("NUMA: memblock [0x%llx - 0x%llx] failed to add on node %d\n"=
,
-			start, (start + size - 1), nid);
+		pr_err("memblock [0x%llx - 0x%llx] failed to add on node %d\n",
+		=A0=A0=A0=A0=A0=A0=A0start, (start + size - 1), nid);
=A0		return ret;
=A0	}
=A0
=A0	node_set(nid, numa_nodes_parsed);
-	pr_info("NUMA: Adding memblock [0x%llx - 0x%llx] on node %d\n",
-			start, (start + size - 1), nid);
+	pr_info("Adding memblock [0x%llx - 0x%llx] on node %d\n",
+		start, (start + size - 1), nid);
=A0	return ret;
=A0}
=A0
@@ -163,19 +165,18 @@ static void __init setup_node_data(int nid, u64 s=
tart_pfn, u64 end_pfn)
=A0	void *nd;
=A0	int tnid;
=A0
-	pr_info("NUMA: Initmem setup node %d [mem %#010Lx-%#010Lx]\n",
-			nid, start_pfn << PAGE_SHIFT,
-			(end_pfn << PAGE_SHIFT) - 1);
+	pr_info("Initmem setup node %d [mem %#010Lx-%#010Lx]\n",
+		nid, start_pfn << PAGE_SHIFT, (end_pfn << PAGE_SHIFT) - 1);
=A0
=A0	nd_pa =3D memblock_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
=A0	nd =3D __va(nd_pa);
=A0
=A0	/* report and initialize */
-	pr_info("NUMA: NODE_DATA [mem %#010Lx-%#010Lx]\n",
+	pr_info("NODE_DATA [mem %#010Lx-%#010Lx]\n",
=A0		nd_pa, nd_pa + nd_size - 1);
=A0	tnid =3D early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
=A0	if (tnid !=3D nid)
-		pr_info("NUMA: NODE_DATA(%d) on node %d\n", nid, tnid);
+		pr_info("NODE_DATA(%d) on node %d\n", nid, tnid);
=A0
=A0	node_data[nid] =3D nd;
=A0	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
@@ -232,8 +233,7 @@ static int __init numa_alloc_distance(void)
=A0			numa_distance[i * numa_distance_cnt + j] =3D i =3D=3D j ?
=A0				LOCAL_DISTANCE : REMOTE_DISTANCE;
=A0
-	pr_debug("NUMA: Initialized distance table, cnt=3D%d\n",
-			numa_distance_cnt);
+	pr_debug("Initialized distance table, cnt=3D%d\n", numa_distance_cnt)=
;
=A0
=A0	return 0;
=A0}
@@ -254,20 +254,20 @@ static int __init numa_alloc_distance(void)
=A0void __init numa_set_distance(int from, int to, int distance)
=A0{
=A0	if (!numa_distance) {
-		pr_warn_once("NUMA: Warning: distance table not allocated yet\n");
+		pr_warn_once("Warning: distance table not allocated yet\n");
=A0		return;
=A0	}
=A0
=A0	if (from >=3D numa_distance_cnt || to >=3D numa_distance_cnt ||
=A0			from < 0 || to < 0) {
-		pr_warn_once("NUMA: Warning: node ids are out of bound, from=3D%d to=
=3D%d distance=3D%d\n",
-			=A0=A0=A0=A0from, to, distance);
+		pr_warn_once("Warning: node ids are out of bound, from=3D%d to=3D%d =
distance=3D%d\n",
+			=A0=A0=A0=A0=A0from, to, distance);
=A0		return;
=A0	}
=A0
=A0	if ((u8)distance !=3D distance ||
=A0	=A0=A0=A0=A0(from =3D=3D to && distance !=3D LOCAL_DISTANCE)) {
-		pr_warn_once("NUMA: Warning: invalid distance parameter, from=3D%d t=
o=3D%d distance=3D%d\n",
+		pr_warn_once("Warning: invalid distance parameter, from=3D%d to=3D%d=
 distance=3D%d\n",
=A0			=A0=A0=A0=A0=A0from, to, distance);
=A0		return;
=A0	}
@@ -294,7 +294,7 @@ static int __init numa_register_nodes(void)
=A0	/* Check that valid nid is set to memblks */
=A0	for_each_memblock(memory, mblk)
=A0		if (mblk->nid =3D=3D NUMA_NO_NODE || mblk->nid >=3D MAX_NUMNODES) =
{
-			pr_warn("NUMA: Warning: invalid memblk node %d [mem %#010Lx-%#010Lx=
]\n",
+			pr_warn("Warning: invalid memblk node %d [mem %#010Lx-%#010Lx]\n",
=A0				mblk->nid, mblk->base,
=A0				mblk->base + mblk->size - 1);
=A0			return -EINVAL;
@@ -362,9 +362,8 @@ static int __init dummy_numa_init(void)
=A0	int ret;
=A0	struct memblock_region *mblk;
=A0
-	pr_info("%s\n", "No NUMA configuration found");
-	pr_info("NUMA: Faking a node at [mem %#018Lx-%#018Lx]\n",
-	=A0=A0=A0=A0=A0=A0=A00LLU, PFN_PHYS(max_pfn) - 1);
+	pr_info("No NUMA configuration found - faking a node at [mem %#018Lx-=
%#018Lx]\n",
+		0LLU, PFN_PHYS(max_pfn) - 1);
=A0
=A0	for_each_memblock(memory, mblk) {
=A0		ret =3D numa_add_memblk(0, mblk->base, mblk->size);
