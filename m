Return-Path: <robherring2@gmail.com>
Date: Fri, 14 Jun 2019 13:55:07 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 03/10] dt-bindings: input: touchscreen: stmpe: add
 resolution support
Message-ID: <20190614195507.GA27083@bogus>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527160736.30569-4-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527160736.30569-4-leif.middelschulte@klsmartin.com>
To: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Cc: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org, linux-input@vger.kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 27, 2019 at 06:07:29PM +0200, Leif Middelschulte wrote:
> This documents the support for specifying the screen size in milimeter
> and its impact on resolution calculation.
> 
> Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> index 04962e2e1ad0..d20dc5a7d8ad 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> @@ -39,6 +39,10 @@ Optional properties:
>  				The given window also affects the value range (limits) set
>  				within the input subsystem which, in turn, affects
>  				the input resolution calculation on both axes.
> +- touchscreen-x-mm	: horizontal length in mm of the touchscreen. It affects
> +				the input resolution calculation on the horizontal axis.
> +- touchscreen-y-mm	: vertical length in mm of the touchscreen. It affects
> +				the input resolution calculation on the vertical axis.

No need to define this again. Just reference the common definition. If 
you have any additional constraints, then add them.

Rob
