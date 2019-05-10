From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 3/3] hwrng: add mt67xx-rng driver
Date: Fri, 10 May 2019 14:39:15 +0800
Message-ID: <20190510063915.kwqy3e5urs6j7ity@gondor.apana.org.au>
References: <1557287937-2410-1-git-send-email-neal.liu@mediatek.com>
 <1557287937-2410-4-git-send-email-neal.liu@mediatek.com>
 <12193108.aNnqf5ydOJ@tauon.chronox.de>
 <1557311737.11818.11.camel@mtkswgap22>
 <20190509052649.xfkgb3qd7rhcgktj@gondor.apana.org.au>
 <1557413686.23445.6.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557413686.23445.6.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Neal Liu <neal.liu@mediatek.com>
Cc: Stephan Mueller <smueller@chronox.de>, mpm@selenic.com, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, wsd_upstream@mediatek.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Crystal.Guo@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, May 09, 2019 at 10:54:46PM +0800, Neal Liu wrote:
>
> Hi Stephan/Herbert,
> 	My mistake. This buffer is allocated by kmalloc with larger than 32
> bytes. So yes, it's word-align for sure.
> 	reference:
> https://elixir.bootlin.com/linux/latest/source/drivers/char/hw_random/core.c#L590

Yes you're right.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
