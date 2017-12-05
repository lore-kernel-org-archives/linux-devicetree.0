From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 2/2] of: overlay: Fix (un)locking in of_overlay_apply()
Date: Tue,  5 Dec 2017 16:27:03 +0100
Message-ID: <1512487623-30450-3-git-send-email-geert+renesas@glider.be>
References: <1512487623-30450-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512487623-30450-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The special overlay mutex is taken first, hence it should be released
last in the error path.

of_resolve_phandles() must be called with of_mutex held.  Without it, a
node and new phandle could be added via of_attach_node(), making the max
phandle wrong.

free_overlay_changeset() must be called with of_mutex held, if any
non-trivial cleanup is to be done.

Hence move "mutex_lock(&of_mutex)" up, as suggested by Frank, and merge
the two tail statements of the success and error paths, now they became
identical.

Note that while the two mutexes are adjacent, we still need both:
__of_changeset_apply_notify(), which is called by __of_changeset_apply()
unlocks of_mutex, then does notifications then locks of_mutex.  So the
mutex get released in the middle of of_overlay_apply()

Fixes: f948d6d8b792bb90 ("of: overlay: avoid race condition between applying multiple overlays")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Actually base on top of the revert of commit bd80e2555c5c9d45 ("of:
    overlay: Fix cleanup order in of_overlay_apply()"), which was
    dropped by Rob,
  - Improve patch description,

v2:
  - Rework on top of "of: overlay: Fix memory leak in of_overlay_apply()
    error path".
---
 drivers/of/overlay.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index bdb9695ed2d889a7..1ae4ff832b23a36e 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -706,12 +706,11 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 	}
 
 	of_overlay_mutex_lock();
+	mutex_lock(&of_mutex);
 
 	ret = of_resolve_phandles(tree);
 	if (ret)
-		goto err_overlay_unlock;
-
-	mutex_lock(&of_mutex);
+		goto err_free_overlay_changeset;
 
 	ret = init_overlay_changeset(ovcs, tree);
 	if (ret)
@@ -755,18 +754,14 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
 			ret = ret_tmp;
 	}
 
-	mutex_unlock(&of_mutex);
-	of_overlay_mutex_unlock();
-
-	goto out;
-
-err_overlay_unlock:
-	of_overlay_mutex_unlock();
+	goto out_unlock;
 
 err_free_overlay_changeset:
 	free_overlay_changeset(ovcs);
 
+out_unlock:
 	mutex_unlock(&of_mutex);
+	of_overlay_mutex_unlock();
 
 out:
 	pr_debug("%s() err=%d\n", __func__, ret);
-- 
2.7.4
