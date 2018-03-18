Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Mar 2018 07:47:57 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: media: rcar_vin: Use status "okay"
Message-ID: <20180317231028.xehdgkpagjs6nerm@rob-hp-laptop>
References: <1520588080-31264-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520588080-31264-1-git-send-email-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 09, 2018 at 10:34:40AM +0100, Geert Uytterhoeven wrote:
> According to the Devicetree Specification, "ok" is not a valid status.

Correct.

> Fixes: 47c71bd61b772cd7 ("[media] rcar_vin: add devicetree support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> For the checkpatch TODO list?
> https://www.devicetree.org/
> 
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/rcar_vin.txt
> index 68c5c497b7fa5551..a19517e1c669eb35 100644
> --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> @@ -81,7 +81,7 @@ Board setup example for Gen2 platforms (vin1 composite video input)
>  -------------------------------------------------------------------
>  
>  &i2c2   {
> -        status = "ok";
> +        status = "okay";

However, I prefer that status not be in examples as it applies to any 
node and the SoC/board split is not relevant to binding docs. I'd 
cleaned all these up except for the cases with SoC/board split.

>          pinctrl-0 = <&i2c2_pins>;
>          pinctrl-names = "default";
>  
> @@ -104,7 +104,7 @@ Board setup example for Gen2 platforms (vin1 composite video input)
>          pinctrl-0 = <&vin1_pins>;
>          pinctrl-names = "default";
>  
> -        status = "ok";
> +        status = "okay";
>  
>          port {
>                  #address-cells = <1>;
> -- 
> 2.7.4
> 
