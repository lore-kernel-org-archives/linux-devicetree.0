From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] of/device: Prevent buffer overflow in of_device_modalias()
Date: Wed, 23 Aug 2017 18:04:04 -0700
Message-ID: <20170824010404.9145-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

As of_device_get_modalias() returns the number of bytes that would have
been written to the target string, regardless of how much did fit in the
buffer, it's possible that the returned index points beyond the buffer
passed to of_device_modalias() - causing memory beyond the buffer to be
null terminated.

Fixes: 0634c2958927 ("of: Add function for generating a DT modalias with a newline")
Cc: Rob Herring <robh@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/of/device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 7cff599a9c6a..b58ca92934cb 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -262,6 +262,8 @@ ssize_t of_device_modalias(struct device *dev, char *str, ssize_t len)
 	ssize_t sl = of_device_get_modalias(dev, str, len - 2);
 	if (sl < 0)
 		return sl;
+	if (sl > len - 2)
+		return -ENOMEM;
 
 	str[sl++] = '\n';
 	str[sl] = 0;
-- 
2.12.0
