From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH] Revert "of: Fix premature bootconsole disable with 'stdout-path'"
Date: Tue, 17 Mar 2015 16:46:33 -0400
Message-ID: <1426625193-5055-1-git-send-email-peter@hurleysoftware.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pranith Kumar <bobby.prani@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Peter Hurley <peter@hurleysoftware.com>
List-Id: devicetree@vger.kernel.org

This reverts commit 2fa645cb2703d9b3786d850db815414dfeefa51d.

The assumption that at least 1 preferred console will be registered
when the stdout-path property is set is invalid, which can result
in _no_ consoles.

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/of/base.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index adb8764..8b904e5 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1893,10 +1893,8 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 			name = of_get_property(of_chosen, "linux,stdout-path", NULL);
 		if (IS_ENABLED(CONFIG_PPC) && !name)
 			name = of_get_property(of_aliases, "stdout", NULL);
-		if (name) {
+		if (name)
 			of_stdout = of_find_node_opts_by_path(name, &of_stdout_options);
-			add_preferred_console("stdout-path", 0, NULL);
-		}
 	}
 
 	if (!of_aliases)
-- 
2.3.3
