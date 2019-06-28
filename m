From: Keerthy <j-keerthy@ti.com>
Subject: [RESEND PATCH 05/10] crypto: sha256_generic: Export the Transform function
Date: Fri, 28 Jun 2019 09:57:40 +0530
Message-ID: <20190628042745.28455-6-j-keerthy@ti.com>
References: <20190628042745.28455-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628042745.28455-1-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com, linux-crypto@vger.kernel.org, nm@ti.com
List-Id: devicetree@vger.kernel.org

The transform function can be used as is by other crypto
drivers that need to transform the 256 bit key using cpu.
Hence export it.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 crypto/sha256_generic.c | 3 ++-
 include/crypto/sha.h    | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/crypto/sha256_generic.c b/crypto/sha256_generic.c
index b7502a96a0d4..583a3c3b93e0 100644
--- a/crypto/sha256_generic.c
+++ b/crypto/sha256_generic.c
@@ -63,7 +63,7 @@ static inline void BLEND_OP(int I, u32 *W)
 	W[I] = s1(W[I-2]) + W[I-7] + s0(W[I-15]) + W[I-16];
 }
 
-static void sha256_transform(u32 *state, const u8 *input)
+void sha256_transform(u32 *state, const u8 *input)
 {
 	u32 a, b, c, d, e, f, g, h, t1, t2;
 	u32 W[64];
@@ -225,6 +225,7 @@ static void sha256_transform(u32 *state, const u8 *input)
 	a = b = c = d = e = f = g = h = t1 = t2 = 0;
 	memzero_explicit(W, 64 * sizeof(u32));
 }
+EXPORT_SYMBOL(sha256_transform);
 
 static void sha256_generic_block_fn(struct sha256_state *sst, u8 const *src,
 				    int blocks)
diff --git a/include/crypto/sha.h b/include/crypto/sha.h
index 8a46202b1857..6e04f412b0c2 100644
--- a/include/crypto/sha.h
+++ b/include/crypto/sha.h
@@ -95,6 +95,7 @@ struct sha512_state {
 
 struct shash_desc;
 
+extern void sha256_transform(u32 *state, const u8 *input);
 extern int crypto_sha1_update(struct shash_desc *desc, const u8 *data,
 			      unsigned int len);
 
-- 
2.17.1
