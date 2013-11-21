From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH] of: Document reason for missing !CONFIG_OF of_*() stubs
Date: Thu, 21 Nov 2013 13:05:36 +0000
Message-ID: <1385039136-1898-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

A lot of of_*() functions are not implemented to catch callers using
them without CONFIG_OF enabled. Document the reason for it in the of.h
header file so that users trying to implement more empty functions will
(hopefully) think twice before submitting more empty stub function
patches.

Signed-off-by: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>
---
 include/linux/of.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 06d32ad62bc0..630e25df63c1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -379,6 +379,14 @@ const char *of_prop_next_string(struct property *prop, const char *cur);
 int of_device_is_stdout_path(struct device_node *dn);
 
 #else /* CONFIG_OF */
+/*
+ * Before you add a empty functions here to fix a build error, ask yourself the
+ * following question: Will the drivers that is failing to compile ever work
+ * without CONFIG_OF?
+ *
+ * If not then make the driver depend on CONFIG_OF. Many of_*() functions do not
+ * have empty versions to catch exactly that situation.
+ */
 
 static inline const char* of_node_full_name(struct device_node *np)
 {
-- 
1.8.3.2
