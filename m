From: David Howells <dhowells@redhat.com>
Subject: [PATCH 1/7] Make for_each_child_of_node() reference its args when
 CONFIG_OF=n
Date: Fri, 03 Jan 2014 16:07:23 +0000
Message-ID: <20140103160723.8153.14334.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org
Cc: Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, dhowells@redhat.com, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Make for_each_child_of_node() reference its args when CONFIG_OF=n to avoid
warnings like:

	drivers/leds/leds-pwm.c:88:22: warning: unused variable 'node' [-Wunused-variable]
	  struct device_node *node = pdev->dev.of_node;
			      ^

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Grant Likely <grant.likely@linaro.org>
cc: Rob Herring <robh+dt@kernel.org>
cc: devicetree@vger.kernel.org
---

 include/linux/of.h |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 276c546980d8..70c64ba17fa5 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -377,8 +377,13 @@ static inline bool of_have_populated_dt(void)
 	return false;
 }
 
+/* Kill an unused variable warning on a device_node pointer */
+static inline void __of_use_dn(const struct device_node *np)
+{
+}
+
 #define for_each_child_of_node(parent, child) \
-	while (0)
+	while (__of_use_dn(parent), __of_use_dn(child), 0)
 
 #define for_each_available_child_of_node(parent, child) \
 	while (0)
