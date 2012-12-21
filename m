From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v5 5/7] pwm: Add devm_of_pwm_get() as exported API for users
Date: Fri, 21 Dec 2012 10:43:59 +0100
Message-ID: <1356083041-29179-6-git-send-email-peter.ujfalusi@ti.com>
References: <1356083041-29179-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1356083041-29179-1-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
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
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When booted with DT users can use devm version of of_pwm_get() to benefit
from automatic resource release.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 drivers/pwm/core.c  | 30 ++++++++++++++++++++++++++++++
 include/linux/pwm.h |  9 +++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 3cb741d..4a13da4 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -708,6 +708,36 @@ struct pwm_device *devm_pwm_get(struct device *dev, const char *con_id)
 }
 EXPORT_SYMBOL_GPL(devm_pwm_get);
 
+/**
+ * devm_of_pwm_get() - resource managed of_pwm_get()
+ * @dev: device for PWM consumer
+ * @np: device node to get the PWM from
+ * @con_id: consumer name
+ *
+ * This function performs like of_pwm_get() but the acquired PWM device will
+ * automatically be released on driver detach.
+ */
+struct pwm_device *devm_of_pwm_get(struct device *dev, struct device_node *np,
+				   const char *con_id)
+{
+	struct pwm_device **ptr, *pwm;
+
+	ptr = devres_alloc(devm_pwm_release, sizeof(**ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	pwm = of_pwm_get(np, con_id);
+	if (!IS_ERR(pwm)) {
+		*ptr = pwm;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return pwm;
+}
+EXPORT_SYMBOL_GPL(devm_of_pwm_get);
+
 static int devm_pwm_match(struct device *dev, void *res, void *data)
 {
 	struct pwm_device **p = res;
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 76a1959..70655a2 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -179,6 +179,8 @@ struct pwm_device *of_pwm_get(struct device_node *np, const char *con_id);
 void pwm_put(struct pwm_device *pwm);
 
 struct pwm_device *devm_pwm_get(struct device *dev, const char *con_id);
+struct pwm_device *devm_of_pwm_get(struct device *dev, struct device_node *np,
+				   const char *con_id);
 void devm_pwm_put(struct device *dev, struct pwm_device *pwm);
 #else
 static inline int pwm_set_chip_data(struct pwm_device *pwm, void *data)
@@ -230,6 +232,13 @@ static inline struct pwm_device *devm_pwm_get(struct device *dev,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct pwm_device *devm_of_pwm_get(struct device *dev,
+						 struct device_node *np,
+						 const char *con_id)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void devm_pwm_put(struct device *dev, struct pwm_device *pwm)
 {
 }
-- 
1.8.0.2
