Return-Path: <robherring2@gmail.com>
Date: Fri, 14 Jun 2019 13:58:59 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 09/10] dt-bindings: input: touchscreen: stmpe: add
 tracking index
Message-ID: <20190614195859.GA6351@bogus>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-5-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527161938.31871-5-leif.middelschulte@klsmartin.com>
To: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Cc: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org, linux-input@vger.kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 27, 2019 at 06:19:37PM +0200, Leif Middelschulte wrote:
> The tracking index is a "minimum" distance two touch
> points need to have in order for the second to be valid.
> This adds the corresponding binding property documentation.
> 
> Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> ---
>  .../bindings/input/touchscreen/stmpe.txt          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> index 09d2d4f288cc..8696af35a7b8 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> @@ -42,6 +42,21 @@ Optional properties:
>  				The given window also affects the value range (limits) set
>  				within the input subsystem which, in turn, affects
>  				the input resolution calculation on both axes.
> +- st,tracking-index	: Minimal distance between the current touch position and the previous
> +				touch position. If the distance is shorter than the tracking
> +				index, it is discarded. The tracking is calculated by summation
> +				of the horizontal and vertical movement.
> +				If pressure reporting is enabled (X/Y/Z), an increase in pressure
> +				override the movement tracking and report the new data set, even
> +				if X/Y is within the previous tracking index.
> +				0 -> disabled
> +				1 -> 4
> +				4 -> 8
> +				3 -> 16
> +				4 -> 32
> +				5 -> 64
> +				6 -> 92
> +				7 -> 127

This is what touchscreen-fuzz-x/y is for.

>  - touchscreen-inverted-x: X axis is inverted (boolean)
>  - touchscreen-inverted-y: Y axis is inverted (boolean)
>  - touchscreen-swapped-x-y: X and Y axis are swapped (boolean)
> -- 
> 2.21.0
> 
