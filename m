From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 2/5] lib: implement __arch_bitrev8x4()
Date: Fri, 16 Dec 2016 15:17:51 -0800
Message-ID: <6c1c052d3c1d0c02a791aaaf8e114360ab1cb4e7.1481918884.git.stillcompiling@gmail.com>
References: <cover.1481918884.git.stillcompiling@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1481918884.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1481918884.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1481918884.git.stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Implement faster bitrev8x4() for arm, arm64 and mips, all the platforms
with CONFIG_HAVE_ARCH_BITREVERSE.
ARM platforms just need a byteswap added to the existing __arch_bitrev32()
Amusingly, the mips implementation is exactly the opposite, requiring
removal of the byteswap from its __arch_bitrev32()

Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/include/asm/bitrev.h   | 6 ++++++
 arch/arm64/include/asm/bitrev.h | 6 ++++++
 arch/mips/include/asm/bitrev.h  | 6 ++++++
 include/linux/bitrev.h          | 1 +
 4 files changed, 19 insertions(+)

diff --git a/arch/arm/include/asm/bitrev.h b/arch/arm/include/asm/bitrev.h
index ec291c3..9482f78 100644
--- a/arch/arm/include/asm/bitrev.h
+++ b/arch/arm/include/asm/bitrev.h
@@ -17,4 +17,10 @@ static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
 	return __arch_bitrev32((u32)x) >> 24;
 }
 
+static __always_inline __attribute_const__ u32 __arch_bitrev8x4(u32 x)
+{
+	__asm__ ("rbit %0, %1; rev %0, %0" : "=r" (x) : "r" (x));
+	return x;
+}
+
 #endif
diff --git a/arch/arm64/include/asm/bitrev.h b/arch/arm64/include/asm/bitrev.h
index a5a0c36..1801078 100644
--- a/arch/arm64/include/asm/bitrev.h
+++ b/arch/arm64/include/asm/bitrev.h
@@ -16,4 +16,10 @@ static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
 	return __arch_bitrev32((u32)x) >> 24;
 }
 
+static __always_inline __attribute_const__ u32 __arch_bitrev8x4(u32 x)
+{
+	__asm__ ("rbit %0, %1; rev %0, %0" : "=r" (x) : "r" (x));
+	return x;
+}
+
 #endif
diff --git a/arch/mips/include/asm/bitrev.h b/arch/mips/include/asm/bitrev.h
index bc739a4..9ac6439 100644
--- a/arch/mips/include/asm/bitrev.h
+++ b/arch/mips/include/asm/bitrev.h
@@ -27,4 +27,10 @@ static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
 	return ret;
 }
 
+static __always_inline __attribute_const__ u32 __arch_bitrev8x4(u32 x)
+{
+	u32 ret;
+	asm("bitswap    %0, %1" : "=r"(ret) : "r"(x));
+	return ret;
+}
 #endif /* __MIPS_ASM_BITREV_H__ */
diff --git a/include/linux/bitrev.h b/include/linux/bitrev.h
index 868dcb6..b1cfa1a 100644
--- a/include/linux/bitrev.h
+++ b/include/linux/bitrev.h
@@ -9,6 +9,7 @@
 #define __bitrev32 __arch_bitrev32
 #define __bitrev16 __arch_bitrev16
 #define __bitrev8 __arch_bitrev8
+#define __bitrev8x4 __arch_bitrev8x4
 
 #else
 extern u8 const byte_rev_table[256];
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
