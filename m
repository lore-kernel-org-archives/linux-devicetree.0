From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv5 2/5] input/cma3000_d0x: Check silicon version
Date: Wed,  2 Nov 2011 15:49:10 +0100
Message-ID: <1320245353-32125-3-git-send-email-ricardo.ribalda__42456.5012952828$1320423656$gmane$org@gmail.com>
References: <1320245353-32125-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320245353-32125-1-git-send-email-ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, aghayal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, peter.ujfalusi@ti.c
Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Improve probing of the cma3000 chip, by checking the revision of the
device.

v4: Add ACKs to patch

v2: Fixes suggested by Jonathan Cameron
	-Remove WhoamI pr_info

Acked-by: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/input/misc/cma3000_d0x.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/input/misc/cma3000_d0x.c b/drivers/input/misc/cma3000_d0x.c
index e66036d..97e36fa 100644
--- a/drivers/input/misc/cma3000_d0x.c
+++ b/drivers/input/misc/cma3000_d0x.c
@@ -27,6 +27,8 @@
 
 #include "cma3000_d0x.h"
 
+#define CMA3000_REV         0x10
+
 #define CMA3000_WHOAMI      0x00
 #define CMA3000_REVID       0x01
 #define CMA3000_CTRL        0x02
@@ -420,7 +422,11 @@ struct cma3000_accl_data *cma3000_init(struct device *dev, int irq,
 		error = rev;
 		goto err_free_mem;
 	}
-
+	if (rev != CMA3000_REV) {
+		error = -EINVAL;
+		pr_err("CMA3000 Accelerometer: Unknown Revision %x\n", rev);
+		goto err_free_mem;
+	}
 	pr_info("CMA3000 Accelerometer: Revision %x\n", rev);
 
 	error = request_threaded_irq(irq, NULL, cma3000_thread_irq,
-- 
1.7.7.1
