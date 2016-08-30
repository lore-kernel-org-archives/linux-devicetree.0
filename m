From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: arizona: Add DT options for max_channels_clocked
 and PDM speaker config
Date: Tue, 30 Aug 2016 14:54:38 -0500
Message-ID: <20160830195438.GA13255@rob-hp-laptop>
References: <1472118248-27924-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472118248-27924-1-git-send-email-rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 25, 2016 at 10:44:08AM +0100, Richard Fitzgerald wrote:
> This patch adds DT settings for the max_channels_clocked, spk_fmt and
> spk_mute pdata.
> 
> Signed-off-by: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt | 11 ++++++++
>  drivers/mfd/arizona-core.c                        | 31 +++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> index a6e2ea41..6eaf006 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -85,6 +85,17 @@ Optional properties:
>      present, the number of values should be less than or equal to the
>      number of inputs, unspecified inputs will use the chip default.
>  
> +  - wlf,max-channels-clocked : The maximum number of channels to be clocked on
> +    each AIF, useful for I2S systems with multiple data lines being mastered.
> +    Specify one cell for each AIF, specify zero for AIFs that should be handled
> +    normally.
> +
> +  - wlf,spk_fmt : PDM speaker data format, must contain 2 cells (OUT5 and OUT6).

Use '-' rather than '_' in property names.

> +    See the datasheet for values.
> +
> +  - wlf,spk_mute : PDM speaker mute setting, must contain 2 cells (OUT5 and OUT6).
> +    See the datasheet for values.

ditto

With that,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
