From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v3 1/6] nds32: Remove phys_initrd_start and phys_initrd_size
Date: Wed, 31 Oct 2018 12:28:38 -0700
Message-ID: <20181031192843.13230-2-f.fainelli@gmail.com>
References: <20181031192843.13230-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181031192843.13230-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk+kernel@armlinux.org.uk>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrey Konovalov <andreyknvl@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stefan Agner <stefan@agner.ch>, Johannes Weiner <hannes@cmpxchg.org>, Greg Hackmann <ghackmann@android.com>, Kristina Martsenko <kristina.martsenko@arm.com>, CHANDAN VN <chandan.vn@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This will conflict with a subsequent change making phys_initrd_start and
phys_initrd_size global variables. nds32 does not make use of those nor
provides a suitable declarations so just get rid of them.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/nds32/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/nds32/mm/init.c b/arch/nds32/mm/init.c
index c713d2ad55dc..32f55a24ccbb 100644
--- a/arch/nds32/mm/init.c
+++ b/arch/nds32/mm/init.c
@@ -22,8 +22,6 @@
 DEFINE_PER_CPU(struct mmu_gather, mmu_gathers);
 DEFINE_SPINLOCK(anon_alias_lock);
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
-extern unsigned long phys_initrd_start;
-extern unsigned long phys_initrd_size;
 
 /*
  * empty_zero_page is a special page that is used for
-- 
2.17.1
