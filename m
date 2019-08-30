From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH RESEND v2 4/6] dt-bindings: watchdog: sun4i: Add the
 watchdog clock
Date: Fri, 30 Aug 2019 09:48:40 -0700
Message-ID: <20190830164840.GD7911@roeck-us.net>
References: <20190821143835.7294-1-mripard@kernel.org>
 <20190821143835.7294-4-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190821143835.7294-4-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: wim@linux-watchdog.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 04:38:33PM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> The Allwinner watchdog has a clock that has been described in some DT, but
> not all of them.
> 
> The binding is also completely missing that description. Let's add that
> property to be consistent.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> 
Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes from v1:
>   - New patch
> ---
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 31c95c404619..3a54f58683a0 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -31,12 +31,16 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +
>    interrupts:
>      maxItems: 1
>  
>  required:
>    - compatible
>    - reg
> +  - clocks
>    - interrupts
>  
>  unevaluatedProperties: false
> @@ -47,6 +51,7 @@ examples:
>          compatible = "allwinner,sun4i-a10-wdt";
>          reg = <0x01c20c90 0x10>;
>          interrupts = <24>;
> +        clocks = <&osc24M>;
>          timeout-sec = <10>;
>      };
>  
> -- 
> 2.21.0
> 
