From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 06/10] crypto: sa2ul: Add hmac(sha256)cbc(aes) AEAD Algo support
Date: Tue, 18 Jun 2019 17:38:39 +0530
Message-ID: <20190618120843.18777-7-j-keerthy@ti.com>
References: <20190618120843.18777-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618120843.18777-1-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com, nm@ti.com
List-Id: devicetree@vger.kernel.org

Add aead support for hmac(sha256)cbc(aes) algorithm. Authenticated
encryption (AE) and authenticated encryption with associated data
(AEAD) is a form of encryption which simultaneously provides
confidentiality, integrity, and authenticity assurances on the data.

hmac(sha256) has a digest size of 32 bytes is used for authetication
and AES in CBC mode is used in conjunction for encryption/decryption.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 drivers/crypto/sa2ul.c | 92 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/crypto/sa2ul.c b/drivers/crypto/sa2ul.c
index 1a1bd882e0d2..9c9008e21867 100644
--- a/drivers/crypto/sa2ul.c
+++ b/drivers/crypto/sa2ul.c
@@ -271,6 +271,42 @@ void sa_hmac_sha1_get_pad(const u8 *key, u16 key_sz, u32 *ipad, u32 *opad)
 		opad[i] = cpu_to_be32(opad[i]);
 }
 
+void sha256_init(u32 *buf)
+{
+	buf[0] = SHA256_H0;
+	buf[1] = SHA256_H1;
+	buf[2] = SHA256_H2;
+	buf[3] = SHA256_H3;
+	buf[4] = SHA256_H4;
+	buf[5] = SHA256_H5;
+	buf[6] = SHA256_H6;
+	buf[7] = SHA256_H7;
+}
+
+static void sa_hmac_sha256_get_pad(const u8 *key, u16 key_sz, u32 *ipad,
+				   u32 *opad)
+{
+	u8 k_ipad[SHA_MESSAGE_BYTES];
+	u8 k_opad[SHA_MESSAGE_BYTES];
+	int i;
+
+	prepare_kiopad(k_ipad, k_opad, key, key_sz);
+
+	/* SHA-256 on k_ipad */
+	sha256_init(ipad);
+	sha256_transform(ipad, k_ipad);
+
+	for (i = 0; i < SHA256_DIGEST_WORDS; i++)
+		ipad[i] = cpu_to_be32(ipad[i]);
+
+	/* SHA-256 on k_opad */
+	sha256_init(opad);
+	sha256_transform(opad, k_opad);
+
+	for (i = 0; i < SHA256_DIGEST_WORDS; i++)
+		opad[i] = cpu_to_be32(opad[i]);
+}
+
 /* Derive the inverse key used in AES-CBC decryption operation */
 static inline int sa_aes_inv_key(u8 *inv_key, const u8 *key, u16 key_sz)
 {
@@ -1198,6 +1234,37 @@ static int sa_aead_cbc_sha1_setkey(struct crypto_aead *authenc,
 	return sa_aead_setkey(authenc, key, keylen, ad);
 }
 
+static int sa_aead_cbc_sha256_setkey(struct crypto_aead *authenc,
+				     const u8 *key, unsigned int keylen)
+{
+	struct algo_data *ad = kzalloc(sizeof(*ad), GFP_KERNEL);
+	struct crypto_authenc_keys keys;
+	int ret = 0, key_idx;
+
+	ret = crypto_authenc_extractkeys(&keys, key, keylen);
+	if (ret)
+		return ret;
+
+	/* Convert the key size (16/24/32) to the key size index (0/1/2) */
+	key_idx = (keys.enckeylen >> 3) - 2;
+
+	ad->enc_eng.eng_id = SA_ENG_ID_EM1;
+	ad->enc_eng.sc_size = SA_CTX_ENC_TYPE1_SZ;
+	ad->auth_eng.eng_id = SA_ENG_ID_AM1;
+	ad->auth_eng.sc_size = SA_CTX_AUTH_TYPE2_SZ;
+	ad->mci_enc = mci_cbc_enc_array[key_idx];
+	ad->mci_dec = mci_cbc_dec_array[key_idx];
+	ad->inv_key = true;
+	ad->keyed_mac = true;
+	ad->ealg_id = SA_EALG_ID_AES_CBC;
+	ad->aalg_id = SA_AALG_ID_HMAC_SHA2_256;
+	ad->hash_size = SHA256_DIGEST_SIZE;
+	ad->auth_ctrl = 0x4;
+	ad->prep_iopad = sa_hmac_sha256_get_pad;
+
+	return sa_aead_setkey(authenc, key, keylen, ad);
+}
+
 static int sa_aead_run(struct aead_request *req, u8 *iv, int enc)
 {
 	struct crypto_aead *tfm = crypto_aead_reqtfm(req);
@@ -1418,6 +1485,31 @@ static struct sa_alg_tmpl sa_algs[] = {
 			.decrypt = sa_aead_decrypt,
 		}
 	},
+	{.type	= CRYPTO_ALG_TYPE_AEAD,
+		.alg.aead = {
+				.base = {
+				.cra_name = "authenc(hmac(sha256),cbc(aes))",
+				.cra_driver_name =
+					"authenc(hmac(sha256),cbc(aes))-keystone-sa",
+				.cra_blocksize = AES_BLOCK_SIZE,
+				.cra_flags = CRYPTO_ALG_TYPE_AEAD |
+					CRYPTO_ALG_KERN_DRIVER_ONLY |
+					CRYPTO_ALG_ASYNC,
+				.cra_ctxsize = sizeof(struct sa_tfm_ctx),
+				.cra_module = THIS_MODULE,
+				.cra_alignmask = 0,
+				.cra_priority = 3000,
+			},
+			.ivsize = AES_BLOCK_SIZE,
+			.maxauthsize = SHA256_DIGEST_SIZE,
+
+			.init = sa_cra_init_aead,
+			.exit = sa_exit_tfm_aead,
+			.setkey = sa_aead_cbc_sha256_setkey,
+			.encrypt = sa_aead_encrypt,
+			.decrypt = sa_aead_decrypt,
+		}
+	},
 };
 
 /* Register the algorithms in crypto framework */
-- 
2.17.1
