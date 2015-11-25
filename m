From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: misc: usb3503: Describe better how to bind clock to
 the hub
Date: Wed, 25 Nov 2015 17:50:45 -0600
Message-ID: <20151125235045.GA19832@rob-hp-laptop>
References: <1447584528-12411-1-git-send-email-michael@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447584528-12411-1-git-send-email-michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 15, 2015 at 11:48:48AM +0100, Michael Trimarchi wrote:
> Signed-off-by: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/usb/usb3503.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb3503.txt b/Documentation/devicetree/bindings/usb/usb3503.txt
> index 52493b1..c1a0a91 100644
> --- a/Documentation/devicetree/bindings/usb/usb3503.txt
> +++ b/Documentation/devicetree/bindings/usb/usb3503.txt
> @@ -18,7 +18,8 @@ Optional properties:
>  - refclk: Clock used for driving REFCLK signal (optional, if not provided
>  	the driver assumes that clock signal is always available, its
>  	rate is specified by REF_SEL pins and a value from the primary
> -	reference clock frequencies table is used)
> +	reference clock frequencies table is used). Use clocks and
> +	clock-names in order to assign it
>  - refclk-frequency: Frequency of the REFCLK signal as defined by REF_SEL
>  	pins (optional, if not provided, driver will not set rate of the
>  	REFCLK signal and assume that a value from the primary reference
> @@ -33,4 +34,6 @@ Examples:
>  		intn-gpios = <&gpx3 4 1>;
>  		reset-gpios = <&gpx3 5 1>;
>  		initial-mode = <1>;
> +		clocks = <&clks 80>;
> +		clock-names = "refclk";
>  	};
> -- 
> 2.6.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
