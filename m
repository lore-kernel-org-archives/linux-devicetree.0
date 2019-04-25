From: jojo_zeng@126.com
Subject: [PATCH]  of/device.c: fix the wrong comments
Date: Thu, 25 Apr 2019 09:45:54 +0800
Message-ID: <1556156754-18993-1-git-send-email-jojo_zeng@126.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jojo Zeng <jojo_zeng@126.com>
List-Id: devicetree@vger.kernel.org

From: Jojo Zeng <jojo_zeng@126.com>

the comments which discribed the input parameters of of_match_device(). 
the name is changed, so fix it.

Signed-off-by: Jojo Zeng <jojo_zeng@126.com>
---
 drivers/of/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 3717f2a..da81583 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -17,7 +17,7 @@
 
 /**
  * of_match_device - Tell if a struct device matches an of_device_id list
- * @ids: array of of device match structures to search in
+ * @matches: array of of device match structures to search in
  * @dev: the of device structure to match against
  *
  * Used by a driver to check whether an platform_device present in the
-- 
2.7.4
