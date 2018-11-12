Return-Path: <robherring2@gmail.com>
Message-ID: <5bea0eb8.1c69fb81.6b921.80e6@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 04/24] dt-bindings: leds: Add function and color
 properties
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
Date: Mon, 12 Nov 2018 12:27:11 -0600
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Nov 06, 2018 at 11:07:12PM +0100, Jacek Anaszewski wrote:
> Introduce dedicated properties for conveying information about
> LED function and color. Mark old "label" property as deprecated.
> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Simon Shields <simon@lineageos.org>
> Cc: Xiaotong Lu <xiaotong.lu@spreadtrum.com>
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 52 +++++++++++++++++++----
>  1 file changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index aa13998..3efc826 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -10,14 +10,20 @@ can influence the way of the LED device initialization, the LED components
>  have to be tightly coupled with the LED device binding. They are represented
>  by child nodes of the parent LED device binding.
>  
> +
>  Optional properties for child nodes:
>  - led-sources : List of device current outputs the LED is connected to. The
>  		outputs are identified by the numbers that must be defined
>  		in the LED device binding documentation.
> +- function: LED functon. Use one of the LED_FUNCTION_* prefixed definitions
> +	    from the header include/dt-bindings/leds/functions.h.
> +	    If there is no matching LED_FUNCTION available, add a new one.
> +- color : Color of the LED.
>  - label : The label for this LED. If omitted, the label is taken from the node
>  	  name (excluding the unit address). It has to uniquely identify
>  	  a device, i.e. no other LED class device can be assigned the same
> -	  label.
> +	  label. This property is deprecated - use 'function' and 'color'
> +	  properties instead.

I don't know if I'd go as far a deprecating.

One thing to consider is how we handle multiple of the same function? Do 
we allow an index on function names? What if an index isn't meaningful 
and we need "front" vs. "rear" for example? Maybe label is still needed 
there. 

Rob
