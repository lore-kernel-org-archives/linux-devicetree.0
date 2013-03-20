From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 01/11] OF: add empty of_device_is_available for !OF
Date: Wed, 20 Mar 2013 17:54:01 -0500
Message-ID: <1363820051-24428-2-git-send-email-robherring2@gmail.com>
References: <1363820051-24428-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363820051-24428-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Arnd Bergmann <arnd@arndb.de>, linus.walleij@linaro.org, Russell King <linux@arm.linux.org.uk>, haojian.zhuang@linaro.org, pawel.moll@arm.com, john.stultz@linaro.org, tglx@linutronix.de, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Add an empty version of of_device_is_available.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
---
 include/linux/of.h |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index a0f1292..6fe655b 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -379,6 +379,11 @@ static inline int of_device_is_compatible(const struct device_node *device,
 	return 0;
 }
 
+static inline int of_device_is_available(const struct device_node *device,)
+{
+	return 0;
+}
+
 static inline struct property *of_find_property(const struct device_node *np,
 						const char *name,
 						int *lenp)
-- 
1.7.10.4
