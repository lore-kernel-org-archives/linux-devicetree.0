From: Keerthy <j-keerthy@ti.com>
Subject: [RESEND PATCH 08/10] crypto: sa2ul: Add hmac(sha256) HMAC algorithm support
Date: Fri, 28 Jun 2019 09:57:43 +0530
Message-ID: <20190628042745.28455-9-j-keerthy@ti.com>
References: <20190628042745.28455-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628042745.28455-1-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com, linux-crypto@vger.kernel.org, nm@ti.com
List-Id: devicetree@vger.kernel.org

HMAC hash-based message authentication code) is a specific type of
message authentication code (MAC) involving a cryptographic hash
function and a secret cryptographic key. It may be used to
simultaneously verify both the data integrity and the authentication
of a message, as with any MAC. Add hmac(sha256) HMAC algorithm support
and the message digest size is 32 bytes.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/crypto/sa2ul.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/crypto/sa2ul.c b/drivers/crypto/sa2ul.c
index e3a1321f0666..74211cd21c62 100644
--- a/drivers/crypto/sa2ul.c
+++ b/drivers/crypto/sa2ul.c
@@ -1673,11 +1673,38 @@ static int sa_sham_sha1_setkey(struct crypto_ahash *tfm, const u8 *key,
 	return sa_sham_setkey(tfm, key, keylen, ad);
 }
 
+static int sa_sham_sha256_setkey(struct crypto_ahash *tfm, const u8 *key,
+				 unsigned int keylen)
+{
+	struct algo_data *ad = kzalloc(sizeof(*ad), GFP_KERNEL);
+
+	ad->enc_eng.eng_id = SA_ENG_ID_NONE;
+	ad->enc_eng.sc_size = SA_CTX_ENC_TYPE1_SZ;
+	ad->auth_eng.eng_id = SA_ENG_ID_AM1;
+	ad->auth_eng.sc_size = SA_CTX_AUTH_TYPE2_SZ;
+	ad->mci_enc = NULL;
+	ad->mci_dec = NULL;
+	ad->inv_key = false;
+	ad->keyed_mac = true;
+	ad->ealg_id = SA_EALG_ID_NONE;
+	ad->aalg_id = SA_AALG_ID_HMAC_SHA2_256;
+	ad->hash_size = SHA256_DIGEST_SIZE;
+	ad->auth_ctrl = 0x4;
+	ad->prep_iopad = sa_hmac_sha256_get_pad;
+
+	return sa_sham_setkey(tfm, key, keylen, ad);
+}
+
 static int sa_sham_cra_sha1_init(struct crypto_tfm *tfm)
 {
 	return sa_sham_cra_init_alg(tfm, "sha1");
 }
 
+static int sa_sham_cra_sha256_init(struct crypto_tfm *tfm)
+{
+	return sa_sham_cra_init_alg(tfm, "sha256");
+}
+
 static void sa_sham_cra_exit(struct crypto_tfm *tfm)
 {
 	struct crypto_alg *alg = tfm->__crt_alg;
@@ -1839,6 +1866,31 @@ static struct ahash_alg algs_sha[] = {
 		.cra_exit		= sa_sham_cra_exit,
 	}
 },
+{
+	.init		= sa_sham_init,
+	.update		= sa_sham_update,
+	.final		= sa_sham_final,
+	.finup		= sa_sham_finup,
+	.digest		= sa_sham_digest,
+	.setkey		= sa_sham_sha256_setkey,
+	.halg.digestsize	= SHA256_DIGEST_SIZE,
+	.halg.statesize		= 128,
+	.halg.base	= {
+		.cra_name		= "hmac(sha256)",
+		.cra_driver_name	= "sa-hmac-sha256",
+		.cra_priority		= 400,
+		.cra_flags		= CRYPTO_ALG_TYPE_AHASH |
+						CRYPTO_ALG_ASYNC |
+						CRYPTO_ALG_KERN_DRIVER_ONLY |
+						CRYPTO_ALG_NEED_FALLBACK,
+		.cra_blocksize		= SHA256_BLOCK_SIZE,
+		.cra_ctxsize		= sizeof(struct sa_tfm_ctx),
+		.cra_alignmask		= SA_ALIGN_MASK,
+		.cra_module		= THIS_MODULE,
+		.cra_init		= sa_sham_cra_sha256_init,
+		.cra_exit		= sa_sham_cra_exit,
+	}
+},
 };
 
 /* Register the algorithms in crypto framework */
-- 
2.17.1
