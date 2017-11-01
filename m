From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Input: egalax-ts: Remove leading zero from
 'egalax-ts@04' notation
Date: Wed, 1 Nov 2017 16:47:47 -0500
Message-ID: <20171101214747.qjf5nnvdnbi4jg6a@rob-hp-laptop>
References: <1509382850-15821-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1509382850-15821-1-git-send-email-marco.franchi@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Franchi <marco.franchi@nxp.com>
Cc: dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, festevam@gmail.com, marcofrk@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Oct 30, 2017 at 03:00:50PM -0200, Marco Franchi wrote:
> Improve the binding example by removing the leading 0 from 'egalax-ts@04' 
> notation, which fix the following build warning:
> 
> Warning (unit_address_format): Node /egalax_ts@04 unit name should not have leading 0s
> 
> Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
> index 49fa14e..707f248 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
> @@ -10,7 +10,7 @@ Required properties:
>  
>  Example:
>  
> -	egalax_ts@04 {
> +	egalax_ts@4 {

That really should be 'touchscreen@4'.

>  		compatible = "eeti,egalax_ts";
>  		reg = <0x04>;
>  		interrupt-parent = <&gpio1>;
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
