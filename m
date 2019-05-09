From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 3/3] hwrng: add mt67xx-rng driver
Date: Thu, 9 May 2019 13:26:49 +0800
Message-ID: <20190509052649.xfkgb3qd7rhcgktj@gondor.apana.org.au>
References: <1557287937-2410-1-git-send-email-neal.liu@mediatek.com>
 <1557287937-2410-4-git-send-email-neal.liu@mediatek.com>
 <12193108.aNnqf5ydOJ@tauon.chronox.de>
 <1557311737.11818.11.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557311737.11818.11.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Neal Liu <neal.liu@mediatek.com>
Cc: Stephan Mueller <smueller@chronox.de>, mpm@selenic.com, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, wsd_upstream@mediatek.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Crystal.Guo@mediatek.com
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2019 at 06:35:37PM +0800, Neal Liu wrote:
> Hi Stephan,
> 	We think the cast is fine, and it cannot guarantee the buf is
> word-align.
> 	I reference multiple rng driver's implementation and found it's common
> usage for this. So it might be general usage for community. Is there any
> suggestion that is more appropriate?

If you don't know whether it's unaligned or not then you should
do an unaligned operation.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
