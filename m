From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC v2: PATCH 1/2] dt-bindings: Document the hi3660 reset
 bindings
Date: Thu, 24 Nov 2016 10:26:45 +0100
Message-ID: <1479979605.2472.4.camel@pengutronix.de>
References: <Arnd Bergmann <arnd@arndb.de>,>
         <1479888476-13138-1-git-send-email-zhangfei.gao@linaro.org>
         <1479888476-13138-2-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479888476-13138-2-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 23.11.2016, 16:07 +0800 schrieb Zhangfei Gao:
> Add DT bindings documentation for hi3660 SoC reset controller.
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/reset/hisilicon,hi3660-reset.txt      | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> new file mode 100644
> index 0000000..250daf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.txt
> @@ -0,0 +1,51 @@
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
> +- #reset-cells: 1, see below
> +- hisi,rst-syscon: phandle of the reset's syscon.
> +- hisi,reset-bits: Contains the reset control register information
> +		  Should contain 2 cells for each reset exposed to
> +		  consumers, defined as:
> +			Cell #1 : offset from the syscon register base
> +			Cell #2 : bits position of the control register
> +
> +Example:
> +	iomcu: iomcu@ffd7e000 {
> +		compatible = "hisilicon,hi3660-iomcu", "syscon";
> +		reg = <0x0 0xffd7e000 0x0 0x1000>;
> +	};
> +
> +	iomcu_rst: iomcu_rst_controller {

This should be
	iomcu_rst: reset-controller {

> +		compatible = "hisilicon,hi3660-reset";
> +		#reset-cells = <1>;
> +		hisi,rst-syscon = <&iomcu>;
> +		hisi,reset-bits = <0x20 0x8		/* 0: i2c0 */
> +				   0x20 0x10		/* 1: i2c1 */
> +				   0x20 0x20		/* 2: i2c2 */
> +				   0x20 0x8000000>;	/* 3: i2c6 */
> +	};

The reset lines are controlled through iomcu bits, is there a reason not
to put the iomcu_rst node inside the iomcu node? That way the
hisi,rst-syscon property could be removed and the syscon could be
retrieved via the reset-controller parent node.

> +Specifying reset lines connected to IP modules
> +==============================================
> +example:
> +
> +        i2c0: i2c@..... {
> +                ...
> +		resets = <&iomcu_rst 0>;
> +                ...
> +        };
> +
> +	i2c1: i2c@..... {
> +                ...
> +		resets = <&iomcu_rst 1>;
> +                ...
> +        };

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
