From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/9] crypto: Add allwinner subdirectory
Date: Sat, 7 Sep 2019 06:54:53 +0300
Message-ID: <20190907035453.urfqmdg3kg4kbtgc@flea>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-2-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906184551.17858-2-clabbe.montjoie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 06, 2019 at 08:45:43PM +0200, Corentin Labbe wrote:
> Since a second Allwinner crypto driver will be added, it is better to
> create a dedicated subdirectory.
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>  MAINTAINERS                      | 6 ++++++
>  drivers/crypto/Kconfig           | 2 ++
>  drivers/crypto/Makefile          | 1 +
>  drivers/crypto/allwinner/Kconfig | 6 ++++++

I guess it would make sense to move the sun4i driver there too?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
