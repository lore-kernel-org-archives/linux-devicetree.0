From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] extcon: arizona: Update device tree binding for mic
 detect configurations
Date: Thu, 10 Dec 2015 21:44:32 -0600
Message-ID: <20151211034432.GA3159@rob-hp-laptop>
References: <1449767299-29691-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1449767299-29691-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449767299-29691-2-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 05:08:19PM +0000, Charles Keepax wrote:
> Update the device tree binding documentation to include documentation for
> the wlf,micd-configs property that is used to specify the configurations
> for headset polarity detection (CTIA / OTMP).
> 
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/extcon/extcon-arizona.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> index 238e10e..fd9b898 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> @@ -37,5 +37,13 @@ Optional properties:
>      milliseconds.
>    - wlf,micd-force-micbias : Force MICBIAS continuously on during microphone
>      detection.
> +  - wlf,micd-configs : Headset polarity configurations (generally used for
> +    detection of CTIA / OMTP headsets), the field can be of variable length
> +    but should always be a multiple of 3 cells long, each three cell group
> +    represents one polarity configuration.
> +    The first cell defines the accessory detection pin, zero will use MICDET1
> +    and all other values will use MICDET2.
> +    The second cell represents the MICBIAS to be used.
> +    The third cell represents the value of the micd-pol-gpio pin.
>  
>    - wlf,gpsw : Settings for the general purpose switch
> -- 
> 2.1.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
