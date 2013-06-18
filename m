From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] [media] coda: fix missing unlock on error in coda_stop_streaming()
Date: Tue, 18 Jun 2013 13:00:17 +0800
Message-ID: <CAPgLHd9hFGfuQ2Esm-7C1YdSgWojDJRADwv8_m5DnJ6UAFJtpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: mchehab@redhat.com, grant.likely@linaro.org, rob.herring@calxeda.com, p.zabel@pengutronix.de, javier.martin@vista-silicon.com, k.debski@samsung.com, hans.verkuil@cisco.com
Cc: yongjun_wei@trendmicro.com.cn, linux-media@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Add the missing unlock before return from function coda_stop_streaming()
in the error handling case.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/media/platform/coda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/coda.c b/drivers/media/platform/coda.c
index df4ada88..2c3cd17 100644
--- a/drivers/media/platform/coda.c
+++ b/drivers/media/platform/coda.c
@@ -1347,6 +1347,7 @@ static int coda_stop_streaming(struct vb2_queue *q)
 	if (coda_command_sync(ctx, CODA_COMMAND_SEQ_END)) {
 		v4l2_err(&dev->v4l2_dev,
 			 "CODA_COMMAND_SEQ_END failed\n");
+		mutex_unlock(&dev->coda_mutex);
 		return -ETIMEDOUT;
 	}
 	mutex_unlock(&dev->coda_mutex);
