From: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [RESEND PATCH 07/10] crypto: sa2ul: Add hmac(sha1) HMAC
 algorithm support
Date: Thu, 27 Jun 2019 22:14:12 -0700
Message-ID: <20190628051412.GG673@sol.localdomain>
References: <20190628042745.28455-1-j-keerthy@ti.com>
 <20190628042745.28455-8-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190628042745.28455-8-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t-kristo@ti.com, linux-crypto@vger.kernel.org, nm@ti.com
List-Id: devicetree@vger.kernel.org

On Fri, Jun 28, 2019 at 09:57:42AM +0530, Keerthy wrote:
> +static int sa_sham_update(struct ahash_request *req)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +static int sa_sham_final(struct ahash_request *req)
> +{
> +	return sa_sham_digest(req);
> +}
> +
> +static int sa_sham_finup(struct ahash_request *req)
> +{
> +	return sa_sham_digest(req);
> +}

You can't just not support update().  You need to support update().

- Eric
