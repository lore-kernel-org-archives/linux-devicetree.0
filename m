From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v4 4/7] pwm: core: Rename of_pwm_request() to of_pwm_get() and
 export it
Date: Wed, 12 Dec 2012 10:04:49 +0100
Message-ID: <1355303092-15523-5-git-send-email-peter.ujfalusi@ti.com>
References: <1355303092-15523-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1355303092-15523-1-git-send-email-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
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

Allow client driver to use of_pwm_get() to get the PWM they need. This
is needed for drivers which handle more than one PWM separately, like
leds-pwm driver, which have:

pwmleds {
	compatible = "pwm-leds";
	kpad {
		label = "omap4::keypad";
		pwms = <&twl_pwm 0 7812500>;
		max-brightness = <127>;
	};

	charging {
		label = "omap4:green:chrg";
		pwms = <&twl_pwmled 0 7812500>;
		max-brightness = <255>;
	};
};

in the dts files.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 drivers/pwm/core.c  | 8 ++++----
 include/linux/pwm.h | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 903138b..3cb741d 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -471,7 +471,7 @@ static struct pwm_chip *of_node_to_pwmchip(struct device_node *np)
 }
 
 /**
- * of_pwm_request() - request a PWM via the PWM framework
+ * of_pwm_get() - request a PWM via the PWM framework
  * @np: device node to get the PWM from
  * @con_id: consumer name
  *
@@ -486,8 +486,7 @@ static struct pwm_chip *of_node_to_pwmchip(struct device_node *np)
  * becomes mandatory for devices that look up the PWM device via the con_id
  * parameter.
  */
-static struct pwm_device *of_pwm_request(struct device_node *np,
-					 const char *con_id)
+struct pwm_device *of_pwm_get(struct device_node *np, const char *con_id)
 {
 	struct pwm_device *pwm = NULL;
 	struct of_phandle_args args;
@@ -545,6 +544,7 @@ put:
 
 	return pwm;
 }
+EXPORT_SYMBOL_GPL(of_pwm_get);
 
 /**
  * pwm_add_table() - register PWM device consumers
@@ -587,7 +587,7 @@ struct pwm_device *pwm_get(struct device *dev, const char *con_id)
 
 	/* look up via DT first */
 	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
-		return of_pwm_request(dev->of_node, con_id);
+		return of_pwm_get(dev->of_node, con_id);
 
 	/*
 	 * We look up the provider in the static table typically provided by
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index cc908a5..76a1959 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -175,6 +175,7 @@ struct pwm_device *of_pwm_xlate_with_flags(struct pwm_chip *pc,
 		const struct of_phandle_args *args);
 
 struct pwm_device *pwm_get(struct device *dev, const char *con_id);
+struct pwm_device *of_pwm_get(struct device_node *np, const char *con_id);
 void pwm_put(struct pwm_device *pwm);
 
 struct pwm_device *devm_pwm_get(struct device *dev, const char *con_id);
@@ -213,6 +214,12 @@ static inline struct pwm_device *pwm_get(struct device *dev,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct pwm_device *of_pwm_get(struct device_node *np,
+					    const char *con_id)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void pwm_put(struct pwm_device *pwm)
 {
 }
-- 
1.8.0
