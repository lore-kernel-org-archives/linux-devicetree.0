From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V4 1/3] dt-bindings: watchdog: add description for
 UniPhier WDT controller
Date: Tue, 20 Jun 2017 13:55:26 -0700
Message-ID: <20170620205526.GD28761@roeck-us.net>
References: <1497426825-25450-1-git-send-email-hayashibara.keiji@socionext.com>
 <1497426825-25450-2-git-send-email-hayashibara.keiji@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1497426825-25450-2-git-send-email-hayashibara.keiji@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keiji Hayashibara <hayashibara.keiji@socionext.com>
Cc: wim@iguana.be, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org, yamada.masahiro@socionext.com, hayashi.kunihiko@socionext.com, owada.kiyoshi@socionext.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 14, 2017 at 04:53:43PM +0900, Keiji Hayashibara wrote:
> Add uniphier-wdt dt-bindings documentation.
> 
> Signed-off-by: Keiji Hayashibara <hayashibara.keiji@socionext.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/uniphier-wdt.txt    | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt b/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
> new file mode 100644
> index 0000000..bf63375
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
> @@ -0,0 +1,20 @@
> +UniPhier watchdog timer controller
> +
> +This UniPhier watchdog timer controller must be under sysctrl node.
> +
> +Required properties:
> +- compatible: should be "socionext,uniphier-wdt"
> +
> +Example:
> +
> +	sysctrl@61840000 {
> +		compatible = "socionext,uniphier-ld11-sysctrl",
> +			     "simple-mfd", "syscon";
> +		reg = <0x61840000 0x4000>;
> +
> +		watchdog {
> +			compatible = "socionext,uniphier-wdt";
> +		}
> +
> +		other nodes ...
> +	};
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
