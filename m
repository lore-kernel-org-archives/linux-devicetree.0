From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 1/3] libfdt: Add fdt16_to_cpu utility function
Date: Fri, 23 Sep 2011 11:02:52 -0700
Message-ID: <1316800974-30129-2-git-send-email-robotboy@chromium.org>
References: <1316800974-30129-1-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316800974-30129-1-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This utility routine will be used in the variable size cell literal
append code.  It is a straightforward adaptation of the fdt32_to_cpu
function.

Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 libfdt/libfdt_env.h |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
index 449bf60..da952e7 100644
--- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -6,6 +6,12 @@
 #include <string.h>
 
 #define _B(n)	((unsigned long long)((uint8_t *)&x)[n])
+static inline uint16_t fdt16_to_cpu(uint16_t x)
+{
+	return (_B(0) << 8) | _B(1);
+}
+#define cpu_to_fdt16(x) fdt16_to_cpu(x)
+
 static inline uint32_t fdt32_to_cpu(uint32_t x)
 {
 	return (_B(0) << 24) | (_B(1) << 16) | (_B(2) << 8) | _B(3);
-- 
1.7.3.1
