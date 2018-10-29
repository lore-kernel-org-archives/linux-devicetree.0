From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/2 v5] of/fdt: Remove definition check for __early_init_dt_declare_initrd()
Date: Mon, 29 Oct 2018 12:00:14 -0700
Message-ID: <20181029190014.6455-3-f.fainelli@gmail.com>
References: <20181029190014.6455-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029190014.6455-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk+kernel@armlinux.org.uk>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrey Konovalov <andreyknvl@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stefan Agner <stefan@agner.ch>, Johannes Weiner <hannes@cmpxchg.org>, Greg Hackmann <ghackmann@android.com>, Kristina Martsenko <kristina.martsenko@arm.com>, CHANDAN VN <chandan.vn@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

With the one and only architecture (ARM64) no longer defining a custom
__early_init_dt_declare_initrd() function, just get rid of the check for
that function being already defined.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/of/fdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 76c83c1ffeda..0f6430265e4d 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -892,7 +892,6 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
 }
 
 #ifdef CONFIG_BLK_DEV_INITRD
-#ifndef __early_init_dt_declare_initrd
 static void __early_init_dt_declare_initrd(unsigned long start,
 					   unsigned long end)
 {
@@ -900,7 +899,6 @@ static void __early_init_dt_declare_initrd(unsigned long start,
 	initrd_end = (unsigned long)__va(end);
 	initrd_below_start_ok = 1;
 }
-#endif
 
 /**
  * early_init_dt_check_for_initrd - Decode initrd location from flat tree
-- 
2.17.1
