From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: n2_core: Convert to using %pOF instead of
 full_name
Date: Thu, 3 Aug 2017 14:10:12 +0800
Message-ID: <20170803061012.GB12039@gondor.apana.org.au>
References: <20170718214339.7774-16-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170718214339.7774-16-robh@kernel.org>
Sender: linux-crypto-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 04:42:56PM -0500, Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: linux-crypto@vger.kernel.org

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
