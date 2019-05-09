From: Neal Liu <neal.liu@mediatek.com>
Subject: Re: [PATCH 3/3] hwrng: add mt67xx-rng driver
Date: Thu, 9 May 2019 22:54:46 +0800
Message-ID: <1557413686.23445.6.camel@mtkswgap22>
References: <1557287937-2410-1-git-send-email-neal.liu@mediatek.com>
         <1557287937-2410-4-git-send-email-neal.liu@mediatek.com>
         <12193108.aNnqf5ydOJ@tauon.chronox.de>
         <1557311737.11818.11.camel@mtkswgap22>
         <20190509052649.xfkgb3qd7rhcgktj@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509052649.xfkgb3qd7rhcgktj@gondor.apana.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Stephan Mueller <smueller@chronox.de>, mpm@selenic.com, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, wsd_upstream@mediatek.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Crystal.Guo@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, 2019-05-09 at 13:26 +0800, Herbert Xu wrote:
> On Wed, May 08, 2019 at 06:35:37PM +0800, Neal Liu wrote:
> > Hi Stephan,
> > 	We think the cast is fine, and it cannot guarantee the buf is
> > word-align.
> > 	I reference multiple rng driver's implementation and found it's common
> > usage for this. So it might be general usage for community. Is there any
> > suggestion that is more appropriate?
> 
> If you don't know whether it's unaligned or not then you should
> do an unaligned operation.

Hi Stephan/Herbert,
	My mistake. This buffer is allocated by kmalloc with larger than 32
bytes. So yes, it's word-align for sure.
	reference:
https://elixir.bootlin.com/linux/latest/source/drivers/char/hw_random/core.c#L590

	Thanks
Best Regards,
-Neal Liu
