Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Feb 2018 21:13:35 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] mfd: arizona: Update DT doc to support more standard
 reset binding
Message-ID: <20180219031335.75rw2bdlyrxjt4ff@rob-hp-laptop>
References: <20180214155512.17218-1-ckeepax@opensource.cirrus.com>
 <20180214155512.17218-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180214155512.17218-2-ckeepax@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee.jones@linaro.org, mark.rutland@arm.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Feb 14, 2018 at 03:55:12PM +0000, Charles Keepax wrote:
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> index bdd017686ea5..a1557220825e 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -50,7 +50,7 @@ Required properties:
>  
>  Optional properties:
>  
> -  - wlf,reset : GPIO specifier for the GPIO controlling /RESET
> +  - wlf,reset-gpios : GPIO specifier for the GPIO controlling /RESET

Just reset-gpios is widely used, so you can use that and drop the 
vendor.

>  
>    - clocks: Should reference the clocks supplied on MCLK1 and MCLK2
>    - clock-names: Should contains two strings:
> @@ -70,6 +70,10 @@ Optional properties:
>      Documentation/devicetree/bindings/regulator/regulator.txt
>      (wm5102, wm5110, wm8280, wm8997, wm8998, wm1814)
>  
> +Deprecated properties:
> +
> +  - wlf,reset : GPIO specifier for the GPIO controlling /RESET
> +
>  Also see child specific device properties:
>    Regulator - ../regulator/arizona-regulator.txt
>    Extcon    - ../extcon/extcon-arizona.txt
> -- 
> 2.11.0
> 
