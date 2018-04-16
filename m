Return-Path: <robherring2@gmail.com>
Date: Mon, 16 Apr 2018 14:26:48 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] Documentation: mmc: add optional cd-delay-ms
 property
Message-ID: <20180416192648.frw3kvwa3lr7jvsq@rob-hp-laptop>
References: <1523585925-169568-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523585925-169568-1-git-send-email-shawn.lin@rock-chips.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 13, 2018 at 10:18:44AM +0800, Shawn Lin wrote:
> slot-gpio uses a fixed delay, 200ms, before detecting card after the card
> is inserted. 200ms doesn't work for some platforms, so some host drivers
> added their own properties for parsing that from DT, for instance,
> dw_mmc and pxamci. That being said, it should also be tunable when using
> slog-gpio.

slot-gpio?

Or is it cd-gpios?

> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/mmc/mmc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
> index 467cd7b..215b9a2 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/mmc.txt
> @@ -19,6 +19,8 @@ Optional properties:
>  - wp-gpios: Specify GPIOs for write protection, see gpio binding
>  - cd-inverted: when present, polarity on the CD line is inverted. See the note
>    below for the case, when a GPIO is used for the CD line
> +- cd-delay-ms: Set delay time before detecting card after card insert interrupt.
> +  It's only valid when cd-gpios is present.
>  - wp-inverted: when present, polarity on the WP line is inverted. See the note
>    below for the case, when a GPIO is used for the WP line
>  - disable-wp: When set no physical WP line is present. This property should
> -- 
> 1.9.1
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
