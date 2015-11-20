From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 5/6] extcon: arizona: Update DT binding documentation
 for mic detection
Date: Fri, 20 Nov 2015 09:58:33 -0600
Message-ID: <20151120155833.GA18510@rob-hp-laptop>
References: <1447947940-3054-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1447947940-3054-6-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447947940-3054-6-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 19, 2015 at 03:45:39PM +0000, Charles Keepax wrote:
> Add additional bindings to allow configuration of the system specific
> microphone detection settings.
> 
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  .../devicetree/bindings/extcon/extcon-arizona.txt  |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> index e1705fa..d661811 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> @@ -13,3 +13,23 @@ Optional properties:
>      ARIZONA_ACCDET_MODE_HPR or 2 - Headphone detect mode is set to HPDETR
>      If this node is not mentioned or if the value is unknown, then
>      headphone detection mode is set to HPDETL.
> +
> +  - wlf,micd-software-compare : Use a software comparison to determine mic
> +    presence
> +  - wlf,micd-detect-debounce : Additional software microphone detection
> +    debounce specified in milliseconds.
> +  - wlf,micd-pol-gpio : GPIO specifier for the GPIO controlling the headset
> +    polarity if one exists.
> +  - wlf,micd-bias-start-time : Time allowed for MICBIAS to startup prior to
> +    performing microphone detection, specified as per the ARIZONA_MICD_TIME_XXX
> +    defines.
> +  - wlf,micd-rate : Delay between successive microphone detection measurements,
> +    specified as per the ARIZONA_MICD_TIME_XXX defines.
> +  - wlf,micd-dbtime : Microphone detection hardware debounces specified as the
> +    number of measurements to take, valid values being 2 and 4.
> +  - wlf,micd-timeout : Timeout for microphone detection, specified in
> +    milliseconds.

Please add unit suffix (-ms).

> +  - wlf,micd-force-micbias : Force MICBIAS continuously on during microphone
> +    detection.
> +
> +  - wlf,gpsw : Settings for the general purpose switch
> -- 
> 1.7.2.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
