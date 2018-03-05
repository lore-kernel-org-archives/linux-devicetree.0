Return-Path: <robherring2@gmail.com>
Date: Mon, 5 Mar 2018 15:12:58 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: rng: Document Freescale i.MX31 RNGA
 compatible
Message-ID: <20180305211258.oridvcudydqice2c@rob-hp-laptop>
References: <20180226183849.11562-1-vz@mleia.com>
 <20180226183849.11562-2-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180226183849.11562-2-vz@mleia.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-crypto@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 26, 2018 at 08:38:48PM +0200, Vladimir Zapolskiy wrote:
> Freescale i.MX31 SoC contains a Security Random Number Generator
> Accelerator module (RNGA), which is replaced by RNGB and RNGC modules
> on later i.MX SoC series, the change adds a new compatible property
> to describe the controller.
> 
> Since all versions of Freescale RNG modules are legacy, apparently
> the documentation file has no more potential for further extensions,
> nevertheless generalize it by removing explicit RNGC specifics.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
>  .../devicetree/bindings/rng/{imx-rngc.txt => imx-rng.txt}      | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/rng/{imx-rngc.txt => imx-rng.txt} (59%)

Reviewed-by: Rob Herring <robh@kernel.org>
