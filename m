From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH 2/4] dt-bindings: power: reset: Add document for
 sram-reboot-mode driver
Date: Thu, 4 Aug 2016 13:08:52 -0500
Message-ID: <20160804180852.GA5967@rob-hp-laptop>
References: <1470265523-27557-1-git-send-email-john.stultz@linaro.org>
 <1470265523-27557-3-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470265523-27557-3-git-send-email-john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vishal Bhoj <vishal.bhoj-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 03, 2016 at 04:05:21PM -0700, John Stultz wrote:
> Add device tree binding document for reboot-mode driver
> 
> Cc: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Heiko Stübner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Vishal Bhoj <vishal.bhoj-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../bindings/power/reset/sram-reboot-mode.txt      | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/sram-reboot-mode.txt
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/sram-reboot-mode.txt b/Documentation/devicetree/bindings/power/reset/sram-reboot-mode.txt
> new file mode 100644
> index 0000000..0a0ed05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/sram-reboot-mode.txt
> @@ -0,0 +1,35 @@
> +SRAM reboot mode driver

Bindings don't describe drivers.

> +
> +This driver get reboot mode magic value form reboot-mode driver

s/form/from/

> +and stores it in a SRAM address. Then the bootloader
> +can read it and take different action according to the magic
> +value stored.

Might say "on the next reboot" somewhere in here.

> +
> +This DT node should be represented as a sub-node of a "mmio-sram" node.
> +
> +Required properties:
> +- compatible: should be "sram-reboot-mode"
> +- reg: offset from the sram range where to store the magic value(in bytes)
> +
> +The rest of the properties should follow the generic reboot-mode discription
> +found in reboot-mode.txt
> +
> +Example:
> +
> +	sram@5f01000 {
> +		compatible = "mmio-sram";
> +		reg = <0x0 0x05f01000 0x0 0x00001000>;
> +		ranges = <0x0 0x0 0x05f01000 0x00001000>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		reboot-mode@0 {
> +			compatible = "sram-reboot-mode";
> +			reg = <0x0 0x4>;
> +
> +			mode-normal     = <0x77665501>;
> +			mode-bootloader = <0x77665500>;
> +			mode-recovery   = <0x77665502>;
> +		};
> +	};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
