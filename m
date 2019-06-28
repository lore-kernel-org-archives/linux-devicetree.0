From: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [RESEND PATCH 06/10] crypto: sa2ul: Add hmac(sha256)cbc(aes)
 AEAD Algo support
Date: Thu, 27 Jun 2019 22:12:11 -0700
Message-ID: <20190628051211.GF673@sol.localdomain>
References: <20190628042745.28455-1-j-keerthy@ti.com>
 <20190628042745.28455-7-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190628042745.28455-7-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t-kristo@ti.com, linux-crypto@vger.kernel.org, nm@ti.com
List-Id: devicetree@vger.kernel.org

On Fri, Jun 28, 2019 at 09:57:41AM +0530, Keerthy wrote:
> Add aead support for hmac(sha256)cbc(aes) algorithm. Authenticated
> encryption (AE) and authenticated encryption with associated data
> (AEAD) is a form of encryption which simultaneously provides
> confidentiality, integrity, and authenticity assurances on the data.
> 
> hmac(sha256) has a digest size of 32 bytes is used for authetication
> and AES in CBC mode is used in conjunction for encryption/decryption.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>  drivers/crypto/sa2ul.c | 92 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/crypto/sa2ul.c b/drivers/crypto/sa2ul.c
> index 1a1bd882e0d2..9c9008e21867 100644
> --- a/drivers/crypto/sa2ul.c
> +++ b/drivers/crypto/sa2ul.c
> @@ -271,6 +271,42 @@ void sa_hmac_sha1_get_pad(const u8 *key, u16 key_sz, u32 *ipad, u32 *opad)
>  		opad[i] = cpu_to_be32(opad[i]);
>  }
>  
> +void sha256_init(u32 *buf)

This needs to be static.

> +static int sa_aead_cbc_sha256_setkey(struct crypto_aead *authenc,
> +				     const u8 *key, unsigned int keylen)
> +{
> +	struct algo_data *ad = kzalloc(sizeof(*ad), GFP_KERNEL);
> +	struct crypto_authenc_keys keys;
> +	int ret = 0, key_idx;
> +
> +	ret = crypto_authenc_extractkeys(&keys, key, keylen);
> +	if (ret)
> +		return ret;
> +
> +	/* Convert the key size (16/24/32) to the key size index (0/1/2) */
> +	key_idx = (keys.enckeylen >> 3) - 2;

Where do you validate the key length?

- Eric
