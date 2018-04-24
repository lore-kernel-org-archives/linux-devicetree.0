Return-Path: <SRS0=akpW=HN=verge.net.au=horms@kernel.org>
Date: Tue, 24 Apr 2018 08:07:42 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] DT: mmc: tmio_mmc: document R8A77980 bindings
Message-ID: <20180424060742.owcstzu64xpcadh2@verge.net.au>
References: <cee91fe1-7bf0-e4c8-d6a9-5653be3358b0@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cee91fe1-7bf0-e4c8-d6a9-5653be3358b0@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Apr 16, 2018 at 09:30:02PM +0300, Sergei Shtylyov wrote:
> Document the R-Car V3H (R8A77980) SoC in the Renesas SDHI bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> ---
> This patch is against the 'next' branch of Ulf Hansson's 'mmc.git' repo.
> 
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: mmc/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> ===================================================================
> --- mmc.orig/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ mmc/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -26,6 +26,7 @@ Required properties:
>  		"renesas,sdhi-r8a7794" - SDHI IP on R8A7794 SoC
>  		"renesas,sdhi-r8a7795" - SDHI IP on R8A7795 SoC
>  		"renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
> +		"renesas,sdhi-r8a77980" - SDHI IP on R8A77980 SoC
>  		"renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
>  		"renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
>  		"renesas,rcar-gen1-sdhi" - a generic R-Car Gen1 SDHI controller
> 
