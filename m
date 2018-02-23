From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v6 12/20] firmware: arm_scmi: add option for polling based
 performance domain operations
Date: Fri, 23 Feb 2018 16:23:42 +0000
Message-ID: <1519403030-21189-13-git-send-email-sudeep.holla@arm.com>
References: <1519403030-21189-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519403030-21189-1-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ALKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
Cc: Alexey Klimov <klimov.linux@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

In order to implement fast CPU DVFS switching, we need to perform all
DVFS operations atomically. Since SCMI transfer already provide option
to choose between pooling vs interrupt driven(default), we can opt for
polling based transfers for set,get performance domain operations.

This patch adds option to choose between polling vs interrupt driven
SCMI transfers for set,get performance level operations.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/perf.c | 19 +++++++++++--------
 include/linux/scmi_protocol.h    |  8 ++++----
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index c189c5a3163f..ba7c8afb07c0 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -303,8 +303,8 @@ static int scmi_perf_limits_get(const struct scmi_handle *handle, u32 domain,
 	return ret;
 }
 
-static int
-scmi_perf_level_set(const struct scmi_handle *handle, u32 domain, u32 level)
+static int scmi_perf_level_set(const struct scmi_handle *handle, u32 domain,
+			       u32 level, bool poll)
 {
 	int ret;
 	struct scmi_xfer *t;
@@ -315,6 +315,7 @@ scmi_perf_level_set(const struct scmi_handle *handle, u32 domain, u32 level)
 	if (ret)
 		return ret;
 
+	t->hdr.poll_completion = poll;
 	lvl = t->tx.buf;
 	lvl->domain = cpu_to_le32(domain);
 	lvl->level = cpu_to_le32(level);
@@ -325,8 +326,8 @@ scmi_perf_level_set(const struct scmi_handle *handle, u32 domain, u32 level)
 	return ret;
 }
 
-static int
-scmi_perf_level_get(const struct scmi_handle *handle, u32 domain, u32 *level)
+static int scmi_perf_level_get(const struct scmi_handle *handle, u32 domain,
+			       u32 *level, bool poll)
 {
 	int ret;
 	struct scmi_xfer *t;
@@ -336,6 +337,7 @@ scmi_perf_level_get(const struct scmi_handle *handle, u32 domain, u32 *level)
 	if (ret)
 		return ret;
 
+	t->hdr.poll_completion = poll;
 	*(__le32 *)t->tx.buf = cpu_to_le32(domain);
 
 	ret = scmi_do_xfer(handle, t);
@@ -411,23 +413,24 @@ static int scmi_dvfs_get_transition_latency(const struct scmi_handle *handle,
 }
 
 static int scmi_dvfs_freq_set(const struct scmi_handle *handle, u32 domain,
-			      unsigned long freq)
+			      unsigned long freq, bool poll)
 {
 	struct scmi_perf_info *pi = handle->perf_priv;
 	struct perf_dom_info *dom = pi->dom_info + domain;
 
-	return scmi_perf_level_set(handle, domain, freq / dom->mult_factor);
+	return scmi_perf_level_set(handle, domain, freq / dom->mult_factor,
+				   poll);
 }
 
 static int scmi_dvfs_freq_get(const struct scmi_handle *handle, u32 domain,
-			      unsigned long *freq)
+			      unsigned long *freq, bool poll)
 {
 	int ret;
 	u32 level;
 	struct scmi_perf_info *pi = handle->perf_priv;
 	struct perf_dom_info *dom = pi->dom_info + domain;
 
-	ret = scmi_perf_level_get(handle, domain, &level);
+	ret = scmi_perf_level_get(handle, domain, &level, poll);
 	if (!ret)
 		*freq = level * dom->mult_factor;
 
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 0bb12f822f12..50246a1ee630 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -109,18 +109,18 @@ struct scmi_perf_ops {
 	int (*limits_get)(const struct scmi_handle *handle, u32 domain,
 			  u32 *max_perf, u32 *min_perf);
 	int (*level_set)(const struct scmi_handle *handle, u32 domain,
-			 u32 level);
+			 u32 level, bool poll);
 	int (*level_get)(const struct scmi_handle *handle, u32 domain,
-			 u32 *level);
+			 u32 *level, bool poll);
 	int (*device_domain_id)(struct device *dev);
 	int (*get_transition_latency)(const struct scmi_handle *handle,
 				      struct device *dev);
 	int (*add_opps_to_device)(const struct scmi_handle *handle,
 				  struct device *dev);
 	int (*freq_set)(const struct scmi_handle *handle, u32 domain,
-			unsigned long rate);
+			unsigned long rate, bool poll);
 	int (*freq_get)(const struct scmi_handle *handle, u32 domain,
-			unsigned long *rate);
+			unsigned long *rate, bool poll);
 };
 
 /**
-- 
2.7.4
