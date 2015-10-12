From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RFC 1/2] dt-bindings: simplefb: Support a list of
 regulator supply properties
Date: Mon, 12 Oct 2015 18:10:18 +0100
Message-ID: <20151012171018.GB3659@leverpostej>
References: <1444669458-5588-1-git-send-email-wens@csie.org>
 <1444669458-5588-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444669458-5588-2-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 13, 2015 at 01:04:17AM +0800, Chen-Yu Tsai wrote:
> The physical display tied to the framebuffer may have regulators
> providing power to it, such as power for LCDs or interface conversion
> chips.
> 
> The number of regulators in use may vary, but the regulator supply
> binding can not be a list. Work around this by adding a "num-supplies"
> property to communicate the number of supplies, and a list of 0 ~ N
> "vinN-supply" properties for the actual regulator supply.

This is getting more complicated by the minute...

> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  .../devicetree/bindings/video/simple-framebuffer.txt       | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer.txt b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
> index 4474ef6e0b95..0cc43e1be8b5 100644
> --- a/Documentation/devicetree/bindings/video/simple-framebuffer.txt
> +++ b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
> @@ -47,10 +47,14 @@ Required properties:
>    - a8b8g8r8 (32-bit pixels, d[31:24]=a, d[23:16]=b, d[15:8]=g, d[7:0]=r).
>  
>  Optional properties:
> -- clocks : List of clocks used by the framebuffer. Clocks listed here
> -           are expected to already be configured correctly. The OS must
> -           ensure these clocks are not modified or disabled while the
> -           simple framebuffer remains active.
> +- clocks : List of clocks used by the framebuffer.
> +- num-supplies : The number of regulators used by the framebuffer.
> +- vinN-supply : The N-th (from 0) regulator used by the framebuffer.

I don't see why you need num-supplies. Why not just try probing
vin${N}-supply until such a property isn't present in the DT?

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
