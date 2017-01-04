From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: pca953x: Add optional reset gpio control
Date: Wed, 4 Jan 2017 07:22:31 -0600
Message-ID: <20170104132231.jlhqwngaeza7duoo@rob-hp-laptop>
References: <1483391271-17304-1-git-send-email-steve_longerbeam@mentor.com>
 <1483391271-17304-2-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483391271-17304-2-git-send-email-steve_longerbeam@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 02, 2017 at 01:07:51PM -0800, Steve Longerbeam wrote:
> Add optional reset-gpios pin control. If present, de-assert the
> specified reset gpio pin to bring the chip out of reset.
> 
> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |  4 ++++
>  drivers/gpio/gpio-pca953x.c                             | 11 +++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> index 08dd15f..da54f4c 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> @@ -29,6 +29,10 @@ Required properties:
>  	onsemi,pca9654
>  	exar,xra1202
>  
> +Optional properties:
> + - reset-gpios: GPIO specification for the RESET input

Need to specify active high or low.

> +
> +
>  Example:
>  
>  
