From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] powerpc/pmac: Fix DT refcount imbalance in pmac_pic_probe_oldstyle
Date: Tue,  3 Mar 2015 11:02:15 +0100
Message-ID: <1425376935-6226-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Internally, of_find_node_by_name() calls of_node_put() on its "from"
parameter, which must not be done on "master", as it's still in use, and
will be released manually later.  This may cause a zero kref refcount.

Call of_node_get() before to compensate for this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only

v2:
  - Avoid a logic change by adding a call to of_node_get() instead of
    replacing of_find_node_by_name() by of_get_child_by_name().
    No-one seems to remember which machines are affected by this.
---
 arch/powerpc/platforms/powermac/pic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 4c24bf60d39d2834..59cfc9d63c2d51a7 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -321,6 +321,9 @@ static void __init pmac_pic_probe_oldstyle(void)
 		max_irqs = max_real_irqs = 64;
 
 		/* We might have a second cascaded heathrow */
+
+		/* Compensate for of_node_put() in of_find_node_by_name() */
+		of_node_get(master);
 		slave = of_find_node_by_name(master, "mac-io");
 
 		/* Check ordering of master & slave */
-- 
1.9.1
