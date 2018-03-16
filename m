Return-Path: <SRS0=k2mn=GG=gondor.apana.org.au=herbert@kernel.org>
Date: Fri, 16 Mar 2018 23:54:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v2 0/2] hwrng: mxc-rnga - add driver support on boards
 with device tree
Message-ID: <20180316155408.GD7095@gondor.apana.org.au>
References: <20180305222100.29351-1-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180305222100.29351-1-vz@mleia.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Matt Mackall <mpm@selenic.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 06, 2018 at 12:20:58AM +0200, Vladimir Zapolskiy wrote:
> The series is a trivial change to extend Freescale i.MX31 RNGA
> driver to work on boards with device description taken from device
> tree blob. The change was tested on a legacy LogicPD MX31Lite board.
> 
> Vladimir Zapolskiy (2):
>   dt-bindings: rng: Document Freescale i.MX21 and i.MX31 RNGA compatibles
>   hwrng: mxc-rnga - add driver support on boards with device tree
> 
> Changes from v1 to v2:
> * a kernel for iMX boards is always built with multiplatform support,
>   thus CONFIG_OF guards were removed, thanks to Kim Phillips for review,
> * added i.MX21 RNGA compatible, i.MX31 RNGA is backward compatible to it,
> * though the list of documented compatibles is extended, I dare to add
>   Rob's Reviewed-by tag casted for v1.
> 
>  .../bindings/rng/{imx-rngc.txt => imx-rng.txt}     | 11 +++++------
>  drivers/char/hw_random/mxc-rnga.c                  | 23 +++++++++++++---------
>  2 files changed, 19 insertions(+), 15 deletions(-)
>  rename Documentation/devicetree/bindings/rng/{imx-rngc.txt => imx-rng.txt} (54%)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
