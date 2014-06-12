From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCHv7 4/5] mailbox: Fix deleteing poll timer
Date: Thu, 12 Jun 2014 22:32:22 +0530
Message-ID: <1402592542-7318-1-git-send-email-jaswinder.singh@linaro.org>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402592317-7043-1-git-send-email-jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn-UYDU3/A3LUY@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, loic.pallardy-qxv4g6HH51o@public.gmane.org, lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org, courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Try to delete the timer only if it was init/used.

Signed-off-by: LeyFoon Tan <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/mailbox/mailbox.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 336fa10..ae4abd9 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -480,7 +480,8 @@ void mbox_controller_unregister(struct mbox_controller *mbox)
 	for (i = 0; i < mbox->num_chans; i++)
 		mbox_free_channel(&mbox->chans[i]);
 
-	del_timer_sync(&mbox->poll);
+	if (mbox->txdone_poll)
+		del_timer_sync(&mbox->poll);
 
 	mutex_unlock(&con_mutex);
 }
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
