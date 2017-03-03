From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: Use generic property for
 hardware enable pins
Date: Fri, 3 Mar 2017 00:21:19 -0600
Message-ID: <20170303062119.kdogozkkhsvwewwa@rob-hp-laptop>
References: <20170228075041.7568-1-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170228075041.7568-1-milo.kim-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 04:50:40PM +0900, Milo Kim wrote:
> With index usages, device specific properties can be replaced with generic
> one. Vpos is index 0 and Vneg is index 1.
> DT examples are added as well.
> 
> Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
> ---
>  .../bindings/regulator/lm363x-regulator.txt        | 78 +++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt b/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
> index 8f14df9d1205..cc5a6151d85f 100644
> --- a/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
> @@ -8,8 +8,8 @@ Required property:
>  
>  Optional properties:
>    LM3632 has external enable pins for two LDOs.
> -  - ti,lcm-en1-gpio: A GPIO specifier for Vpos control pin.
> -  - ti,lcm-en2-gpio: A GPIO specifier for Vneg control pin.
> +  - enable-gpios: Two GPIO specifiers for Vpos and Vneg control pins.
> +                  The first entry is Vpos, the second is Vneg enable pin.

You're breaking compatibility with existing DTBs. You need to explain 
that and why it is okay in the commit message. In this case, I don't 
think it is okay as this chip could be used across vendors' platforms.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
