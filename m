From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v3 1/3] of/fdt: Absorb ARM64's __early_init_dt_declare_initrd()
Date: Wed, 24 Oct 2018 17:17:40 -0700
Message-ID: <20181025001742.6510-2-f.fainelli@gmail.com>
References: <20181025001742.6510-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025001742.6510-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, Florian Fainelli <f.fainelli@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <marc.zyngier@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Christoffer Dall <christoffer.dall@arm.com>, Andrey Konovalov <andreyknvl@google.com>, "moderated list:ARM64 PORT
        AARCH64 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE" <devicetree@vger.kernel.org>, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

ARM64 is the only architecture that requires a re-definition of
__early_init_dt_declare_initrd(), absorb its custom implemention in
drivers/of/fdt.c.

Suggested-by: Rob Herring <robh@kernel.org.
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/of/fdt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 800ad252cf9c..7d316f008f22 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -896,9 +896,14 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
 static void __early_init_dt_declare_initrd(unsigned long start,
 					   unsigned long end)
 {
+#if IS_ENABLED(CONFIG_ARM64)
+	initrd_start = start;
+	initrd_end = end;
+#else
 	initrd_start = (unsigned long)__va(start);
 	initrd_end = (unsigned long)__va(end);
 	initrd_below_start_ok = 1;
+#endif
 }
 #endif
 
-- 
2.17.1
