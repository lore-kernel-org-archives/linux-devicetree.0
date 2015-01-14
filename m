From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] powerpc/pmac: Fix DT refcount imbalance in pmac_pic_probe_oldstyle
Date: Wed, 14 Jan 2015 14:51:57 +0100
Message-ID: <1421243519-6257-2-git-send-email-geert+renesas@glider.be>
References: <1421243519-6257-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421243519-6257-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jingoo Han <jg1.han@samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

of_find_node_by_name() calls of_node_put() on its "from" parameter,
which must not be done on "master", as it's still in use, and will be
released manually later.  This may cause a zero kref refcount.
Use of_get_child_by_name() instead to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linuxppc-dev@lists.ozlabs.org
---
Compile-tested only
---
 arch/powerpc/platforms/powermac/pic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 4c24bf60d39d2834..90ada1209c118902 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -321,7 +321,7 @@ static void __init pmac_pic_probe_oldstyle(void)
 		max_irqs = max_real_irqs = 64;
 
 		/* We might have a second cascaded heathrow */
-		slave = of_find_node_by_name(master, "mac-io");
+		slave = of_get_child_by_name(master, "mac-io");
 
 		/* Check ordering of master & slave */
 		if (of_device_is_compatible(master, "gatwick")) {
-- 
1.9.1
