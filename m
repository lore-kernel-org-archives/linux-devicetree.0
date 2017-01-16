From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v1 1/3] dt: bindings: add documentation for zx2967
 family reset controller
Date: Mon, 16 Jan 2017 10:57:31 +0100
Message-ID: <1484560651.8415.14.camel@pengutronix.de>
References: <1484377530-30635-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484377530-30635-1-git-send-email-baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, chen.chaokai-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, wang.qiang01-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Sat, 2017-01-14 at 15:05 +0800, Baoyou Xie wrote:
> This patch adds dt-binding documentation for zx2967 family
> reset controller.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/reset/zte,zx2967-reset.txt   | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt b/Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
> new file mode 100644
> index 0000000..22d590e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
> @@ -0,0 +1,20 @@
> +ZTE zx2967 SoCs Reset Controller
> +=======================================
> +
> +Please also refer to reset.txt in this directory for common reset
> +controller binding usage.
> +
> +Required properties:
> +- compatible: should be one of the following.
> +	* zte,zx296718-reset
> +- reg: physical base address of the controller and length of memory mapped
> +	region.
> +- #reset-cells: must be 1.
> +
> +example:
> +
> +	toprst: reset@1461060 {

That node should be named reset-controller.

> +		compatible = "zte,zx296718-reset";
> +		reg = <0x01461060 0x8>;
> +		#reset-cells = <1>;
> +	};

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
