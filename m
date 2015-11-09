From: Liu Jason <Hui.Liu@freescale.com>
Subject: The alignment mismatch issues between the of_reserved_mem and the CMA
 setup requirement
Date: Mon, 9 Nov 2015 09:39:43 +0000
Message-ID: <DM2PR0301MB1213832E956A5414482EDD74F3150@DM2PR0301MB1213.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

There is an alignment mismatch issue between the of_reserved_mem and th=
e CMA setup requirement.

The alignment in Documentation/devicetree/bindings/reserved-memory/rese=
rved-memory.txt


alignment (optional) - length based on parent's #size-cells
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 - Address boundary for =
alignment of allocation.


But this is not exactly match the CMA setup requirement if the alignmen=
t not set or set it not correctly.

The of_reserved_mem will get the alignment from the DTS and pass it to =
__memblock_alloc_base to
do the memory block allocation. If no alignment property in the DTS, th=
e align will be SMP_CACHE_BYTES

BUT, The CMA setup require the alignment as the following in the code:

align =3D PAGE_SIZE << max(MAX_ORDER - 1, pageblock_order)

static int __init rmem_cma_setup(struct reserved_mem *rmem)
{
=A0 =A0 =A0 =A0 phys_addr_t align =3D PAGE_SIZE << max(MAX_ORDER - 1, p=
ageblock_order);
=A0 =A0 =A0 =A0 phys_addr_t mask =3D align - 1;
=A0 =A0 =A0 =A0 unsigned long node =3D rmem->fdt_node;
=A0 =A0 =A0 =A0 struct cma *cma;
=A0 =A0 =A0 =A0 int err;

=A0 =A0 =A0 =A0 if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
=A0 =A0 =A0 =A0 =A0 =A0 of_get_flat_dt_prop(node, "no-map", NULL))
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;

=A0 =A0 =A0 =A0 if ((rmem->base & mask) || (rmem->size & mask)) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Reserved memory: incorrect alig=
nment of CMA region\n");
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
=A0 =A0 =A0 =A0 }
=A0 =A0 =A0 =A0 <snip>
}

So, there is very likely that the alignment mismatch between the of_res=
erved_mem and the CMA setup requirement.
The sanity check in the rmem_cma_setup will fail and CMA not get set up=
 in the end, this is not expected for CMA.

In the test, there will be following err log when this mismatch happen.

Reserved memory: incorrect alignment of CMA region.

The following patch to fix this issue, any comments?=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.=
c
index 62f467b..a20d4d3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -124,6 +124,15 @@ static int __init __reserved_mem_alloc_size(unsign=
ed long node,
                align =3D dt_mem_next_cell(dt_root_addr_cells, &prop);
        }

+       if (of_flat_dt_is_compatible(node,"shared-dma-pool")) {
+               phys_addr_t align_required =3D PAGE_SIZE << max(MAX_ORD=
ER - 1, pageblock_order);
+                if (!align || align !=3D ALIGN(align, align_required))=
 {
+                        pr_warn("Reserved memory: the alignment not se=
t up correctly in '%s' node."
+                               "change from %pa to %pa \n", uname, &al=
ign, &align_required);
+                        align =3D align_required;
+                }
+        }
+

Best Regards,
Jason Liu
