From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: Document the hi3660 reset bindings
Date: Tue, 06 Dec 2016 14:42:33 +0100
Message-ID: <1481031753.3202.57.camel@pengutronix.de>
References: <1480989092-31847-1-git-send-email-zhangfei.gao@linaro.org>
         <1480989092-31847-2-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480989092-31847-2-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 06.12.2016, 09:51 +0800 schrieb Zhangfei Gao:
> Add DT bindings documentation for hi3660 SoC reset controller.
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/reset/hisilicon,hi3660-reset.txt      | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> new file mode 100644
> index 0000000..178e478
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> @@ -0,0 +1,36 @@
> +Hisilicon System Reset Controller
> +======================================
> +
> +Please also refer to reset.txt in this directory for common reset
> +controller binding usage.
> +
> +The reset controller registers are part of the system-ctl block on
> +hi3660 SoC.
> +
> +Required properties:
> +- compatible: should be
> +		 "hisilicon,hi3660-reset"
> +- #reset-cells: 2, see below
> +- hisi,rst-syscon: phandle of the reset's syscon.
> +
> +Example:
> +	iomcu: iomcu@ffd7e000 {
> +		compatible = "hisilicon,hi3660-iomcu", "syscon";
> +		reg = <0x0 0xffd7e000 0x0 0x1000>;
> +	};
> +
> +	iomcu_rst: iomcu_rst_controller {
> +		compatible = "hisilicon,hi3660-reset";
> +		hisi,rst-syscon = <&iomcu>;
> +		#reset-cells = <2>;
> +	};
> +
> +Specifying reset lines connected to IP modules
> +==============================================
> +example:
> +
> +        i2c0: i2c@..... {
> +                ...
> +		resets = <&iomcu_rst 0x20 3>; /* offset: 0x20; bit: 3 */

Should this mention somewhere what register the offset is supposed to
point to? This is the address offset to the set register, with the
corresponding clear register being placed at offset + 4.

> +                ...
> +        };

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
