Return-Path: <robherring2@gmail.com>
Date: Fri, 14 Jun 2019 13:48:18 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/10] dt-bindings: input: touchscreen: stmpe: add touch
 window configuration
Message-ID: <20190614194818.GA22146@bogus>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527160736.30569-2-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527160736.30569-2-leif.middelschulte@klsmartin.com>
To: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Cc: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org, linux-input@vger.kernel.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 27, 2019 at 06:07:27PM +0200, Leif Middelschulte wrote:
> The STMPE811 is able to only monitor a subwindow of the
> entire screen. Touches outside of this window are neglected.
> This change adds the corresponding documentation.

Unless you are trying to just filter out the edge values which I think 
we already have properties for, wouldn't this be something the user 
may want to adjust/move at runtime?

> 
> Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> ---
>  .../devicetree/bindings/input/touchscreen/stmpe.txt      | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> index c549924603d2..04962e2e1ad0 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> @@ -33,6 +33,13 @@ Optional properties:
>  - st,i-drive		: current limit value of the touchscreen drivers
>  				0 -> 20 mA (typical 35mA max)
>  				1 -> 50 mA (typical 80 mA max)
> +- st,window-tracking	: An u12 array that allows to pre-set a sub-window in the touchscreen.

u16?

> +				Any touch position that is outside the sub-window is discarded
> +				(top-right x, top-right y, bottom-left x, bottom-left y).
> +				The given window also affects the value range (limits) set
> +				within the input subsystem which, in turn, affects
> +				the input resolution calculation on both axes.
> +
>  
>  Optional properties common with MFD (deprecated):
>   - st,sample-time	: ADC conversion time in number of clock.
> @@ -101,6 +108,8 @@ stmpe811@41 {
>  		 * current limit value
>  		 */
>  		st,i-drive = <1>;
> +		/* enable entire window */
> +		st,window-tracking = /bits/ 16 <4095 4095 0 0>;
>  	};
>  	stmpe_adc {
>  		compatible = "st,stmpe-adc";
> -- 
> 2.21.0
> 
