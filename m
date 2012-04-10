From: "Bert Kenward" <bert.kenward-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] Remove invalid macro starting with _ from libfdt_env.h
Date: Tue, 10 Apr 2012 08:00:15 -0700
Message-ID: <89AE14E37D740B4796DC14566DF6325EF50AFFFAA9@SJEXCHCCR02.corp.ad.broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

libfdt_env.h in the device tree compiler currently defines a _B() macro. This is in the
namespace reserved for the implementation, and Cygwin's ctype.h actually defines a macro
with this name. This renames _B to EXTRACT_BYTE.

Signed-off-by: Bert Kenward <bert.kenward-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 libfdt/libfdt_env.h |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/libfdt/libfdt_env.h b/libfdt/libfdt_env.h
index da952e7..213d7fb 100644
--- a/libfdt/libfdt_env.h
+++ b/libfdt/libfdt_env.h
@@ -5,25 +5,25 @@
 #include <stdint.h>
 #include <string.h>
 
-#define _B(n)	((unsigned long long)((uint8_t *)&x)[n])
+#define EXTRACT_BYTE(n)	((unsigned long long)((uint8_t *)&x)[n])
 static inline uint16_t fdt16_to_cpu(uint16_t x)
 {
-	return (_B(0) << 8) | _B(1);
+	return (EXTRACT_BYTE(0) << 8) | EXTRACT_BYTE(1);
 }
 #define cpu_to_fdt16(x) fdt16_to_cpu(x)
 
 static inline uint32_t fdt32_to_cpu(uint32_t x)
 {
-	return (_B(0) << 24) | (_B(1) << 16) | (_B(2) << 8) | _B(3);
+	return (EXTRACT_BYTE(0) << 24) | (EXTRACT_BYTE(1) << 16) | (EXTRACT_BYTE(2) << 8) | EXTRACT_BYTE(3);
 }
 #define cpu_to_fdt32(x) fdt32_to_cpu(x)
 
 static inline uint64_t fdt64_to_cpu(uint64_t x)
 {
-	return (_B(0) << 56) | (_B(1) << 48) | (_B(2) << 40) | (_B(3) << 32)
-		| (_B(4) << 24) | (_B(5) << 16) | (_B(6) << 8) | _B(7);
+	return (EXTRACT_BYTE(0) << 56) | (EXTRACT_BYTE(1) << 48) | (EXTRACT_BYTE(2) << 40) | (EXTRACT_BYTE(3) << 32)
+		| (EXTRACT_BYTE(4) << 24) | (EXTRACT_BYTE(5) << 16) | (EXTRACT_BYTE(6) << 8) | EXTRACT_BYTE(7);
 }
 #define cpu_to_fdt64(x) fdt64_to_cpu(x)
-#undef _B
+#undef EXTRACT_BYTE
 
 #endif /* _LIBFDT_ENV_H */
-- 
1.7.9
