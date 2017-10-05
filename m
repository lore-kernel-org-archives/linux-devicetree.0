From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/6] of: remove struct property.unique_id for FDT
Date: Thu,  5 Oct 2017 14:44:18 -0500
Message-ID: <20171005194422.26224-3-robh@kernel.org>
References: <20171005194422.26224-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005194422.26224-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <nico@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <glikely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

Only Sparc uses unique_id, so remove it for FDT builds and shrink struct
property a bit making the unflattened DT less of a memory hog.

Cc: Nicolas Pitre <nico@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 include/linux/of.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index cfc34117fc92..8f9e96752837 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -38,7 +38,9 @@ struct property {
 	void	*value;
 	struct property *next;
 	unsigned long _flags;
+#if defined(CONFIG_OF_PROMTREE)
 	unsigned int unique_id;
+#endif
 	struct bin_attribute attr;
 };
 
-- 
2.11.0
