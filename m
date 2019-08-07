From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH] of/platform: Fix device_links_supplier_sync_state_resume() warning
Date: Tue,  6 Aug 2019 19:05:58 -0700
Message-ID: <20190807020559.74458-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, Qian Cai <cai@lca.pw>, kernel-team@android.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In platforms/devices which have CONFIG_OF turned on but don't have a
populated DT, the calls to device_links_supplier_sync_state_pause() and
device_links_supplier_sync_state_resume() can get mismatched. This will
cause a warning during boot. Fix the warning by making sure the calls are
matched even in that case.

Reported-by: Qian Cai <cai@lca.pw>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index a2a4e4b79d43..e5f7e40df439 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -723,7 +723,8 @@ arch_initcall_sync(of_platform_default_populate_init);
 
 static int __init of_platform_sync_state_init(void)
 {
-	device_links_supplier_sync_state_resume();
+	if (of_have_populated_dt())
+		device_links_supplier_sync_state_resume();
 	return 0;
 }
 late_initcall_sync(of_platform_sync_state_init);
-- 
2.23.0.rc1.153.gdeed80330f-goog
