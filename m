From: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v8 1/7] watchdog: core: add and use watchdog_is_valid_timeout
 function
Date: Wed, 13 Feb 2013 13:22:24 +0100
Message-ID: <1360758150-23004-2-git-send-email-fabio.porcedda@gmail.com>
References: <1360758150-23004-1-git-send-email-fabio.porcedda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360758150-23004-1-git-send-email-fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Fabio Porcedda <fabio.porcedda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/watchdog/watchdog_core.c | 14 ++++++++++++++
 drivers/watchdog/watchdog_dev.c  |  3 +--
 include/linux/watchdog.h         |  2 ++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 3796434..f10fa31 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -43,6 +43,20 @@ static DEFINE_IDA(watchdog_ida);
 static struct class *watchdog_class;
 
 /**
+ * watchdog_is_valid_timeout() - check if the timeout is within a valid range
+ * @timeout: value to check
+ */
+bool watchdog_is_valid_timeout(struct watchdog_device *wdd, uint timeout)
+{
+	if (wdd->min_timeout < wdd->max_timeout)
+		return (wdd->min_timeout <= timeout) &&
+			(timeout <= wdd->max_timeout);
+	else
+		return (timeout > 0);
+}
+EXPORT_SYMBOL_GPL(watchdog_is_valid_timeout);
+
+/**
  * watchdog_register_device() - register a watchdog device
  * @wdd: watchdog device
  *
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index ef8edec..49976f8 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -200,8 +200,7 @@ static int watchdog_set_timeout(struct watchdog_device *wddev,
 	    !(wddev->info->options & WDIOF_SETTIMEOUT))
 		return -EOPNOTSUPP;
 
-	if ((wddev->max_timeout != 0) &&
-	    (timeout < wddev->min_timeout || timeout > wddev->max_timeout))
+	if (!watchdog_is_valid_timeout(wddev, timeout))
 		return -EINVAL;
 
 	mutex_lock(&wddev->lock);
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 3a9df2f..9ae945e 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -130,6 +130,8 @@ static inline void *watchdog_get_drvdata(struct watchdog_device *wdd)
 }
 
 /* drivers/watchdog/watchdog_core.c */
+extern bool watchdog_is_valid_timeout(struct watchdog_device *wdd,
+				      uint timeout);
 extern int watchdog_register_device(struct watchdog_device *);
 extern void watchdog_unregister_device(struct watchdog_device *);
 
-- 
1.8.1.1
