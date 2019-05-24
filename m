From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v4 1/3] amr64: map FDT as RW for early_init_dt_scan()
Date: Thu, 23 May 2019 17:04:18 -0700
Message-ID: <5ce73503.1c69fb81.5f889.1d84@mx.google.com>
References: <20190519160446.320-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190519160446.320-1-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

Quoting Hsin-Yi Wang (2019-05-19 09:04:44)
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a170c6369a68..29648e86f7e5 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -940,12 +940,12 @@ void *__init __fixmap_remap_fdt(phys_addr_t dt_phys=
, int *size, pgprot_t prot)
>         return dt_virt;
>  }
> =20
> -void *__init fixmap_remap_fdt(phys_addr_t dt_phys)
> +void *__init fixmap_remap_fdt(phys_addr_t dt_phys, pgprot_t prot)
>  {
>         void *dt_virt;
>         int size;
> =20
> -       dt_virt =3D __fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
> +       dt_virt =3D __fixmap_remap_fdt(dt_phys, &size, prot);
>         if (!dt_virt)
>                 return NULL;
> =20

Sorry, I'm still confused why we want to call memblock_reserve() again.
Why not avoid it?

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 67ef25d037ea..d0d9de9da5c1 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -137,7 +137,7 @@ extern void init_mem_pgprot(void);
 extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
 			       unsigned long virt, phys_addr_t size,
 			       pgprot_t prot, bool page_mappings_only);
-extern void *fixmap_remap_fdt(phys_addr_t dt_phys);
+extern void *__fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t p=
rot);
 extern void mark_linear_text_alias_ro(void);
=20
 #define INIT_MM_CONTEXT(name)	\
diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
index b09b6f75f759..0701c2cf1534 100644
--- a/arch/arm64/kernel/kaslr.c
+++ b/arch/arm64/kernel/kaslr.c
@@ -65,9 +65,6 @@ static __init const u8 *kaslr_get_cmdline(void *fdt)
 	return default_cmdline;
 }
=20
-extern void *__init __fixmap_remap_fdt(phys_addr_t dt_phys, int *size,
-				       pgprot_t prot);
-
 /*
  * This routine will be executed with the kernel mapped at its default vir=
tual
  * address, and if it returns successfully, the kernel will be remapped, a=
nd
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 413d566405d1..3e97354566ff 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -181,9 +181,13 @@ static void __init smp_build_mpidr_hash(void)
=20
 static void __init setup_machine_fdt(phys_addr_t dt_phys)
 {
-	void *dt_virt =3D fixmap_remap_fdt(dt_phys);
+	int size;
+	void *dt_virt =3D __fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL);
 	const char *name;
=20
+	if (dt_virt)
+		memblock_reserve(dt_phys, size);
+
 	if (!dt_virt || !early_init_dt_scan(dt_virt)) {
 		pr_crit("\n"
 			"Error: invalid device tree blob at physical address %pa (virtual addre=
ss 0x%p)\n"
@@ -195,6 +199,9 @@ static void __init setup_machine_fdt(phys_addr_t dt_phy=
s)
 			cpu_relax();
 	}
=20
+	/* Early fixups are done, map the FDT as read-only now */
+	__fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
+
 	name =3D of_flat_dt_get_machine_name();
 	if (!name)
 		return;
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a170c6369a68..ddf6086cd9dd 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -940,19 +940,6 @@ void *__init __fixmap_remap_fdt(phys_addr_t dt_phys, i=
nt *size, pgprot_t prot)
 	return dt_virt;
 }
=20
-void *__init fixmap_remap_fdt(phys_addr_t dt_phys)
-{
-	void *dt_virt;
-	int size;
-
-	dt_virt =3D __fixmap_remap_fdt(dt_phys, &size, PAGE_KERNEL_RO);
-	if (!dt_virt)
-		return NULL;
-
-	memblock_reserve(dt_phys, size);
-	return dt_virt;
-}
-
 int __init arch_ioremap_pud_supported(void)
 {
 	/* only 4k granule supports level 1 block mappings */
