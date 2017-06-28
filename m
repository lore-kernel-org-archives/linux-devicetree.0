From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: amlogic: add unstable statement
Date: Wed, 28 Jun 2017 17:39:34 +0200
Message-ID: <1498664374.2337.7.camel@baylibre.com>
References: <20170628145343.25443-1-khilman@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170628145343.25443-1-khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-06-28 at 07:53 -0700, Kevin Hilman wrote:
> Due to the lack of documentation on this SoC family, discovery of new
> features, and correcting of previous misunderstandings is expected, so
> it's unrealistic to expect any form of stable bindings for this SoC
> family.  Make that clear inthe binding documentation.
> 

Acked-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

> Signed-off-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt
> b/Documentation/devicetree/bindings/arm/amlogic.txt
> index bfd5b558477d..9be902b4656d 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.txt
> +++ b/Documentation/devicetree/bindings/arm/amlogic.txt
> @@ -1,6 +1,18 @@
>  Amlogic MesonX device tree bindings
>  -------------------------------------------
>  
> +Work in progress statement:
> +
> +Device tree files and bindings applying to Amlogic SoCs and boards are
> +considered "unstable". Any Amlogic device tree binding may change at
> +any time. Be sure to use a device tree binary and a kernel image
> +generated from the same source tree.
> +
> +Please refer to Documentation/devicetree/bindings/ABI.txt for a definition of
> a
> +stable binding/ABI.
> +
> +---------------------------------------------------------------
> +
>  Boards with the Amlogic Meson6 SoC shall have the following properties:
>    Required root node property:
>      compatible: "amlogic,meson6"

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
