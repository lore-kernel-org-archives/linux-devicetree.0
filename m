Return-Path: <SRS0=NEV/=QQ=tronnes.org=noralf@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: add missing semicolon in example
References: <1549612293-5674-1-git-send-email-akinobu.mita@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <968300ac-0b64-2793-6d51-9b6558a29f6c@tronnes.org>
Date: Sat, 9 Feb 2019 14:14:55 +0100
MIME-Version: 1.0
In-Reply-To: <1549612293-5674-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
To: Akinobu Mita <akinobu.mita@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>



Den 08.02.2019 08.51, skrev Akinobu Mita:
> Add missing semicolon in example for Sitronix ST7735R display panels.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/sitronix,st7735r.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> index f0a5090..cd5c718 100644
> --- a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> @@ -20,7 +20,7 @@ Example:
>  	backlight: backlight {
>  		compatible = "gpio-backlight";
>  		gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
> -	}
> +	};
>  
>  	...
>  
> 

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
