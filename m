From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v5 3/7] pwm: Correct parameter name in header for *pwm_get() functions
Date: Fri, 21 Dec 2012 10:43:57 +0100
Message-ID: <1356083041-29179-4-git-send-email-peter.ujfalusi@ti.com>
References: <1356083041-29179-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1356083041-29179-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@secretlab.ca>, Thierry Reding <thierry.reding@avionic-design.de>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: devicetree@vger.kernel.org

To synchronize the header file definition and the actual code. In the code
the consumer parameter is named as con_id, change the header file and replace
consumer -> con_id in the parameter list.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 include/linux/pwm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 6d661f3..cc908a5 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -174,10 +174,10 @@ struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
 struct pwm_device *of_pwm_xlate_with_flags(struct pwm_chip *pc,
 		const struct of_phandle_args *args);
 
-struct pwm_device *pwm_get(struct device *dev, const char *consumer);
+struct pwm_device *pwm_get(struct device *dev, const char *con_id);
 void pwm_put(struct pwm_device *pwm);
 
-struct pwm_device *devm_pwm_get(struct device *dev, const char *consumer);
+struct pwm_device *devm_pwm_get(struct device *dev, const char *con_id);
 void devm_pwm_put(struct device *dev, struct pwm_device *pwm);
 #else
 static inline int pwm_set_chip_data(struct pwm_device *pwm, void *data)
-- 
1.8.0.2

