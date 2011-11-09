From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv6_input/next 5/5] input/cma3000_d0x: Match comment to name of
 struct
Date: Wed,  9 Nov 2011 22:37:32 +0100
Message-ID: <1320874652-18371-6-git-send-email-ricardo.ribalda__24142.5346270718$1320874719$gmane$org@gmail.com>
References: <1320874652-18371-1-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320874652-18371-1-git-send-email-ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, aghayal-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, peter.ujfalusi@ti
List-Id: devicetree@vger.kernel.org

Acked-by: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 include/linux/input/cma3000.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/input/cma3000.h b/include/linux/input/cma3000.h
index cbbaac2..e8c28e8 100644
--- a/include/linux/input/cma3000.h
+++ b/include/linux/input/cma3000.h
@@ -33,7 +33,7 @@
 #define CMARANGE_8G   8000
 
 /**
- * struct cma3000_i2c_platform_data - CMA3000 Platform data
+ * struct cma3000_platform_data - CMA3000 Platform data
  * @fuzz_x: Noise on X Axis
  * @fuzz_y: Noise on Y Axis
  * @fuzz_z: Noise on Z Axis
-- 
1.7.7.2
