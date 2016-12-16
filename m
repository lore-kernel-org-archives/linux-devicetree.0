From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 1/5] lib: add bitrev8x4()
Date: Fri, 16 Dec 2016 15:17:50 -0800
Message-ID: <3d70fb271f0d2ab2bfbbc60281913bdb3c5f0fb7.1481918884.git.stillcompiling@gmail.com>
References: <cover.1481918884.git.stillcompiling@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1481918884.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1481918884.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1481918884.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a function to reverse bytes within a 32 bit word.
Operate on a u32 rather than individual bytes.
ARCH specific versions require substantially fewer instructions than
working a byte at a time.

Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 include/linux/bitrev.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/bitrev.h b/include/linux/bitrev.h
index fb790b8..868dcb6 100644
--- a/include/linux/bitrev.h
+++ b/include/linux/bitrev.h
@@ -27,6 +27,14 @@ static inline u32 __bitrev32(u32 x)
 	return (__bitrev16(x & 0xffff) << 16) | __bitrev16(x >> 16);
 }
 
+static inline u32 __bitrev8x4(u32 x)
+{
+	return(__bitrev8(x & 0xff) |
+	       (__bitrev8((x >> 8)  & 0xff) << 8) |
+	       (__bitrev8((x >> 16)  & 0xff) << 16) |
+	       (__bitrev8((x >> 24)  & 0xff) << 24));
+}
+
 #endif /* CONFIG_HAVE_ARCH_BITREVERSE */
 
 #define __constant_bitrev32(x)	\
@@ -50,6 +58,15 @@ static inline u32 __bitrev32(u32 x)
 	__x;								\
 })
 
+#define __constant_bitrev8x4(x) \
+({			\
+	u32 __x = x;	\
+	__x = ((__x & (u32)0xF0F0F0F0UL) >> 4) | ((__x & (u32)0x0F0F0F0FUL) << 4);	\
+	__x = ((__x & (u32)0xCCCCCCCCUL) >> 2) | ((__x & (u32)0x33333333UL) << 2);	\
+	__x = ((__x & (u32)0xAAAAAAAAUL) >> 1) | ((__x & (u32)0x55555555UL) << 1);	\
+	__x;								\
+})
+
 #define __constant_bitrev8(x)	\
 ({					\
 	u8 __x = x;			\
@@ -75,6 +92,14 @@ static inline u32 __bitrev32(u32 x)
 	__bitrev16(__x);				\
  })
 
+#define bitrev8x4(x) \
+({			\
+	u32 __x = x;	\
+	__builtin_constant_p(__x) ?	\
+	__constant_bitrev8x4(__x) :			\
+	__bitrev8x4(__x);				\
+})
+
 #define bitrev8(x) \
 ({			\
 	u8 __x = x;	\
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
