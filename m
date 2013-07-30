Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:12964 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758329Ab3G3JUu (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 30 Jul 2013 05:20:50 -0400
From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] Driver core: Add accessor for device tree node
Date: Tue, 30 Jul 2013 18:20:47 +0900
Message-id: <007601ce8d06$13dbb890$3b9329b0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Sender: devicetree-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jingoo Han <jg1.han@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Add the wrapper function for retrieving device tree node instead of
accessing dev->of_node directly.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 include/linux/device.h |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 22b546a..4faaa51 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -917,6 +917,11 @@ static inline void *dev_get_platdata(const struct device *dev)
 	return dev->platform_data;
 }
 
+static inline void *dev_get_of_node(const struct device *dev)
+{
+	return dev->of_node;
+}
+
 /*
  * Manual binding of a device to driver. See drivers/base/bus.c
  * for information on use.
-- 
1.7.10.4


