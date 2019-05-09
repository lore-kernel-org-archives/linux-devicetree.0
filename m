From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 2/2] of/fdt: Mark initial_boot_params as __ro_after_init
Date: Thu,  9 May 2019 14:55:38 -0700
Message-ID: <20190509215538.93346-2-swboyd@chromium.org>
References: <20190509215538.93346-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509215538.93346-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>
List-Id: devicetree@vger.kernel.org

The FDT pointer, i.e. initial_boot_params, shouldn't be changed after
init. It's only set by boot code and then the only user of the FDT is
the raw sysfs reading API. Mark this pointer with __ro_after_init so
that the pointer can't be changed after init.

Cc: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 918098c9f72a..3d36b5afd9bd 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -516,7 +516,7 @@ EXPORT_SYMBOL_GPL(of_fdt_unflatten_tree);
 int __initdata dt_root_addr_cells;
 int __initdata dt_root_size_cells;
 
-void *initial_boot_params;
+void *initial_boot_params __ro_after_init;
 
 #ifdef CONFIG_OF_EARLY_FLATTREE
 
-- 
Sent by a computer through tubes
