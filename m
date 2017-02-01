From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 5/9] Documentation: DT: add entries for I2SE boards
Date: Wed, 1 Feb 2017 11:18:38 -0600
Message-ID: <20170201171838.vihswvpdro54aqiq@rob-hp-laptop>
References: <1485845475-3129-1-git-send-email-michael.heimpold@i2se.com>
 <1485845475-3129-6-git-send-email-michael.heimpold@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1485845475-3129-6-git-send-email-michael.heimpold-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Heimpold <michael.heimpold-eS4NqCHxEME@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 31, 2017 at 07:51:11AM +0100, Michael Heimpold wrote:
> From: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>

"dt-bindings: arm:" is preferred subject prefix.

> 
> This patch adds the missing devicetree binding documentation for I2SE's
> Duckbill and Duckbill 2 series boards.
> 
> Signed-off-by: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
> Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/i2se.txt | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/i2se.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/i2se.txt b/Documentation/devicetree/bindings/arm/i2se.txt
> new file mode 100644
> index 0000000..9954d86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/i2se.txt
> @@ -0,0 +1,22 @@
> +I2SE Device Tree Bindings
> +-------------------------
> +
> +Duckbill Board
> +Required root node properties:
> +    - compatible = "i2se,duckbill", "fsl,imx28";
> +
> +Duckbill 2 Board
> +Required root node properties:
> +    - compatible = "i2se,duckbill", "fsl,imx28";
> +
> +Duckbill 2 485 Board
> +Required root node properties:
> +    - compatible = "i2se,duckbill", "fsl,imx28";
> +
> +Duckbill 2 EnOcean Board
> +Required root node properties:
> +    - compatible = "i2se,duckbill", "fsl,imx28";
> +
> +Duckbill 2 SPI Board
> +Required root node properties:
> +    - compatible = "i2se,duckbill", "fsl,imx28";

It's kind of pointless to have "i2se,duckbill" if you use the same one 
for all these boards.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
