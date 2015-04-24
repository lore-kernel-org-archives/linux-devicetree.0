From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [RFC 10/12] pwm: Probe PWM chip devices on demand
Date: Fri, 24 Apr 2015 16:47:26 +0200
Message-ID: <1429886848-5843-11-git-send-email-tomeu.vizoso@collabora.com>
References: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Alexander Holler <holler@ahsoftware.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: devicetree@vger.kernel.org

When looking up a PWM chip through its DT node, ensure that the
corresponding device has been registered.
---
 drivers/pwm/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index ba34c7d..31f486c 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -24,6 +24,7 @@
 #include <linux/radix-tree.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/of_platform.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/device.h>
@@ -479,6 +480,8 @@ static struct pwm_chip *of_node_to_pwmchip(struct device_node *np)
 {
 	struct pwm_chip *chip;
 
+	of_platform_device_ensure(np);
+
 	mutex_lock(&pwm_lock);
 
 	list_for_each_entry(chip, &pwm_chips, list)
-- 
2.3.6
