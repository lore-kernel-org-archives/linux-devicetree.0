From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] of: silence warnings due to max() usage
Date: Tue, 31 May 2016 09:38:56 +1000
Message-ID: <20160531093856.75c0b04d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Liu <r64343@freescale.com>
List-Id: devicetree@vger.kernel.org

pageblock_order can be (at least) an unsigned int or an unsigned long
depending on the kernel config and architecture, so use max_t(unsigned
long ...) when comparing it.

fixes these warnings:

In file included from include/linux/list.h:8:0,
                 from include/linux/kobject.h:20,
                 from include/linux/of.h:21,
                 from drivers/of/of_reserved_mem.c:17:
drivers/of/of_reserved_mem.c: In function =E2=80=98__reserved_mem_alloc=
_size=E2=80=99:
include/linux/kernel.h:748:17: warning: comparison of distinct pointer =
types lacks a cast
  (void) (&_max1 =3D=3D &_max2);  \
                 ^
include/linux/kernel.h:747:9: note: in definition of macro =E2=80=98max=
=E2=80=99
  typeof(y) _max2 =3D (y);   \
         ^
drivers/of/of_reserved_mem.c:131:48: note: in expansion of macro =E2=80=
=98max=E2=80=99
   align =3D max(align, (phys_addr_t)PAGE_SIZE << max(MAX_ORDER - 1, pa=
geblock_ord
                                                ^
include/linux/kernel.h:748:17: warning: comparison of distinct pointer =
types lacks a cast
  (void) (&_max1 =3D=3D &_max2);  \
                 ^
include/linux/kernel.h:747:21: note: in definition of macro =E2=80=98ma=
x=E2=80=99
  typeof(y) _max2 =3D (y);   \
                     ^
drivers/of/of_reserved_mem.c:131:48: note: in expansion of macro =E2=80=
=98max=E2=80=99
   align =3D max(align, (phys_addr_t)PAGE_SIZE << max(MAX_ORDER - 1, pa=
geblock_ord
                                                ^

=46ixes: 1cc8e3458b51 ("drivers: of: of_reserved_mem: fixup the alignme=
nt with CMA setup")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/of/of_reserved_mem.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

Hi guys, this has been irking me for some time now ... I will add this
to my fixes tree in linux-next today.  Please apply and send to Linus.

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.=
c
index ed01c0172e4a..07dd81586c52 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -127,8 +127,12 @@ static int __init __reserved_mem_alloc_size(unsign=
ed long node,
 	}
=20
 	/* Need adjust the alignment to satisfy the CMA requirement */
-	if (IS_ENABLED(CONFIG_CMA) && of_flat_dt_is_compatible(node, "shared-=
dma-pool"))
-		align =3D max(align, (phys_addr_t)PAGE_SIZE << max(MAX_ORDER - 1, pa=
geblock_order));
+	if (IS_ENABLED(CONFIG_CMA) && of_flat_dt_is_compatible(node, "shared-=
dma-pool")) {
+		unsigned long order =3D
+			max_t(unsigned long, MAX_ORDER - 1, pageblock_order);
+
+		align =3D max(align, (phys_addr_t)PAGE_SIZE << order);
+	}
=20
 	prop =3D of_get_flat_dt_prop(node, "alloc-ranges", &len);
 	if (prop) {
--=20
2.8.1

--=20
Cheers,
Stephen Rothwell
