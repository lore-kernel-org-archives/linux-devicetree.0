Return-Path: <robherring2@gmail.com>
Date: Fri, 14 Jun 2019 13:56:23 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 07/10] dt-bindings: input: touchscreen: stmpe: add axes
 inversion and swap
Message-ID: <20190614195623.GA5499@bogus>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-3-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527161938.31871-3-leif.middelschulte@klsmartin.com>
To: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Cc: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org, linux-input@vger.kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 27, 2019 at 06:19:35PM +0200, Leif Middelschulte wrote:
> This driver too supports coordinate inversion on X,Y axes and
> axes swapping via the common properties defined in touchscreen.txt
> 
> Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> index aee1abf06ddb..09d2d4f288cc 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> @@ -42,6 +42,10 @@ Optional properties:
>  				The given window also affects the value range (limits) set
>  				within the input subsystem which, in turn, affects
>  				the input resolution calculation on both axes.
> +- touchscreen-inverted-x: X axis is inverted (boolean)
> +- touchscreen-inverted-y: Y axis is inverted (boolean)
> +- touchscreen-swapped-x-y: X and Y axis are swapped (boolean)
> +				Swapping is done after inverting the axis

Just reference common definition.

>  - touchscreen-x-mm	: horizontal length in mm of the touchscreen. It affects
>  				the input resolution calculation on the horizontal axis.
>  - touchscreen-y-mm	: vertical length in mm of the touchscreen. It affects
> -- 
> 2.21.0
> 
