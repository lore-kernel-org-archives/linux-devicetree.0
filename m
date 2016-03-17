From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 02/18] dt-bindings: timer: sp804: add timer-width
 property
Date: Thu, 17 Mar 2016 12:09:26 -0500
Message-ID: <20160317170926.GA28934@rob-hp-laptop>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
 <1457519060-6038-1-git-send-email-narmstrong@baylibre.com>
 <1457519060-6038-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457519060-6038-3-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 09, 2016 at 11:24:04AM +0100, Neil Armstrong wrote:
> Add timer-width optional property to specify a different vendor
> specific timer counter bit-width.
> 
> Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/timer/arm,sp804.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/arm,sp804.txt b/Documentation/devicetree/bindings/timer/arm,sp804.txt
> index 5cd8eee7..141e143 100644
> --- a/Documentation/devicetree/bindings/timer/arm,sp804.txt
> +++ b/Documentation/devicetree/bindings/timer/arm,sp804.txt
> @@ -17,6 +17,8 @@ Optional properties:
>  - arm,sp804-has-irq = <#>: In the case of only 1 timer irq line connected, this
>  	specifies if the irq connection is for timer 1 or timer 2. A value of 1
>  	or 2 should be used.
> +- arm,timer-width: Should contain the width in number of bits of the counter,
> +	is considered by default 32 but can be changed for vendor variants.

That would not be an SP804 nor would the vendor be ARM in that case. So 
add a new compatible string for the vendor that decided to hack up ARM's 
IP block.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
