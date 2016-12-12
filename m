From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH] of/platform: depopulate devices in the reverse order of
 creation
Date: Mon, 12 Dec 2016 11:39:05 -0700
Message-ID: <20161212183905.GA30702@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

If the DT has inter-dependencies, then the devices need to be removed
in the right order to avoid removal problems.

Assuming the DT is constructed so that EPROBE_DEFER doesn't happen
during creating then a good way to avoid removal problems is reversing
the order during depopulation.

Signed-off-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
---
 drivers/of/platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

In my specific case I have a gpio driver, followed by a i2c bitbang
using that driver. So gpiolib prints an error if it the gpio driver is
removed before the gpio client..

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index cd72c0156db2ba..5720fe44f991e9 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -568,7 +568,8 @@ static int of_platform_device_destroy(struct device *dev, void *data)
 void of_platform_depopulate(struct device *parent)
 {
 	if (parent->of_node && of_node_check_flag(parent->of_node, OF_POPULATED_BUS)) {
-		device_for_each_child(parent, NULL, of_platform_device_destroy);
+		device_for_each_child_reverse(parent, NULL,
+					      of_platform_device_destroy);
 		of_node_clear_flag(parent->of_node, OF_POPULATED_BUS);
 	}
 }
-- 
2.7.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
