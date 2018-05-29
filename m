Return-Path: <SRS0=Kw0T=IQ=verge.net.au=horms@kernel.org>
Date: Tue, 29 May 2018 10:48:29 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] i2c: rcar: document R8A77980 bindings
Message-ID: <20180529084828.dgs5spjr45jbzygg@verge.net.au>
References: <95b945f7-1e6c-39f1-e101-06ed748ccec2@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95b945f7-1e6c-39f1-e101-06ed748ccec2@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, May 28, 2018 at 10:39:05PM +0300, Sergei Shtylyov wrote:
> R-Car V3H (R8A77980) SoC also has the R-Car gen3 compatible I2C controller,
> so document the SoC  specific bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> ---
> The patch is against Wolfram Sang's 'linux.git' repo's 'i2c/for-next' branch
> but I wouldn't mind if it was applied to the 'i2c/for-current' branch. :-)
> 
>  Documentation/devicetree/bindings/i2c/i2c-rcar.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> Index: linux/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> ===================================================================
> --- linux.orig/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> +++ linux/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> @@ -15,6 +15,7 @@ Required properties:
>  	"renesas,i2c-r8a7796" if the device is a part of a R8A7796 SoC.
>  	"renesas,i2c-r8a77965" if the device is a part of a R8A77965 SoC.
>  	"renesas,i2c-r8a77970" if the device is a part of a R8A77970 SoC.
> +	"renesas,i2c-r8a77980" if the device is a part of a R8A77980 SoC.
>  	"renesas,i2c-r8a77995" if the device is a part of a R8A77995 SoC.
>  	"renesas,rcar-gen1-i2c" for a generic R-Car Gen1 compatible device.
>  	"renesas,rcar-gen2-i2c" for a generic R-Car Gen2 or RZ/G1 compatible
> 
